import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/utils/utils.dart';


class StoreOwnerInfoWidget extends StatefulWidget {
  final StoreOwner? storeOwner;

  StoreOwnerInfoWidget({
    Key? key,
    required this.storeOwner,
  }) : super(key: key);

  @override
  StoreOwnerInfoWidgetState createState() => StoreOwnerInfoWidgetState();
}

class StoreOwnerInfoWidgetState extends State<StoreOwnerInfoWidget>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _ownerPhoneKey = GlobalKey<FormFieldState>();

  final _ownerNameController = TextEditingController();
  final _ownerPhoneController = TextEditingController();

  StoreOwner? _storeOwner;

  S? _s;                     //application localization

  @override
  void initState() {
    super.initState();
    _storeOwner = widget.storeOwner?? StoreOwner.empty();
    _ownerNameController.text = _storeOwner?.ownerName ?? '';
    _ownerPhoneController.text = _storeOwner?.ownerPhone ?? '';
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _ownerNameController.dispose();
    _ownerPhoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // [ store owner name ]
            FSTitleWithDesc(context, _s!.storeRegManagerName, _s!.storeRegManagerNameDesc),
            SizedBox(height: 4.h,),
            Container(
              // height: 48.h,
              child: TextFormField(
                controller: _ownerNameController,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                  border: OutlineInputBorder(),
                  // hintText: '${_s!.storeRegExample}) ${_s!.storeRegAnyName}',
                  counterText: "",
                ),
                maxLines: 1,
                maxLength: 10,
                onSaved: (String? value) => _storeOwner!.ownerName = value,
                validator: _validateName,
              ),
            ),
            SizedBox(height: 16.h),
            // [ store owner phone number ]
            FSTitleWithDesc(context, _s!.storeRegManagerPhone, _s!.storeRegManagerPhoneDesc),
            SizedBox(height: 4.h,),
            Container(
              // height: 48.h,
              child: TextFormField(
                readOnly: true,
                key: _ownerPhoneKey,
                controller: _ownerPhoneController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.color1018,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                  border: OutlineInputBorder(),
                  hintText: _s!.storeRegGetPhoneVerification,
                  counterText: "",
                  suffixIconConstraints: BoxConstraints(),
                  suffixIcon: Container(
                    padding: EdgeInsets.only(right: 20.w),
                    child: FSButton(
                      width: 70.w,
                      height: 24.h,
                      borderRadius: 2.r,
                      borderColor: AppColor.color1019,
                      buttonColor: AppColor.color1019,
                      text: _s!.storeRegPhoneVrf,
                      textColor: AppColor.color101,
                      fontSize: 13.sp,
                      onTap: (){
                        Navigator.of(context).pushNamed('fsphonevrf',).then((value){
                          setState(() {
                            if(value != null) {
                              _ownerPhoneController.text = value as String;
                            }
                          });
                        });
                      },
                    ),
                  ),
                ),
                maxLines: 1,
                maxLength: 20,
                onSaved: (String? value) => _storeOwner!.ownerPhone = value!,
                validator: _validatePhoneNum,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    final RegExp nameExp = RegExp(r'^[A-Za-z가-힣1-9 ]+$');

    if (!nameExp.hasMatch(value!))
      return "${_s!.storeRegEnterNameCorrectly}. ${_s!.storeRegExample}) ${_s!.storeRegAnyName}";
    return null;
  }

  String? _validatePhoneNum(String? value) {
    final RegExp phoneExp = RegExp(r'^[0][0-9]{1,2}[0-9]{3,4}[0-9]{4}$');

    if (!phoneExp.hasMatch(value!))
      return '${_s!.storeRegGetPhoneVerification}. ${_s!.storeRegExample}) 01012345678';

    if (value.isEmpty)
      return _s!.storeRegVerifyPhoneNum;
    return null;
  }

  StoreOwner? getStoreOwner(){
    final FormState form = _formKey.currentState!;

    if(form.validate()){
      form.save();
      return _storeOwner;
    }else return null;
  }
}