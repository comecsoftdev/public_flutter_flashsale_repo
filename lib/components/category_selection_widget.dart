import 'package:flutter/material.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;

class CategorySelectionWidget extends StatefulWidget {
  // list of category
  final List<Category>? categories;
  // list of selected category ids
  final List<int>? selected;
  final bool multiSelect;

  // send selected category ids as parameter
  final void Function({List<int>? selected}) onChanged;

  CategorySelectionWidget({
    Key? key,
    required this.categories,
    required this.selected,
    required this.onChanged,
    this.multiSelect = true,
  }) : super(key: key);

  @override
  _CategorySelectionWidgetState createState() => _CategorySelectionWidgetState();
}

class _CategorySelectionWidgetState extends State<CategorySelectionWidget> {
  late List<Category> _categories;
  late List<int> _selected;
  late bool _multiSelect;

  @override
  void initState() {
    super.initState();
    _categories = []..addAll(widget.categories!);
    _selected = []..addAll(widget.selected!);
    _multiSelect = widget.multiSelect;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = []
      ..add(Row(
        children: [
          (_multiSelect) ? Checkbox(
            value: (_selected.length == 0) ? false : (_selected.length == _categories.length) ? true : null,
            onChanged: (bool? value){
              _selected = [];

              if (value == true)
                _categories.forEach((element) {
                  _selected.add(element.id);
                });

              widget.onChanged.call(selected: _selected);
              setState(() {});
            },
            tristate: true,
            activeColor: AppColor.color702,
          ) : Container(),
          Spacer(),
          CloseButton()
        ],
      ))
      ..addAll(
        _categories.map((e){
          return CheckboxListTile(
            contentPadding: EdgeInsets.fromLTRB(3, 0, 0, 0),
            title: Text(e.name),
            subtitle: Text(e.items!),
            activeColor: AppColor.color702,
            controlAffinity: ListTileControlAffinity.leading,
            value: _selected.contains(e.id) ? true : false,
            onChanged: (bool? value){
              // widget.selected(FSAppState.of(context).searchingRule.categories) are changed in callback
              if (value! && !_selected.contains(e.id)) _selected.add(e.id);
              else if(!value) _selected.remove(e.id);
              widget.onChanged.call(selected: _selected);
              setState(() {
              });
            },
          );
        })
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }
}
