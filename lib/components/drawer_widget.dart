import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/utils/utils.dart';


class MenuItem {
  IconData? icon;
  String title;
  bool showQuestion;          // show question mark?
  String? comment;             // comment when question mark clicked
  bool enabled;                // enable or disable menu
  MenuItem(this.title, this.icon, this.enabled, this.showQuestion, this.comment);
}

class DrawerWidget extends StatefulWidget {
  final List<MenuItem>? subMenuItems;
  final String? name;
  final String? email;
  final String? photoUrl;
  // callback function for menu tapped
  final void Function(String title)? onTap;

  DrawerWidget({
    Key? key,
    this.subMenuItems,
    this.name,
    this.email,
    this.photoUrl,
    this.onTap,
  }) : super(key: key);

  @override
  DrawerWidgetState createState() => DrawerWidgetState();
}

class DrawerWidgetState extends State<DrawerWidget> {
  List<MenuItem>? _menuItems = [];
  List<Widget> _menuWidgets = [];

  @override
  void initState() {
    super.initState();
    _menuItems = widget.subMenuItems;
  }

  @override
  Widget build(BuildContext context) {
    createWidgets();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          color: AppColor.color101, boxShadow: [BoxShadow(color: AppColor.color1002)]),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _menuWidgets,
          ),
        ),
      ),
    );
  }

  void createWidgets(){
    _menuWidgets.clear();
    _menuWidgets.add(SizedBox(height: 30.h));
    _menuWidgets.add(_getCircleAvatar());
    _menuWidgets.add(SizedBox(height: 5.h));
    _menuWidgets.add(_getTextName());
    _menuWidgets.add(SizedBox(height: 5.h));
    _menuWidgets.add(_getTextEmail());
    _menuWidgets.add(SizedBox(height: 30.h));
    _menuItems?.forEach((MenuItem item){
      _menuWidgets.add(_buildRow(item.icon, item.title, item.enabled, showQuestion: item.showQuestion, comment: item.comment));
      _menuWidgets.add(_buildDivider());
    });
  }

  Widget _getCircleAvatar(){
    return Container(
      height: 90.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // gradient: LinearGradient(
        //     colors: [AppColor.color401, AppColor.color402])
      ),
      child: CircleAvatar(
        radius: 40.r,
        backgroundImage: CachedNetworkImageProvider(widget.photoUrl!, ),
      ),
    );
  }

  Widget _getTextName(){
    return Container(
      alignment: Alignment.center,
      child: Text(
        widget.name!,
        style: TextStyle(
            color: AppColor.color201,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _getTextEmail(){
    return Container(
      alignment: Alignment.center,
      child: Text(
        widget.email!,
        style: TextStyle(color: AppColor.color302, fontSize: 16.sp),
      ),
    );
  }

  Widget _buildRow(IconData? icon, String title, bool enabled, {bool showQuestion = false, String? comment}) {
    final TextStyle eStyle = TextStyle(color: AppColor.color302, fontSize: 16.sp);
    final TextStyle dStyle = TextStyle(color: AppColor.color304, fontSize: 16.sp);
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(children: [
          (icon != null) ? Icon(
            icon,
            color: AppColor.color302,
          ) : Container(),
          SizedBox(width: 10.w),
          Text(
            title,
            style: enabled ? eStyle : dStyle,
          ),
          Spacer(),
          showQuestion ? InkWell(
            onTap: () => _questionTapped(comment),
            child: Icon(
              Icons.help,
              color: AppColor.color1008,
            ),
          ) : Container(),
        ]),
      ),
      onTap: () => (enabled) ? widget.onTap!(title) : null,
    );
  }

  void _questionTapped(String? comment){
    S? _s = S.of(context);

    if (comment != null)
      showAlertDialog(context,
        comment,
        null,
        yes: _s.commonOK,
        yesOnPressed: () => Navigator.pop(context),
      );
  }

  Divider _buildDivider() {
    return Divider(
      color: AppColor.color303,
    );
  }
}