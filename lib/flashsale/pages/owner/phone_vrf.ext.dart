part of 'phone_vrf.dart';

/*
To improve readability, Use extension
 */

extension FSPhoneVrfPageUIFunctions on FSPhoneVrfPageState {
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
      title: _s!.storeRegPhoneNumberVrf,
    );
  }

  Widget _buildBody(){
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 24.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  // [ title - Phone Verification ]
                  Text(
                    _s!.storeRegPhoneNumberVrf,
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
                  // [ phone number ]
                  Container(
                    // height: 48.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _s!.storeRegPhoneNumber,
                          style: TextStyle(
                            color: AppColor.color1012,
                            fontSize: 14.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8.h,),
                        TextFormField(
                          key: _ownerPhoneKey,
                          //autofocus:true,
                          controller: _ownerPhoneController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 16.sp),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                            border: OutlineInputBorder(),
                            hintText: "${_s!.storeRegExample}) 01012345678",
                            counterText: "",
                            suffixIconConstraints: BoxConstraints(),
                            suffixIcon: Container(
                              padding: EdgeInsets.only(right: 20.w),
                              child: FSButton(
                                width: 70.w,
                                height: 24.h,
                                borderRadius: 2.r,
                                borderColor: (_requestButtonEnabled) ? AppColor.color1019 : AppColor.color1016,
                                buttonColor: (_requestButtonEnabled) ? AppColor.color1019 : AppColor.color1016,
                                text: _s!.storeRegReqCertNum,
                                textColor: AppColor.color101,
                                fontSize: 13.sp,
                                onTap: (){
                                  if (_requestButtonEnabled) _onRequestPressed();
                                },
                              ),
                            ),
                          ),
                          maxLines: 1,
                          maxLength: 20,
                          validator: _validatePhoneNum,
                        ),
                      ],
                    ),
                  ),
                  // [ verification code of phone number ]
                  Container(
                    // height: 48.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        Text(
                          _s!.storeRegCertNum,
                          style: TextStyle(
                            color: AppColor.color1012,
                            fontSize: 14.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8.h,),
                        TextFormField(
                          key: _ownerVrfCodeKey,
                          controller: _ownerVrfCodeController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 16.sp),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                            border: OutlineInputBorder(),
                            hintText: _s!.storeRegEnterCertCode,
                            counterText: "",
                            suffixIconConstraints: BoxConstraints(),
                            suffixIcon: Container(
                              padding: EdgeInsets.only(right: 20.w),
                              child: FSButton(
                                width: 70.w,
                                height: 24.h,
                                borderRadius: 2.r,
                                borderColor: (_verifyButtonEnabled) ? AppColor.color1019 : AppColor.color1016,
                                buttonColor: (_verifyButtonEnabled) ? AppColor.color1019 : AppColor.color1016,
                                text: _s!.storeRegVrfReq,
                                textColor: AppColor.color101,
                                fontSize: 13.sp,
                                onTap: (){
                                  if (_verifyButtonEnabled) _onVerifyPressed();
                                },
                              ),
                            ),
                          ),
                          maxLines: 1,
                          maxLength: 20,
                          validator: _validateCertCode,
                          // validator: _validatePhoneNum,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension FSPhoneVrfPagePrivatePublicFunctions on FSPhoneVrfPageState {
  void _enableVrfBtn(bool enable){
    _verifyButtonEnabled = enable;
  }

  void _enableReqBtn(bool enable){
    _requestButtonEnabled = enable;
  }

  String? _validatePhoneNum(String? value) {
    final RegExp phoneExp = RegExp(r'^[0][0-9]{1,2}[0-9]{3,4}[0-9]{4}$');

    if (!phoneExp.hasMatch(value!))
      return '${_s!.storeRegEnterPhoneNum}. ${_s!.storeRegExample}) 01012345678';

    return null;
  }

  String? _validateCertCode(String? value) {
    if (value!.isEmpty || value.length != 6)
      return '${_s!.storeReg6DigitVrfNum}. ${_s!.storeRegExample}) 123456';

    return null;
  }

  void _onRequestPressed(){
    if (_ownerPhoneKey.currentState!.validate()) {
      String phone = _ownerPhoneController.text;
      _requestCertCode(getDialCode()! + phone.substring(1));
    }
  }

  void _onVerifyPressed(){
    final FormState form = _formKey.currentState!;

    if (form.validate()) {
      String phone = _ownerPhoneController.text;
      _verifyCertCodeType1(getDialCode()! + phone.substring(1), _ownerVrfCodeController.text);
    }
  }
}

extension FSPhoneVrfPageEventFunctions on FSPhoneVrfPageState {
  /*
  define event-related functions in settings page below.
  and add FsSettingsEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase event){
    if(event is FSPhoneVrfRequestCertCode) _requestCertCode(event.phone);
    if(event is FSPhoneVrfVerifyCertCodeType1) _verifyCertCodeType1(event.phone, event.code);
  }

  void _requestCertCode(phone) => BlocProvider.of<FSPhoneVrfBloc>(context).add(FSPhoneVrfRequestCertCode(token: getSSOToken(context)!, phone: phone));
  void _verifyCertCodeType1(phone, code) => BlocProvider.of<FSPhoneVrfBloc>(context).add(FSPhoneVrfVerifyCertCodeType1(
      token: getSSOToken(context)!, phone: phone, code: code)
  );
}