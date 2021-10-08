import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprintf/sprintf.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/generated/l10n.dart';

class GridMenuLayout {
  final int id;
  final String title;
  final ImageProvider off;
  final ImageProvider on;

  GridMenuLayout({required this.id, required this.title, required this.off, required this.on});
}

class CategoryGridMenuWidget extends StatefulWidget {
  // list of category
  final List<Category>? categories;
  // list of selected category ids
  final List<int>? selected;
  final bool multiSelect;
  final rowCount;

  // send selected category ids as parameter
  final void Function({List<int>? selected}) onChanged;

  CategoryGridMenuWidget({
    Key? key,
    required this.categories,
    required this.selected,
    required this.onChanged,
    this.multiSelect = true,
    this.rowCount = 5,
  }) : super(key: key);

  @override
  _CategoryGridMenuWidgetState createState() => _CategoryGridMenuWidgetState();
}

class _CategoryGridMenuWidgetState extends State<CategoryGridMenuWidget> {
  late List<Category> _categories;
  late List<int> _selected;

  List<GridMenuLayout> _menu = [];
  late int _rowCount;

  S? _s;

  @override
  void initState() {
    super.initState();
    _categories = []..addAll(widget.categories!);
    _selected = []..addAll(widget.selected!);

    _rowCount = widget.rowCount;

    _categories.forEach((value) {
      GridMenuLayout gridMenuLayout = GridMenuLayout(
        id: value.id,
        title: value.abbr!,
        off: AssetImage(sprintf('assets/images/category/%s_off.png', [value.id])),
        on: AssetImage(sprintf('assets/images/category/%s_on.png', [value.id])),
      );
      _menu.add(gridMenuLayout);
    });
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    int columnCount = (_menu.length % _rowCount == 0) ? (_menu.length ~/ _rowCount) : (_menu.length ~/ _rowCount + 1);
    int lastRowCount = (_menu.length % _rowCount == 0) ? _rowCount : _menu.length % _rowCount;

    return Container(
      width: 1.sw,
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        boxShadow: [
          BoxShadow(
            color: AppColor.color1013,
            blurRadius: 8,
            offset: Offset(0, -4),
          ),
        ],
        color: AppColor.color101,
      ),

      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
        child: Column(
          children: [
            // [ select category ]
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Text(
                  _s!.storeRegSelectCategory,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 18.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 24.r,
                    height: 24.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/icon/close.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h,),
            // [ category list ]
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(columnCount, (cIndex){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate((columnCount == cIndex - 1) ? lastRowCount: _rowCount, (rIndex){
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: InkWell(
                          onTap: (){
                            if (widget.multiSelect){
                              // widget.selected(FSAppState.of(context).searchingRule.categories) are changed in callback
                              if (!_selected.contains(_menu[cIndex * _rowCount + rIndex].id)) _selected.add(_menu[cIndex * _rowCount + rIndex].id);
                              else _selected.remove(_menu[cIndex * _rowCount + rIndex].id);

                              widget.onChanged.call(selected: _selected);

                              setState(() {});
                            }else{
                              widget.onChanged.call(selected: []..add((_menu[cIndex * _rowCount + rIndex].id)));
                              Navigator.pop(context);
                            }
                          },
                          child: GridMenuItem(
                            layout: _menu[cIndex * _rowCount + rIndex],
                            selected: (widget.multiSelect) ? _selected.contains(_menu[cIndex * _rowCount + rIndex].id) : false,
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class GridMenuItem extends StatelessWidget {
  final GridMenuLayout layout;
  final bool selected;

  GridMenuItem({required this.layout, this.selected = false});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Container(
            width: 50.r,
            height: 50.r,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: selected ? layout.on : layout.off,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: 65.w,
            child: Text(
              layout.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.color1010,
                fontSize: 13.sp,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}