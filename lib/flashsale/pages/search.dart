import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/common/constants.dart' as constants;

part 'search.ext.dart';

class FSSearchPage extends StatefulWidget {
  FSSearchPage({Key? key,
  }) : super(key: key);

  @override
  FSSearchPageState createState() => FSSearchPageState();
}

class FSSearchPageState extends State<FSSearchPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  // get the _selectedPosts using category from _post
  // get the _selectedFilteredPosts using search word from _selectedPosts
  List<Posting>? _posts;
  List<dynamic>? _selectedPosts;
  List<dynamic>? _selectedFilteredPosts;

  final _searchFieldController = TextEditingController();
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  int _itemCount = constants.POST_ITEM_INCREMENT;

  // If _searchWord is null, this is the first page display.
  String? _searchWord;
  List<int> _searchCategory = [];

  // ignore: close_sinks
  // debounce function for _searchWordChanged(queryString)
  final _searchOnChange = BehaviorSubject<String>();

  S? _s;                     //application localization

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);

    _searchOnChange.debounceTime(Duration(seconds: 1)).listen((queryString) => _searchWordChanged(queryString));

    super.initState();
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    _setStateData();

    if (_itemCount > _selectedFilteredPosts!.length) _itemCount = _selectedFilteredPosts!.length;

    return Scaffold(
      backgroundColor: AppColor.color101,
      key: _scaffoldKey,
      body: SafeArea(
        child: ProgressHUD(
          key: _progressHUDKey,
          backgroundColor: AppColor.color90,
          borderColor: AppColor.color90,
          textStyle: TextStyle(color: AppColor.color101, fontSize: 14.0),
          indicatorColor: AppColor.color502,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){
              hideSoftKeyboard(context);
            },
            child: _buildPage()
          ),
        ),
      ),
    );
  }
}
