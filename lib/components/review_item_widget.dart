import 'package:comecsoft/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/flashsale/models/models.dart';

enum ReviewSubMenu {
  modify,          //modify review
  delete,          //delete review
  reply,           //reply review
  report,          //report review
}

class ReviewItemWidget extends StatelessWidget {
  final Set<ReviewSubMenu> reviewSubMenus;
  final isChild;
  // review
  final Review review;
  // callback for delete, edit, reply and report event on review
  final void Function(Review review, ReviewSubMenu reviewEvent)? onEvent;

  const ReviewItemWidget(
      {Key? key,
        required this.onEvent,
        required this.isChild,
        required this.review,
        required this.reviewSubMenus,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    S _s = S.of(context);

    return (isChild) ? _buildManagerReply(_s) : _buildUserReview(_s);
  }

  Widget _buildUserReview(_s){
    return Container(
      decoration: BoxDecoration(
        color: AppColor.color101,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 36.r,
                  height: 36.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: (review.picture == null) ? AssetImage("assets/images/anon_user.png") : CachedNetworkImageProvider(review.picture! ) as ImageProvider ,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.email,
                      style: TextStyle(
                        color: AppColor.color1001,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ratingBar(review.rating.toString()),
                        SizedBox(width: 30.w),
                        Text(
                          getTimeFormatType1(_s!, review.created),
                          style: TextStyle(
                            color: AppColor.color1020,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                (reviewSubMenus.length > 0) ?
                PopupMenuButton<ReviewSubMenu>(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 17.r,
                  ),
                  padding: EdgeInsets.zero,
                  onSelected: (value) => onEvent?.call(review, value),
                  itemBuilder: (BuildContext context) {
                    List<PopupMenuItem<ReviewSubMenu>> popupMenuItemList = [];

                    if (reviewSubMenus.contains(ReviewSubMenu.modify)) popupMenuItemList.add(PopupMenuItem<ReviewSubMenu>(
                      value: ReviewSubMenu.modify,
                      child: Text(_s.commonModify),
                    ));

                    if (reviewSubMenus.contains(ReviewSubMenu.delete)) popupMenuItemList.add(PopupMenuItem<ReviewSubMenu>(
                      value: ReviewSubMenu.delete,
                      child: Text(_s.commonDelete),
                    ));

                    if (reviewSubMenus.contains(ReviewSubMenu.reply)) popupMenuItemList.add(PopupMenuItem<ReviewSubMenu>(
                      value: ReviewSubMenu.reply,
                      child: Text(_s.commonReply),
                    ));

                    if (reviewSubMenus.contains(ReviewSubMenu.report)) popupMenuItemList.add(PopupMenuItem<ReviewSubMenu>(
                      value: ReviewSubMenu.report,
                      child: Text(_s.commonReport),
                    ));

                    return popupMenuItemList;
                  },
                ) :
                Container(),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            review.review,
            style: TextStyle(
              color: AppColor.color1010,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildManagerReply(_s){
    return Container(
      decoration: BoxDecoration(
        color: AppColor.color1018,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h, ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _s!.commonManagerAnswer,
                      style: TextStyle(
                        color: AppColor.color1010,
                        fontSize: 15.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      getTimeFormatType1(_s!, review.created),
                      style: TextStyle(
                        color: AppColor.color1020,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                (reviewSubMenus.length > 0) ?
                PopupMenuButton<ReviewSubMenu>(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 17.r,
                  ),
                  padding: EdgeInsets.zero,
                  onSelected: (value) => onEvent?.call(review, value),
                  itemBuilder: (BuildContext context) {
                    List<PopupMenuItem<ReviewSubMenu>> popupMenuItemList = [];

                    if (reviewSubMenus.contains(ReviewSubMenu.modify)) popupMenuItemList.add(PopupMenuItem<ReviewSubMenu>(
                      value: ReviewSubMenu.modify,
                      child: Text(_s.commonModify),
                    ));

                    if (reviewSubMenus.contains(ReviewSubMenu.delete)) popupMenuItemList.add(PopupMenuItem<ReviewSubMenu>(
                      value: ReviewSubMenu.delete,
                      child: Text(_s.commonDelete),
                    ));

                    if (reviewSubMenus.contains(ReviewSubMenu.reply)) popupMenuItemList.add(PopupMenuItem<ReviewSubMenu>(
                      value: ReviewSubMenu.reply,
                      child: Text(_s.commonReply),
                    ));

                    if (reviewSubMenus.contains(ReviewSubMenu.report)) popupMenuItemList.add(PopupMenuItem<ReviewSubMenu>(
                      value: ReviewSubMenu.report,
                      child: Text(_s.commonReport),
                    ));

                    return popupMenuItemList;
                  },
                ) :
                Container(),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.h,),
            child: Text(
              review.review,
              style: TextStyle(
                color: AppColor.color1010,
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ratingBar(String avg){
    return RatingBar.builder(
      initialRating: double.parse(avg),
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.amber.withAlpha(50),
      itemCount: 5,
      itemSize: 18.r,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      updateOnDrag: false,
      onRatingUpdate: (rating){},
    );
  }
}