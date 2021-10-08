part of 'store_transfer.dart';

/*
To improve readability, Use extension
 */

extension FSStoreTransferPageUIFunctions on FSStoreTransferPageState {
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
    if (_type == StoreTransferType.transfer){
      return HeaderBarWidget(
        title: _s!.settingsTransferStoreManagerAuthority,
      );
    }else{
      return HeaderBarWidget(
        title: _s!.settingsGetStoreManagerAuthority,
        trailing: [
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.help,
              color: AppColor.color1008,
            ),
          )
        ],
      );
    }
  }

  Widget _buildBody() {
    if ((_type == StoreTransferType.transfer)) return _getStoreTransferForGiver();
    else return _getStoreTransferForRecipient();
  }

  Widget _getStoreTransferForGiver(){
    return Container(
      child: Column(
        children: [
          SizedBox(height: 32.h,),
          // [ description statement ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: 1.sw,
            child: Text(
              _s!.settingsEmailTransferred,
              style: TextStyle(
                color: AppColor.color1010,
                fontSize: 18.sp,
                fontFamily: "SpoqaHanSansNeo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 16.h,),
          // [ enter email ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextFormField(
              key: _emailKey,
              controller: _emailController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 16.sp),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                border: OutlineInputBorder(),
                counterText: "",
              ),
              maxLines: 1,
              validator: _validateEmail,
            ),
          ),
          SizedBox(height: 32.h,),
          // [ confirmation button ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                FSButton(
                  width: 160.w,
                  height: 52.h,
                  borderRadius: 8.r,
                  borderColor: AppColor.color1019,
                  buttonColor: AppColor.color101,
                  text: _s!.commonCancel,
                  textColor: AppColor.color1019,
                  fontSize: 16.sp,
                  onTap: () => Navigator.pop(context),
                ),
                Spacer(),
                FSButton(
                  width: 160.w,
                  height: 52.h,
                  borderRadius: 8.r,
                  borderColor: AppColor.color1019,
                  buttonColor: AppColor.color1019,
                  text: _s!.storeTransferTransfer,
                  textColor: AppColor.color101,
                  fontSize: 16.sp,
                  onTap: () => _storeTransferTapped(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getStoreTransferForRecipient(){
    return Container(
        width: double.infinity,
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
                  StoreOwnerInfoWidget(key: _storeOwnerKey, storeOwner: StoreOwner.empty()),
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
                  FSDivider(height: 2.h, color: AppColor.color1010),
                  SizedBox(height: 24.h,),
                  StoreInfoInputWidget(key: _storeInfoKey, store: Store.clone(_store), addresses: FSAppState.of(context).addressBook!.addr, readOnly: true,),
                ],
              ),
            ),
            SizedBox(height: 30.h,),
            FSDivider(height: 4.h, color: AppColor.color1016),
            SizedBox(height: 30.h,),
            // [ description statement ]
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                _s!.storeTransferObtainStore,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.color1010,
                  fontSize: 18.sp,
                  fontFamily: "SpoqaHanSansNeo",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 32.h,),
            // [ confirmation button ]
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  FSButton(
                    width: 160.w,
                    height: 52.h,
                    borderRadius: 8.r,
                    borderColor: AppColor.color1019,
                    buttonColor: AppColor.color101,
                    text: _s!.storeTransferDenyPermission,
                    textColor: AppColor.color1019,
                    fontSize: 16.sp,
                    onTap: () => _storeRejectTapped(),
                  ),
                  Spacer(),
                  FSButton(
                    width: 160.w,
                    height: 52.h,
                    borderRadius: 8.r,
                    borderColor: AppColor.color1019,
                    buttonColor: AppColor.color1019,
                    text: _s!.storeTransferGetPermission,
                    textColor: AppColor.color101,
                    fontSize: 16.sp,
                    onTap: () => _storeAcceptTapped(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h,),
          ],
        )
    );
  }
}

extension FSStoreTransferPrivatePublicFunctions on FSStoreTransferPageState {
  String? _validateEmail(String? value) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? '');

    if (!emailValid)
      return _s!.storeTransferEnterEmailCorrectly;
    else return null;
  }

  void _storeTransferTapped(){
    if (_emailKey.currentState!.validate()) {
      _transferStore(_emailController.text, _store.id);
    }
  }

  void _storeAcceptTapped(){
    StoreOwner? storeOwner = _storeOwnerKey.currentState!.getStoreOwner();

    if (storeOwner == null){
      showAlertSnackBar(context, _s!.storeRegResubmit);
    }else{
      showAlertDialog(context,
        _s!.storeTransferAcceptTransfer,
        null,
        yes: _s!.commonOK,
        yesOnPressed: (){
          Navigator.pop(context);
          _transferAccept(_recipient!.storeId, _recipient!.giverId, storeOwner.ownerName, getDialCode()! + storeOwner.ownerPhone.substring(1));
        },
        no: _s!.commonCancel,
        noOnPressed: () => Navigator.pop(context),
      );
    }
  }

  void _storeRejectTapped(){
    showAlertDialog(context,
      _s!.storeTransferRejectTransfer,
      null,
      yes: _s!.commonOK,
      yesOnPressed: (){
        Navigator.pop(context);
        _transferReject(_recipient!.id);
      },
      no: _s!.commonCancel,
      noOnPressed: () => Navigator.pop(context),
    );
  }
}

extension FSStoreTransferPageEventFunctions on FSStoreTransferPageState {
  /*
  define event-related functions in settings page below.
  and add FsSettingsEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase event){
    if(event is FSStoreTransferAccept) _transferAccept(event.storeId, event.giverId, event.name, event.phone);
    if(event is FSStoreTransferTransferStore) _transferStore(event.recipient, event.storeId);
    if(event is FSStoreTransferTransferReject) _transferReject(event.transferId);
  }

  void _transferAccept(storeId, giverId, name, phone) => BlocProvider.of<FSStoreTransferBloc>(context).add(FSStoreTransferAccept(
      token: getSSOToken(context)!, storeId: storeId, giverId: giverId, name: name, phone: phone));

  void _transferReject(id) => BlocProvider.of<FSStoreTransferBloc>(context).add(FSStoreTransferTransferReject(
      token: getSSOToken(context)!, transferId: id));

  void _transferStore(recipient, id) => BlocProvider.of<FSStoreTransferBloc>(context).add(FSStoreTransferTransferStore(
      token: getSSOToken(context)!, recipient: recipient, storeId: id));
}

