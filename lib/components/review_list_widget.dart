import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/generated/l10n.dart';


class ReviewListWidget extends StatefulWidget {
  // list of review
  final List<Review?>? reviews;
  // callback for delete, edit, reply and report event on review
  final void Function(Review, ReviewSubMenu subMenu) onEvent;
  final String? noReviewMsg;

  ReviewListWidget({
    Key? key,
    required this.reviews,
    required this.onEvent,
    this.noReviewMsg,
  }) : super(key: key);

  @override
  ReviewListWidgetState createState() => ReviewListWidgetState();
}

class ReviewListWidgetState extends State<ReviewListWidget> {
  S? _s;

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return (widget.reviews != null && widget.reviews!.length > 0) ?
    Container(
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: widget.reviews!.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (index != 0) ? SizedBox(height: 24.h) : Container(),
              _buildReviewList(context, widget.reviews![index]!, widget.onEvent),
              // remove the last reviews's underline
              (widget.reviews!.length - 1 != index) ?
              Column(
                children: [
                  SizedBox(height: 24.h),
                  Container(
                    height: 1,
                    color: AppColor.color1016,
                  ),
                ],
              ) :
              Container(),
            ],
          );
        },
      ),
    ) :
    Container(
      width: 1.sw,
      height: 176.h,
      color: Color(0x02ffffff),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 56.r,
            height: 56.r,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/icon/chat.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.h,),
          Text(
            _getNoReviewMsg(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff999999),
              fontSize: 15.sp,
              fontFamily: "SpoqaHanSansNeo",
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildReviewList(BuildContext context, Review review, var onEvent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ReviewItemWidget(
          review: review,
          isChild: false,
          reviewSubMenus: createReviewSubMenu(review),
          onEvent: onEvent,
        ),
        (review.children == null) ?
        Container() :
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 16.h,
            ),
            ReviewItemWidget(
              review: review.children![0],
              isChild: true,
              reviewSubMenus: createReviewSubMenu(review.children![0]),
              onEvent: onEvent,
            ),
          ],
        ),
      ],
    );
  }

  Set<ReviewSubMenu> createReviewSubMenu(Review review){
    // create review for review
    Set<ReviewSubMenu> reviewSubMenus = Set<ReviewSubMenu>();
    if (review.reportable!) reviewSubMenus..add(ReviewSubMenu.report);
    if (review.editable!) reviewSubMenus..add(ReviewSubMenu.delete)..add(ReviewSubMenu.modify);
    if (review.replyable! && review.children == null) reviewSubMenus.add(ReviewSubMenu.reply);

    return reviewSubMenus;
  }

  String _getNoReviewMsg(){
    return widget.noReviewMsg ?? _s!.storeNoReview;
  }
}