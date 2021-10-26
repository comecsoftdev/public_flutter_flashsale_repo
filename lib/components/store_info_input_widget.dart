import 'package:comecsoft/flashsale/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

import 'package:comecsoft/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/common/constants.dart' as constants;


class StoreInfoInputWidget extends StatefulWidget {
  final Store? store;
  final bool readOnly;
  // used to check whether store's address is in an supported area or not.
  final List<LocAddress>? addresses;

  StoreInfoInputWidget({
    Key? key,
    required this.store,
    this.readOnly = false,
    this.addresses,
  }) : super(key: key);

  @override
  StoreInfoInputInputWidgetState createState() => StoreInfoInputInputWidgetState();
}

class StoreInfoInputInputWidgetState extends State<StoreInfoInputWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _categoryController = TextEditingController();
  final _nameController = TextEditingController();
  final _regNoController = TextEditingController();
  final _phoneController = TextEditingController();
  final _carNoController = TextEditingController();
  final _addressController = TextEditingController();
  final _addressDetailController = TextEditingController();

  Store? _store;
  LatLng? _storeLoc;
  // currently only 'FIXED' storeType supported
  late Map<String, String> _storeTypeMap;

  int? _addressId;
  // used to check whether store's address is in an supported area or not.
  List<LocAddress>? _addresses;

  S? _s;                     //application localization

  // keyboard is opening when pressing on a suffix icon inside an Input decoration of a TextField issue
  // https://github.com/flutter/flutter/issues/36948
  final _addressDetailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _store = widget.store?? Store.empty();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _categoryController.text = FSAppState.of(context).categoryMap![_store!.category]?.name ?? '';
    _nameController.text = _store!.placeName;
    _regNoController.text = _store!.rgstNo;
    _phoneController.text = _store!.placePhone;
    _carNoController.text = _store!.carNo ?? '';
    _addressController.text = _store!.address;
    _addressDetailController.text = _store!.addressDetail ?? '';
    if (_store!.lat.isNotEmpty && _store!.lng.isNotEmpty){
      _storeLoc = LatLng(double.parse(_store!.lat), double.parse(_store!.lng));
    }

    _addresses = widget.addresses;

    _s = S.of(context);
    _storeTypeMap = {'FIXED': _s!.storeRegStoreFixed, 'MOVING': _s!.storeRegStoreMoving};
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _categoryController.dispose();
    _nameController.dispose();
    _regNoController.dispose();
    _phoneController.dispose();
    _carNoController.dispose();
    _addressController.dispose();
    _addressDetailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // [ Store category ]
            FSTitleWithDesc(context, _s!.storeRegStoreCategory, _s!.storeRegStoreCategoryDesc),
            SizedBox(height: 4.h,),
            Container(
              child: Container(
                // height: 48.h,
                child: TextFormField(
                  controller: _categoryController,
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 16.sp),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.color1018,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                    border: OutlineInputBorder(),
                    hintText: _s!.storeRegSelectCategory,
                    counterText: "",
                    suffixIconConstraints: BoxConstraints(),
                    suffixIcon: Container(
                      padding: EdgeInsets.only(right: 20.w),
                      child: FSButton(
                        width: 70.w,
                        height: 24.h,
                        borderRadius: 2.r,
                        borderColor: widget.readOnly ? AppColor.color1016 : AppColor.color1019,
                        buttonColor: widget.readOnly ? AppColor.color1016 : AppColor.color1019,
                        text: _s!.searchingRuleCategory,
                        textColor: AppColor.color101,
                        fontSize: 13.sp,
                        onTap: (){
                          if (!widget.readOnly){
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
                              ),
                              context: context,
                              builder: (BuildContext context){
                                return CategoryGridMenuWidget(
                                  categories: FSAppState.of(context).rootCategories,
                                  selected: FSAppState.of(context).searchingRule!.categories,
                                  onChanged: _categoryChanged,
                                  multiSelect: false,
                                );
                              },
                              barrierColor: AppColor.color203,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  maxLines: 1,
                  maxLength: 20,
                  validator: _validateCategory,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            // [ store name ]
            FSTitleWithDesc(context, _s!.storeRegStoreName, _s!.storeRegStoreNameDesc),
            SizedBox(height: 4.h,),
            Container(
              // height: 48.h,
              child: TextFormField(
                readOnly: widget.readOnly,
                controller: _nameController,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                  filled: widget.readOnly,
                  fillColor: widget.readOnly ? AppColor.color1018 : AppColor.color90,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                  border: OutlineInputBorder(),
                  counterText: "",
                ),
                maxLines: 1,
                maxLength: 20,
                onSaved: (String? value) => _store!.placeName = value!,
                validator: _validateName,
              ),
            ),
            SizedBox(height: 16.h),
            // [ store phone number ]
            FSTitleWithDesc(context, _s!.storeRegStorePhoneNumber, _s!.storeRegStorePhoneNumberDesc),
            SizedBox(height: 4.h,),
            Container(
              // height: 48.h,
              child: TextFormField(
                readOnly: widget.readOnly,
                controller: _phoneController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                  filled: widget.readOnly,
                  fillColor: widget.readOnly ? AppColor.color1018 : AppColor.color90,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                  border: OutlineInputBorder(),
                  hintText: '${_s!.storeRegExample}) 0212345678',
                ),
                onSaved: (String? value) => _store!.placePhone = value!,
                validator: _validatePhoneNumber,
              ),
            ),
            SizedBox(height: 16.h),
            // [ store registration Id ]
            FSTitleWithDesc(context, _s!.storeRegStoreRegNo, _s!.storeRegStoreRegNoDesc),
            SizedBox(height: 4.h,),
            Container(
              // height: 48.h,
              child: TextFormField(
                inputFormatters: [
                  MultiMaskedTextInputFormatter(
                      masks: ['xxx-xx-xxxxx'], separator: '-')
                ],
                readOnly: widget.readOnly,
                controller: _regNoController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                  filled: widget.readOnly,
                  fillColor: widget.readOnly ? AppColor.color1018 : AppColor.color90,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                  border: OutlineInputBorder(),
                  hintText: '${_s!.storeRegExample}) 123-45-56789',
                ),
                onSaved: (String? value) => _store!.rgstNo = value!,
                validator: _validateRegNo,
              ),
            ),
            SizedBox(height: 16.h),
            // [ store address ]
            FSTitleWithDesc(context, _s!.storeRegStoreAdr, _s!.storeRegStoreAdrDesc),
            SizedBox(height: 4.h,),
            Container(
              child: Container(
                // height: 48.h,
                child: TextFormField(
                  readOnly: true,
                  controller: _addressController,
                  style: TextStyle(fontSize: 16.sp),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.color1018,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                    border: OutlineInputBorder(),
                    suffixIconConstraints: BoxConstraints(),
                    suffixIcon: Container(
                      padding: EdgeInsets.only(right: 20.w),
                      child: FSButton(
                        width: 70.w,
                        height: 24.h,
                        borderRadius: 2.r,
                        borderColor: widget.readOnly ? AppColor.color1016 : AppColor.color1019,
                        buttonColor: widget.readOnly ? AppColor.color1016 : AppColor.color1019,
                        text: _s!.storeRegFindAddr,
                        textColor: AppColor.color101,
                        fontSize: 13.sp,
                        onTap: (){
                          if (!widget.readOnly){
                            Map<String, dynamic> arguments = {
                              'title': _s!.commonAddressSearch, 'initialHost': env['FS_BASE_URL']!, 'initialPath': env['SEARCH_ADDRESS']!, 'type': WebViewType.WebViewSearchAddress
                            };
                            Navigator.of(context).pushNamed('fswebview', arguments: arguments).then((onValue){
                              setState(() {
                                if (onValue != null){
                                  _addressController.text = onValue as String;
                                  // address changed. _validateLocation should be called.
                                  _storeLoc = null;
                                }
                              });
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  onSaved: (String? value) => _store!.address = value!,
                  validator: _validateAddress,
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            // [ store address detail ]
            FSTitleWithDesc(context, _s!.storeRegStoreAdrDetail, _s!.storeRegStoreAdrDetailDesc),
            SizedBox(height: 4.h,),
            Container(
              child: Container(
                //height: 48.h,
                child: TextFormField(
                  focusNode: _addressDetailFocusNode,
                  readOnly: widget.readOnly,
                  controller: _addressDetailController,
                  style: TextStyle(fontSize: 16.sp),
                  decoration: InputDecoration(
                    filled: widget.readOnly,
                    fillColor: widget.readOnly ? AppColor.color1018 : AppColor.color90,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                    border: OutlineInputBorder(),
                    suffixIconConstraints: BoxConstraints(),
                    suffixIcon: Container(
                      padding: EdgeInsets.only(right: 20.w),
                      child: FSButton(
                        width: 70.w,
                        height: 24.h,
                        borderRadius: 2.r,
                        borderColor: AppColor.color1019,
                        buttonColor: AppColor.color1019,
                        text: _s!.commonLocationCheck2,
                        textColor: AppColor.color101,
                        fontSize: 13.sp,
                        onTap: (){
                          // Unfocus all focus nodes
                          _addressDetailFocusNode.unfocus();

                          // Disable text field's focus node request
                          _addressDetailFocusNode.canRequestFocus = false;

                          _validateLocation(_addressController.text + ' ' + _addressDetailController.text);

                          //Enable the text field's focus node request after some delay
                          Future.delayed(Duration(milliseconds: 100), () {
                            _addressDetailFocusNode.canRequestFocus = true;
                          });
                        },
                      ),
                    ),
                  ),
                  onSaved: (String? value) {
                    _store!.addressDetail = value;
                    _store!.lat = _storeLoc!.latitude.toStringAsFixed(6);
                    _store!.lng = _storeLoc!.longitude.toStringAsFixed(6);
                    _store!.addressId = _addressId ?? _store!.addressId;
                  },
                  validator: _validateAddressDetail,
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            // [ store tags ]
            FSTitleWithDesc(context, _s!.storeRegTagDescription(constants.MAX_TAG_COUNT), _s!.storeRegTagDescriptionDesc),
            SizedBox(height: 4.h,),
            Container(
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: AppColor.color304, width: 1, ),
                  color: widget.readOnly ? AppColor.color1018 : AppColor.color90,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.h),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: _buildChips(_store!.tags!),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20.w),
                      child: FSButton(
                        width: 70.w,
                        height: 24.h,
                        borderRadius: 2.r,
                        borderColor: widget.readOnly ? AppColor.color1016 : AppColor.color1019,
                        buttonColor: widget.readOnly ? AppColor.color1016 : AppColor.color1019,
                        text: _s!.storeRegAddTag,
                        textColor: AppColor.color101,
                        fontSize: 13.sp,
                        onTap: () async{
                          // in case of readonly can't input tags.
                          if (!widget.readOnly) {
                            String tag = await showTextInputDialog(context, _s!.commonInputSearchTag, '');
                            String? res = _validateTag(tag);

                            if(res == null){
                              setState(() {
                                if(_store!.tags == null) _store!.tags = [];
                                _store!.tags!.add(tag);
                              });
                            }else{
                              showAlertDialog(context,
                                res,
                                null,
                                yes: _s!.commonOK,
                                yesOnPressed: () => Navigator.pop(context),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _validateCategory(String? value) {
    if (value!.isEmpty)
      return _s!.storeRegSelectCategory;
    return null;
  }

  String? _validateName(String? value) {
    if (value!.isEmpty)
      return _s!.storeRegEnterStoreNameCorrectly;

    return null;
  }

  String? _validatePhoneNumber(String? value) {
    final RegExp phoneExp = RegExp(r'^[0][0-9]{1,2}[0-9]{3,4}[0-9]{4}$');

    if (!phoneExp.hasMatch(value!))
      return '${_s!.storeRegEnterStorePhoneCorrectly}';
    return null;
  }

  String? _validateRegNo(String? value) {
    final RegExp regIdExp = RegExp(r'^[0-9]{3}-[0-9]{2}-[0-9]{5}$');

    if (!regIdExp.hasMatch(value!))
      return _s!.storeRegEnterStoreRegNoCorrectly;
    return null;
  }

  String? _validateCarNum(String? value) {
    if (_storeTypeMap[_store!.type!] == _s!.storeRegStoreMoving && value!.isEmpty)
      return _s!.storeRegEnterCarNum;

    return null;
  }

  String? _validateAddress(String? value) {
    if (value!.isEmpty)
      return _s!.storeRegEnterAddress;
    return null;
  }

  String? _validateAddressDetail(String? value) {
    if (_storeLoc == null)
      return _s!.storeRegCheckLocation;
    return null;
  }

  void _validateLocation(String address) async{
    double lat, lng;

    try{
      // directly call repository api to get latitude, longitude of address
      // Same address is always cached for constants.REQUEST_LAT_LNG_KAKAO minutes
      RequestLatLngKaKaoResponse? resp = await WhatToBuyRepository().requestLatLngKakao(env['KAKAO_REST_API_KEY']!, address);
      lat = double.parse(resp!.documents![0].y!);
      lng = double.parse(resp.documents![0].x!);
      _addressId = int.parse(resp.documents![0].address!.h_code!);
    }catch(error) {
      // show alert popup of wrong address
      showAlertDialog(context,
        _s!.storeRegStoreLocationNotFound,
        null,
        yes: _s!.commonOK,
        yesOnPressed: () => Navigator.pop(context),
      );
      return;
    }

    // store addressId check.
    // If the store isn't in an supported area, just show alert dialog.
    if (_addresses != null){
      var find = false;

      for(var address in _addresses!) {
        find = LocAddress.findAddressId(address, _addressId);
        if(find) break;
      }

      if(!find && kReleaseMode){
        showAlertDialog(context,
          _s!.storeRegNotSupportedArea,
          _s!.storeRegNotSupportedAreaDesc,
          yes: _s!.commonOK,
          yesOnPressed: () => Navigator.pop(context),
        );
        return;
      }
    }

    // _storeLoc = await showLocationConfDialog(context, _s!.storeRegStoreLocationCheck, _s!.storeRegStoreLocationCheckDesc,
    //     (_storeLoc != null) ? _storeLoc!.latitude : lat, (_storeLoc != null) ? _storeLoc!.longitude : lng);

    Map<String, dynamic> arguments = {
      'latLng': LatLng((_storeLoc != null) ? _storeLoc!.latitude : lat, (_storeLoc != null) ? _storeLoc!.longitude : lng),
      'locationCheckType' : (widget.readOnly) ? LocationCheckType.checkLocation :LocationCheckType.selectLocation
    };

    Navigator.of(context).pushNamed('fslocation', arguments: arguments).then((value){
      if(value != null){
        _storeLoc = value as LatLng;
        // If there is a lot of difference between the actual store address and the selected location,
        double distanceInMeters = Geolocator.distanceBetween(lat, lng, _storeLoc!.latitude, _storeLoc!.longitude);
        if (distanceInMeters > 100){
          _storeLoc = null;
          showAlertDialog(context,
            _s!.storeRegALotDifferenceAddressLocation,
            null,
            yes: _s!.commonOK,
            yesOnPressed: () => Navigator.pop(context),
          );
        }
      }
    });
  }

  String? _validateTag(String tag) {
    final RegExp nameExp = RegExp(r'^[A-Za-z가-힣1-9]+$');
    int utf8Len = utf8.encode(tag).length;

    if (!nameExp.hasMatch(tag) || utf8Len < 5 || utf8Len > 19)
      return _s!.commonErrorInputSearchTag;

    if (_store!.tags!.length >= constants.MAX_TAG_COUNT)
      return _s!.commonErrorMaxSearchTag;

    return null;
  }

  Widget _buildChips(tags) {
    List<Widget> chips = [];
    chips.add(SizedBox(width: 7.w,));

    for (int i = 0; i < tags.length; i++) {
      Chip actionChip = Chip(
        label: Text(tags[i]),
        labelPadding: EdgeInsets.symmetric(horizontal: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 0.h),
        elevation: 1.0,
        backgroundColor: AppColor.color306,
        onDeleted: () {
          setState(() {
            tags.removeAt(i);
          });
        },
      );

      chips.add(actionChip);
      chips.add(SizedBox(width: 7,));
    }

    return Row(
      children: chips,
    );
  }

  void _categoryChanged({List<int>? selected}){

    // single select callback.
    // only 1 item exists in selected
    if(selected!.length == 1){
      setState(() {
        _categoryController.text = FSAppState.of(context).categoryMap![selected[0]].abbr ?? '';
      });
      _store!.category = selected[0];
    }
  }

  Store? getStore(){
    final FormState form = _formKey.currentState!;

    if(form.validate()){
      form.save();
      return _store;
    }else return null;
  }
}