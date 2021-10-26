import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:comecsoft/common/constants.dart' as constants;

import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/generated/l10n.dart';

// show AlertSnackBar
void showAlertSnackBar(BuildContext context, String content, {int duration = 3}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: duration),
      content: Row(
        children: [
          Icon(
            Icons.error,
            color: Colors.white,
          ),
          Text('  $content'),
        ],
      ),
  ));
}

// show AlertSnackBar
void showSnackBar(BuildContext context, String content, int time){
  // remove snackbar before display new one
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: time),
      content: Text(content)
  ));
}


Widget _buildDialogButton(String a, Function b, {color}){
  color = color ?? AppColor.color1019;

  return DialogButton(
    width: 112.w,
    height: 40.h,
    radius: BorderRadius.circular(28.r),
    border: Border.all(color: (color == AppColor.color101) ? AppColor.color1009 : color, width: 1.w, ),
    color: color,
    child: Text(
      a,
      style: TextStyle(
        color: (color == AppColor.color101) ? AppColor.color1012 : AppColor.color101,
        fontSize: 16.sp,
        fontFamily: "SpoqaHanSansNeo",
        fontWeight: FontWeight.w700,
      ),
    ),
    onPressed: b as void Function()?,
  );
}

// show AlertDialog
void showAlertDialog(BuildContext context, String title, String? desc,
    {Function()? yesOnPressed, Function()? noOnPressed, String? yes, String? no, bool willPopupActive=false,
      AlertType alertType = AlertType.none, descTextAlign=TextAlign.center}){

  List<DialogButton> buttons = [];

  if (no != null && noOnPressed != null) buttons.add(_buildDialogButton(no, noOnPressed, color: AppColor.color101) as DialogButton);
  if (yes != null && yesOnPressed != null) buttons.add(_buildDialogButton(yes, yesOnPressed) as DialogButton);

  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: (buttons.length >0) ? false : true,
    isOverlayTapDismiss: false,
    overlayColor: AppColor.color202,
    titleStyle: TextStyle(
      color: AppColor.color1010,
      fontSize: 20.sp,
      fontFamily: "SpoqaHanSansNeo",
      fontWeight: FontWeight.w700,
    ),
    descStyle: TextStyle(
      color: AppColor.color1010,
      fontSize: 18.sp,
      fontFamily: "SpoqaHanSansNeo",
      fontWeight: FontWeight.w500,
    ),
    descTextAlign: descTextAlign,
  );

  Alert(
    context: context,
    style: alertStyle,
    type: alertType,
    title: title,
    desc: desc,
    buttons: buttons,
    onWillPopActive: willPopupActive,
  ).show();
}

// show AlertDialog async
Future<String> showAlertDialogAsync(BuildContext context, String title, String? desc,
    {String? yes, String? no, bool willPopupActive=false}) async{

  var completer = Completer<String>();
  List<DialogButton> buttons = [];

  if (no != null) buttons.add(_buildDialogButton(no, (){
    Navigator.pop(context);
    completer.complete(no);
  }) as DialogButton);
  if (yes != null) buttons.add(_buildDialogButton(yes, (){
    Navigator.pop(context);
    completer.complete(yes);
  }) as DialogButton);

  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: (buttons.length >0) ? false : true,
    isOverlayTapDismiss: false,
    overlayColor: AppColor.color202,
    titleStyle: TextStyle(
      color: AppColor.color1010,
      fontSize: 22.sp,
      fontFamily: "SpoqaHanSansNeo",
      fontWeight: FontWeight.w700,
    ),
    descStyle: TextStyle(
      color: AppColor.color1010,
      fontSize: 18.sp,
      fontFamily: "SpoqaHanSansNeo",
      fontWeight: FontWeight.w500,
    ),
  );

  Alert(
    context: context,
    style: alertStyle,
    type: AlertType.warning,
    title: title,
    desc: desc,
    buttons: buttons,
    onWillPopActive: willPopupActive,
  ).show();

  return completer.future;
}

// show AlertDialog
void showAlertDialogWithContent(BuildContext context, String title, Widget content,
    {Function()? yesOnPressed, Function()? noOnPressed, String? yes, String? no, bool willPopupActive=false,
      EdgeInsets alertPadding = const EdgeInsets.fromLTRB(40, 20, 40, 20)}){

  List<DialogButton> buttons = [];

  if (no != null && noOnPressed != null) buttons.add(_buildDialogButton(no, noOnPressed) as DialogButton);
  if (yes != null && yesOnPressed != null) buttons.add(_buildDialogButton(yes, yesOnPressed) as DialogButton);

  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: (buttons.length >0) ? false : true,
    isOverlayTapDismiss: false,
    overlayColor: AppColor.color202,
    alertPadding: alertPadding,
  );

  Alert(
    context: context,
    style: alertStyle,
    type: AlertType.none,
    title: title,
    content: content,
    buttons: buttons,
    onWillPopActive: willPopupActive,
  ).show();
}

Future<String> showTextInputDialog(BuildContext context, String title, String? content, {int min=1, int max=1, String hint='', double width = 250}) async {
  S _s = S.of(context);

  var completer = Completer<String>();

  String newContent = content ?? '';

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Container(
          width: width,
          child: TextField(
            controller: TextEditingController(text: newContent),
            onChanged: (value) {
              newContent = value;
            },
            decoration: InputDecoration(hintText: hint),
            autofocus: true,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(_s.commonCancel),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text(_s.commonOK),
            onPressed: () {
              Navigator.pop(context);
              completer.complete(newContent);
            },
          ),
        ],
      );
    }
  );

  return completer.future;
}

