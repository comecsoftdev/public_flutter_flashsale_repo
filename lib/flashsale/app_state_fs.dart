import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/accounts/app_state.dart';

final String _selectRuleKey = 'select_rule_key';
final String _lastLatLngKey = 'last_latlng_key';
final String _checkedNoticeKey = 'checked_notice_key';
final String _userIntroShownKey = 'user_intro_shown_key';
final String _managerIntroShownKey = 'manager_intro_shown_key';
final String _addressNodesKey = 'address_nodes_key';
final String _addressBookKey = 'address_book_key';
final String _fsRefreshTokenKey = 'fs_refersh_token_key';
final String _fsPushTokenKey = 'fs_push_token_key';

class FSAppState{
  late LocalStorage _localStorage;

  //String _fsToken;
  //String _fsRefreshToken;
  //String _fsPushToken;
  UserInfo? _userInfo;
  // recursive categories
  List<Category>? _rootCategories;
  AddressBook? _addressBook;
  // _addressNodes is cache for LocAddress. # of MAX_ADDR_HISTORY_COUNT are stored in shared preferences
  LinkedHashMap<String, LocAddress>? _addressNodes;
  List<Notice>? _notices;
  //Map<id, name> converted from recursive categories
  LinkedHashMap? _categoryMap;
  List<Posting>? _posts;
  FsSettings? _fSettings;
  SearchingRule? _searchingRule;
  LatLng? _lastLatLng;
  bool? _userIntroShown;
  bool? _managerIntroShown;
  BlocEventBase? _eventToResend;         // used to authentication error. after refreshing token, re-send this event again.
  List<BitmapDescriptor> _categoryDesc = [];

  //String get fsRefreshToken => _fsRefreshToken;
  //String get fsToken => _fsToken;
  //String get fsPushToken => _fsPushToken;
  SearchingRule? get searchingRule => _searchingRule;
  LatLng? get lastLatLng => _lastLatLng;
  UserInfo? get userInfo => _userInfo;
  AddressBook? get addressBook => _addressBook;
  List<Category>? get rootCategories => _rootCategories;
  List<Notice>? get notices => _notices;
  LinkedHashMap? get categoryMap => _categoryMap;
  List<Posting>? get posts => _posts;
  FsSettings? get fSettings => _fSettings;
  bool? get userIntroShown => _userIntroShown;
  bool? get managerIntroShown => _managerIntroShown;
  BlocEventBase? get eventToResend => _eventToResend;
  List<BitmapDescriptor> get categoryDesc => _categoryDesc;
  // for previously selected location (location history)
  LinkedHashMap<String, LocAddress>? get addressNodes => _addressNodes;

  static FSAppState of(BuildContext context) => RepositoryProvider.of<FSAppState>(context);

  Future<void> init(context) async{
    _localStorage = AppState.of(context).localStorage;

    try{
      _searchingRule = SearchingRule.fromJson(jsonDecode(_localStorage.getString(_selectRuleKey)!));
    }catch (error, stacktrace){
      _searchingRule = SearchingRule();
      setSearchingRule(_searchingRule!);
      logger.d('${this.runtimeType} init exception $error');
    }

    try{
      _lastLatLng = LatLng.fromJson(jsonDecode(_localStorage.getString(_lastLatLngKey)!));
    }catch (error, stacktrace){
      _lastLatLng = null;
      logger.d('${this.runtimeType} init exception $error');
    }

    try{
      // decode addressNodes in shared preferences
      _addressNodes = LinkedHashMap<String, LocAddress>();
      Map<String, dynamic> nodes = jsonDecode(_localStorage.getString(_addressNodesKey)!);
      nodes.forEach((key, value) {
        var d = LocAddress.fromJson(value);
        _addressNodes!.putIfAbsent(key, () => d);
      });
    }catch (error, stacktrace){
      logger.d('${this.runtimeType} init exception $error');
    }

    try{
      _addressBook = AddressBook.fromJson(jsonDecode(_localStorage.getString(_addressBookKey)!));
    }catch (error, stacktrace){
      _addressBook = null;
    }

    _userIntroShown = _localStorage.getBool(_userIntroShownKey);
    _managerIntroShown = _localStorage.getBool(_managerIntroShownKey);
    //_fsRefreshToken = await _localStorage.getSecureString(_fsRefreshTokenKey);
    //_fsPushToken = await _localStorage.getSecureString(_fsPushTokenKey);

    _categoryDesc = await loadCategoryBitmapDesc(constants.numCategory);
  }

