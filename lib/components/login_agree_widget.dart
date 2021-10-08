import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;


class LoginAgreeWidget extends StatefulWidget {
  const LoginAgreeWidget({
    Key? key,
    required this.label,
    this.contentPadding = const EdgeInsets.all(0),
    this.value = false,
    required this.onTap,
    this.checkBoxActiveColor = Colors.black,
    this.fontSize = 14,
    this.fontColor = Colors.black,
    this.gap = 0.0,
    this.bold = false,
  }): super(key: key);

  final String label;
  final EdgeInsets contentPadding;
  final bool value;
  final Function? onTap;
  final Color checkBoxActiveColor;
  final double fontSize;
  final Color fontColor;
  final double gap;
  final bool bold;

  @override
  LoginAgreeWidgetState createState() => LoginAgreeWidgetState();
}

class LoginAgreeWidgetState extends State<LoginAgreeWidget> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap?.call(widget.label),
      child: Container(
        padding: EdgeInsets.only(left: 40.w, right: 50.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Checkbox(
                  value: _value,
                  activeColor: widget.checkBoxActiveColor,
                  visualDensity: VisualDensity.compact,
                  onChanged: (val) => setState(() => _value = val!),
                ),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.fontColor,
                    fontSize: widget.fontSize,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColor.color303,
              size: 15.r,
            ),
          ],
        ),
      ),
    );
  }

  bool getCheckBoxValue(){
    return _value;
  }
}