Future<LatLng> showLocationConfDialog(BuildContext context, String title, String desc, double lat, double lng,
    {MapPurpose purpose = MapPurpose.selectLocMap}) async {
  GlobalKey<MapWidgetState> selectMapScreenKey = new GlobalKey();
  var completer = Completer<LatLng>();
  S _s = S.of(context);

  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    overlayColor: AppColor.color202,
    descStyle: TextStyle(
      color: AppColor.color701,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
  );

  Alert(
      style: alertStyle,
      context: context,
      title: title,
      desc: desc,

      content:Container(
        width: 300,
        height: 400,
        child: MapWidget(key: selectMapScreenKey, center: LatLng(lat, lng), zoom: 16, mapPurpose: purpose,),
      ),
      buttons: [
        _buildDialogButton(_s.commonCancel, (){
          Navigator.pop(context);
        }) as DialogButton,
        _buildDialogButton(_s.commonDone, (){
          Navigator.pop(context);
          double lat = selectMapScreenKey.currentState!.center!.latitude;
          double lng = selectMapScreenKey.currentState!.center!.longitude;
          completer.complete(LatLng(lat, lng));
        }) as DialogButton,
      ]).show();

  return completer.future;
}

// show SlideSheet from right to left
void showSideSheet({
  required BuildContext context,
  Widget? content,
  bool rightSide = true,
  double width = 300,
  double height = 300,
  double bottom = 20,
  double right = 20
})
{
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 500),
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: (rightSide ? Alignment.bottomRight : Alignment.bottomLeft),
        child: Container(
          margin: EdgeInsets.only(right: right, bottom: bottom),
          height: height,
          width: width,
          child: Material(child: Scrollbar(child: SingleChildScrollView(child: content))),
        ),
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      var curve = Curves.easeInSine;
      var tween = Tween(begin: Offset((rightSide ? 1 : -1), 0), end: Offset(0, 0)).chain(CurveTween(curve: curve));

      return SlideTransition(
        position:animation1.drive(tween),
        child: child,
      );
    },
  );
}

// show SlideSheet from right to left
Future<dynamic> showSideSheetAsync({
  required BuildContext context,
  Widget? content,
  bool rightSide = true,
  double width = 300,
  double height = 300,
  double bottom = 20,
  double right = 20,
  Color barrierColor = const Color(0x80000000)
})
{
  return showGeneralDialog<dynamic>(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: barrierColor,
    transitionDuration: Duration(milliseconds: 300),
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: (rightSide ? Alignment.bottomRight : Alignment.bottomLeft),
        child: Container(
          margin: EdgeInsets.only(right: right, bottom: bottom),
          height: height,
          width: width,
          child: Material(child: Scrollbar(child: SingleChildScrollView(child: content))),
        ),
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      var curve = Curves.easeInSine;
      var tween = Tween(begin: Offset((rightSide ? 1 : -1), 0), end: Offset(0, 0)).chain(CurveTween(curve: curve));

      return SlideTransition(
        position:animation1.drive(tween),
        child: child,
      );
    },
  );
}

// show FadeSheet
void showFadeSheet({
  required BuildContext context,
  Widget? content,
  double width = 300,
  double height = 300,
  double bottom = 20,
  double right = 20,
  Alignment alignment = Alignment.center
})
{
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 500),
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: alignment,
        child: Container(
          margin: EdgeInsets.only(right: right, bottom: bottom),
          height: height,
          width: width,
          child: Material(child: Scrollbar(child: SingleChildScrollView(child: content))),
        ),
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      return FadeTransition(
        opacity:animation1,
        child: child,
      );
    },
  );
}

// show FadeSheetAsync
Future<dynamic> showFadeSheetAsync({
  required BuildContext context,
  Widget? content,
  double width = 300,
  double height = 300,
  double bottom = 20,
  double right = 20,
  Color barrierColor = const Color(0x80000000),
  Alignment alignment = Alignment.center,
  BorderRadiusGeometry? borderRadius,
})
{
  return showGeneralDialog<dynamic>(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: barrierColor,
    transitionDuration: Duration(milliseconds: 100),
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: alignment,
        child: Container(
          margin: EdgeInsets.only(right: right, bottom: bottom),
          height: height,
          width: width,
          child: Material(
            borderRadius: borderRadius,
            child: Scrollbar(
              child: SingleChildScrollView(
                child: content
              )
            )
          ),
        ),
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      return FadeTransition(
        opacity:animation1,
        child: child,
      );
    },
  );
}

// show popup menu
Future<String> showPopupMenu(context, List<String> menus, offset) async {
  double left = offset.dx;
  double top = offset.dy;

  List<PopupMenuEntry<dynamic>> items = [];

  menus.forEach((element) {
    dynamic item = PopupMenuItem<String>(
      child: Text(
        element,
      ),
      value: element
    );
    items.add(item);
  });

  String selected = await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(left, top, left+1, top+1),
    items: items,
    elevation: 8.0,
  );

  return selected;
}