  /*
  void setFSToken(String token) async{
    this._fsToken = token;
  }

  void setFSRefreshToken(String refresh) async{
    this._fsRefreshToken = refresh;
    await _localStorage.setSecureString(_fsRefreshTokenKey, refresh);
  }


  void setFSPushToken(String pushToken) async{
    this._fsPushToken = pushToken;
    await _localStorage.setSecureString(_fsPushTokenKey, pushToken);
  }
  */

  void setSearchingRule(SearchingRule rule) async{
    this._searchingRule = rule;
    await _localStorage.setString(_selectRuleKey, jsonEncode(rule.toJson()));
  }

  void setLastLatLng(LatLng latLng) async{
    this._lastLatLng = latLng;
    await _localStorage.setString(_lastLatLngKey, jsonEncode(latLng.toJson()));
  }

  void setUserInfo(UserInfo? userInfo){
    this._userInfo = userInfo;
  }

  void setCategory(List<Category>? categories){
    this._rootCategories = categories;

    // When the app starts and initialized, by default all categories are set to selected.
    List<int> cats = [];
    _rootCategories!.forEach((element) => cats.add(element.id));
    _searchingRule!.categories = cats;
  }

  void setAddressBook(AddressBook? addressBook){
    this._addressBook = addressBook;
    _localStorage.setString(_addressBookKey, jsonEncode(this._addressBook));
  }

  void addAddressNode(LocAddress addressNodes) {
    // store LocAddress in _addressNodes and save _addressNodes to shared preferences
    _addressNodes!.removeWhere((key, value) => key == addressNodes.id.toString());
    _addressNodes!.putIfAbsent(addressNodes.id.toString(), () => addressNodes);
    if (_addressNodes!.length > constants.MAX_ADDR_HISTORY_COUNT)
      _addressNodes!.removeWhere((key, value) => key == _addressNodes!.keys.first);
    _localStorage.setString(_addressNodesKey, jsonEncode(_addressNodes));
  }

  void setCategoryMap(LinkedHashMap categoryMap){
    this._categoryMap = categoryMap;
  }

  void setNotice(List<Notice> notices) async{
    List<int> checkedNotice;

    try{
      checkedNotice = (jsonDecode(_localStorage.getString(_checkedNoticeKey)!) as List).map((e) => e as int).toList();
    }catch (error, stacktrace){
      checkedNotice = [];
    }

    notices.forEach((element) {
      if (checkedNotice.contains(element.id)) element.checked = true;
    });
    checkedNotice = notices.where((e) => e.checked == true).map((e) => e.id).toList();

    this._notices = notices;

    await _localStorage.setString(_checkedNoticeKey, jsonEncode(checkedNotice));
  }

  void setWhattobuySettings(FsSettings? settings){
    this._fSettings = settings;
  }

  void setPosts(List<Posting> posts){
    this._posts = posts;
  }

  void setUserIntroShown(bool show) async{
    this._userIntroShown = show;
    await _localStorage.setBool(_userIntroShownKey, show);
  }

  void setManagerIntroShown(bool show) async{
    this._managerIntroShown = show;
    await _localStorage.setBool(_managerIntroShownKey, show);
  }

  void setEventToResend(BlocEventBase? event) {
    this._eventToResend = event;
  }
}