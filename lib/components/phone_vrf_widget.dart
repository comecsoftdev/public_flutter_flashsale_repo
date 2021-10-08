import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:country_code_picker/country_code_picker.dart';

import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/generated/l10n.dart';

enum PhoneVrfEvent {
  requestTapped,
  verifyTapped,
  verificationFailed,
}

// phone verification page
class PhoneVrfWidget extends StatefulWidget {
  final void Function(PhoneVrfEvent event, String phone, String? code) onTap;

  PhoneVrfWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  PhoneVrfWidgetState createState() => PhoneVrfWidgetState();
}

class PhoneVrfWidgetState extends State<PhoneVrfWidget> {
  final GlobalKey<FormState> _formPhoneNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formCertCodeKey = GlobalKey<FormState>();

  final _phoneNumberController = TextEditingController(
    text: (env['TEST_VRT_PHONE_NUMBER'] != null) ? env['TEST_VRT_PHONE_NUMBER']! : '',
  );
  final _smsCodeController = TextEditingController(
    text: (env['TEST_VRT_SMS_CODE'] != null) ? env['TEST_VRT_SMS_CODE']! : '',
  );

  bool _verifyButtonEnabled = false, _requestButtonEnabled = true;

  S? _s;                     //application localization

  String? _countryCode;
  //String? _dialCode;

  @override
  void initState() {
    super.initState();
    _countryCode = getCountryCode();
    //_dialCode = getDialCode();
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _phoneNumberController.dispose();
    _smsCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formPhoneNumberKey,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 120,
                    margin: EdgeInsets.fromLTRB(10, 2, 2, 2),
                    child: CountryCodePicker(
                      onChanged: (CountryCode countryCode){
                        //_dialCode = countryCode.toString();
                      },
                      initialSelection: _countryCode,
                      favorite: [_countryCode!],
                      alignLeft: true,
                      enabled: false,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(2, 2, 20, 2),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: <Widget>[
                          TextFormField(
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                hintText: '${_s!.storeRegExample}) 01012345678',
                                labelText: _s!.storeRegPhoneNumber
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            validator: _validatePhoneNumber,
                          ),
                          IconButton(
                            padding: EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 0),
                            tooltip: _s!.storeRegReqVrfNumber,
                            iconSize: 30,
                            icon: Icon(Icons.send),
                            color: Theme.of(context).accentColor,
                            disabledColor: Theme.of(context).disabledColor,
                            onPressed: _requestButtonEnabled ? _onRequestPressed : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Form(
            key: _formCertCodeKey,
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 2, 20, 2),
              child: Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  TextFormField(
                    controller: _smsCodeController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      labelText: _s!.storeRegVrfNumber,
                      hintText: '${_s!.storeRegExample}) 123456',
                    ),
                    maxLines: 1,
                    validator: _validateCertCode,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 0),
                    tooltip: _s!.storeRegVrfCertNumber,
                    iconSize: 30,
                    icon: Icon(Icons.send),
                    color: Theme.of(context).accentColor,
                    disabledColor: Theme.of(context).disabledColor,
                    onPressed: _verifyButtonEnabled ? _onVerifyPressed : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _validatePhoneNumber(String? value) {
    final RegExp phoneExp = RegExp(r'^[0][0-9]{1,2}[0-9]{3,4}[0-9]{4}$');

    if (!phoneExp.hasMatch(value!))
      return '${_s!.storeRegExample}) 01012345678';
    return null;
  }

  String? _validateCertCode(String? value) {
    if (value!.isEmpty || value.length != 6)
      return _s!.storeReg6DigitVrfNum;
    return null;
  }

  void _onRequestPressed(){
    final FormState form = _formPhoneNumberKey.currentState!;

    if (form.validate()) {
      String phone = _phoneNumberController.text;
      widget.onTap.call(PhoneVrfEvent.requestTapped, phone, null);
    }
  }

  void _onVerifyPressed(){
    final FormState form1 = _formPhoneNumberKey.currentState!;
    final FormState? form2 = _formCertCodeKey.currentState;

    if (form1.validate() && form2!.validate()) {
      String phone = _phoneNumberController.text;
      widget.onTap.call(PhoneVrfEvent.verifyTapped, phone, _smsCodeController.text);
    }
  }

  void enableVrfBtn(bool enable){
    setState(() {
      _verifyButtonEnabled = enable;
    });
  }

  void enableReqBtn(bool enable){
    setState(() {
      _requestButtonEnabled = enable;
    });
  }
}