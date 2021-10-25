part of 'store_reg.dart';

/*
To improve readability, Use extension
 */

extension FSStoreRegPageUIFunctions on FSStoreRegPageState {
  Widget _buildPage() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            _buildHeader(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return HeaderBarWidget(
      title: (_update) ?  _s!.storeModStoreInfo: _s!.storeRegStoreReg,
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 24.h,),
          // [ Store Manager Info ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  _s!.storeStoreOwnerInfo,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 16.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                FSDivider(height: 2.h, color: AppColor.color1010),
                SizedBox(height: 24.h,),
                StoreOwnerInfoWidget(key: _storeOwnerKey, storeOwner: StoreOwner.clone(_storeOwner)),
              ],
            ),
          ),
          SizedBox(height: 40.h,),
          // [ Store Info ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  _s!.storeStoreInfo,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 16.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                FSDivider(height: 2.h, color: AppColor.color1010,),
                SizedBox(height: 24.h,),
                StoreInfoInputWidget(key: _storeInfoKey, store: Store.clone(_store), addresses: FSAppState.of(context).addressBook!.addr,),
              ],
            ),
          ),
          // [ business registration ]
          (_update) ?  _buildBusinessReg() : Container(),
          SizedBox(height: 40.h,),
          // [ submit ]
          FSButton(
            width: 335.w,
            height: 52.h,
            borderRadius: 8.r,
            borderColor: AppColor.color1019,
            buttonColor: AppColor.color1019,
            text: (_update) ? _s!.storeRegSaveEdit : _s!.storeRegStoreReg2,
            textColor: AppColor.color101,
            fontSize: 16.sp,
            onTap: (){
              _submitPressed();
            },
          ),
          SizedBox(height: 30.h,),
        ],
      ),
    );
  }

  Widget _buildBusinessReg(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FSTitleWithDesc(context, _s!.myStoreBusinessReg, _s!.myStoreBusinessRegDesc),
          ),
          SizedBox(height: 4.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ImagePickerWidget(
              key: _imagePickerWidgetKey,
              width: 335.w,
              height: 224.h,
              defaultImage: _updateImage,
              desc: _s!.storeRegSelectRegistrationImage,
            ),
          ),
        ],
      ),
    );
  }
}

extension FSStoreRegPagePrivatePublicFunctions on FSStoreRegPageState {
  void _submitPressed(){
    hideSoftKeyboard(context);

    Map<String, dynamic >? ownerMap;
    Map<String, dynamic >? storeMap;
    int? regId;
    int? storeId;

    // get business registration image path
    final ImagePickerWidgetState? pickerWidgetState = (_imagePickerWidgetKey.currentState != null) ? _imagePickerWidgetKey.currentState! : null;
    final String? filePath = pickerWidgetState?.getSelectedFile()?.path;

    StoreOwner? storeOwner = _storeOwnerKey.currentState!.getStoreOwner();
    Store? store = _storeInfoKey.currentState!.getStore();

    // input error
    if(storeOwner == null || store == null){
      showAlertSnackBar(context, _s!.storeRegResubmit);
    }
    // no change
    else if(_store == store && _storeOwner == storeOwner && filePath == null){
      showAlertSnackBar(context, _s!.commonNoChange);
    }
    else{
      if(_store != null) storeId = _store!.id;

      if(_storeOwner == storeOwner) ownerMap = null;
      else{
        ownerMap = storeOwner.toJson();
        // When there is no change in the phone number,
        // and if there is a phone number in the parameter, an authentication error occurs.
        // so the phone number is deleted
        if (_storeOwner!.ownerPhone == storeOwner.ownerPhone) ownerMap.remove('phone');
      }

      if(_store == store) storeMap = null; else storeMap = store.toJson();

      if(_store!.businessReg != null) regId = _store!.businessReg!.id;

      _regUpdateStore(storeId, ownerMap, storeMap, regId, filePath);
    }
  }

  void _storeRegUpdated(userInfo, store, storeOwner, registration){
    if(userInfo != null){
      // register new store
      showAlertDialog(context,
        _s!.storeRegRegSuccess,
        null,
        yes: _s!.commonOK,
        yesOnPressed: (){
          // show manager instruction page
          bool? managerIntroShown = FSAppState.of(context).managerIntroShown;
          if (managerIntroShown == null || managerIntroShown == false){
            Navigator.of(context).pushNamed('fsmanagerintro').then((value){
              FSAppState.of(context).setManagerIntroShown(true);
              // goto home page
              fsHomePageKey.currentState!.setUserInfo(userInfo);
              Navigator.popUntil(context, ModalRoute.withName('fshome'));
            });
          }else{
            // goto home page
            fsHomePageKey.currentState!.setUserInfo(userInfo);
            Navigator.popUntil(context, ModalRoute.withName('fshome'));
          }
        },
        willPopupActive: true,
      );
    }else{
      // update store info
      Navigator.of(context).pop({'store': store, 'storeOwner': storeOwner, 'registration': registration});
    }
  }
}

extension FSStoreRegPageEventFunctions on FSStoreRegPageState {
  /*
  define event-related functions in settings page below.
  and add FsSettingsEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase event){
    if(event is FSStoreRegUpdateStore) _regUpdateStore(event.storeId, event.owner, event.store, event.registrationId, event.filePath);
  }

  void _regUpdateStore(storeId, owner, store, regId, path){
    _progressHUDKey.currentState!.show();
    BlocProvider.of<FSStoreRegBloc>(context).add(FSStoreRegUpdateStore(token: getSSOToken(context)!,
        storeId: storeId, owner: owner, store: store, registrationId: regId, filePath: path));
  }
}