import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/constants.dart' as constants;


/*
1 --> 62 + 130 (height of postItem(100) + padding(31))
2 --> 62 + 130*2
3 --> 62 + 130*3
...
6 --> 62 + 130*6 = 740
>7 --> 756
 */

const int DEFAULT_HEIGHT = 62;
const int POST_ITEM_HEIGHT = 131;
const int POST_MAX_HEIGHT = 740;


// Widget for post information that is displayed when a marker on the map is clicked
class BottomPostListWidget extends StatefulWidget {
  // callback function on item tap
  final void Function(Posting)? onTap;
  final List<dynamic> postings;

  BottomPostListWidget({
    Key? key,
    required this.onTap,
    required this.postings,
  }) : super(key: key);

  @override
  _BottomPostListWidgetState createState() => _BottomPostListWidgetState();
}

class _BottomPostListWidgetState extends State<BottomPostListWidget>{
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  int _itemCount = constants.POST_ITEM_INCREMENT;

  S? _s;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    // Calculate the height of the widget
    int height = DEFAULT_HEIGHT + POST_ITEM_HEIGHT * widget.postings.length;
    if (height > POST_MAX_HEIGHT) height = 740;

    if (_itemCount > widget.postings.length) _itemCount = widget.postings.length;

    return Container(
      width: 1.sw,
      height: ScreenUtil().setHeight(height),
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
      child: Container(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // [ store info ]
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Text(
                  _s!.storeStoreInfo,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 18.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 8.w),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      widget.postings.length.toString(),
                      style: TextStyle(
                        color: AppColor.color1012,
                        fontSize: 15.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      _s!.commonList1,
                      style: TextStyle(
                        color: AppColor.color1012,
                        fontSize: 15.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
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
            SizedBox(height: 4.h,),
            // [ post list ]
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                primary: false,
                shrinkWrap: true,
                itemCount: _itemCount,
                itemBuilder: (BuildContext context, int index) => Container(
                  padding: EdgeInsets.only(top: 15.h,),
                  child: Column(
                    children: [
                      PostItemWidget(
                        posting: widget.postings[index],
                        onTap: widget.onTap,
                      ),
                      SizedBox(height: 15.h,),
                      Container(
                        height: 1,
                        color: AppColor.color1016,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }

  _scrollListener() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      // add items SliverChildBuilderDelegate()
      setState(() {
        _itemCount += constants.POST_ITEM_INCREMENT;
      });
    }
  }
}
