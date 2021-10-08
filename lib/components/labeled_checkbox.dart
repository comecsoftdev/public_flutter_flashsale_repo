import 'package:flutter/material.dart';


class LabeledCheckbox extends StatefulWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    this.contentPadding = const EdgeInsets.all(0),
    this.value = false,
    required this.onTap,
    this.activeColor = Colors.black,
    this.fontSize = 16,
    this.fontColor = Colors.black,
    this.gap = 0.0,
    this.bold = false,
  }): super(key: key);

  final String label;
  final EdgeInsets contentPadding;
  final bool value;
  final Function? onTap;
  final Color activeColor;
  final double fontSize;
  final Color fontColor;
  final double gap;
  final bool bold;

  @override
  LabeledCheckboxState createState() => LabeledCheckboxState();
}

class LabeledCheckboxState extends State<LabeledCheckbox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap?.call(widget.label),
      child: Padding(
        padding: widget.contentPadding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: _value,
              activeColor: widget.activeColor,
              visualDensity: VisualDensity.compact,
              onChanged: (val) => setState(() => _value = val!),
            ),
            SizedBox(
              width: widget.gap,
            ), // you can control gap between checkbox and label with this field
            Flexible(
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  color: widget.fontColor,
                  fontWeight: widget.bold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
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