import 'package:comecsoft/flashsale/models/models.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/components/fs_widget.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/generated/l10n.dart';

class StoreInfoWidget extends StatelessWidget {
  final removeTitle;
  final Store store;
  final BoxDecoration? boxDecoration;
  final EdgeInsets? contentPadding;

  // onDelete & onUpdate, Both must be null or both must not be null
  // callback function when delete text clicked. delete text is shown if onDelete not null
  final void Function()? onDelete;
  // callback function when update text clicked. update text is shown if onUpdate not null
  final void Function()? onUpdate;

  const StoreInfoWidget(
      {Key? key,
        this.removeTitle = false,
        required this.store,
        this.boxDecoration,
        this.contentPadding,
        this.onDelete,
        this.onUpdate,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    S? _s = S.of(context);                     //application localization

    return Container(
      padding: _getContentPadding(),
      width: 335.w,
      decoration: _getBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          (!removeTitle) ?
          Column(
            children: [
              Row(
                children: [
                  Text(
                    _s.storeStoreInfo,
                    style: TextStyle(
                      color: AppColor.color1010,
                      fontSize: 16.sp,
                      fontFamily: "SpoqaHanSansNeo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  // popup menu for delete & update
                  (onDelete != null || onUpdate != null) ?
                  PopupMenuButton<String>(
                    icon: Icon(
                      Icons.more_vert,
                      size: 20.r,
                    ),
                    padding: EdgeInsets.zero,
                    onSelected: (value) {
                      if (value == _s.storeRegDelStore) onDelete?.call();
                      else if(value == _s.storeModStoreInfo) onUpdate?.call();
                    },
                    itemBuilder: (BuildContext context) {
                      List<PopupMenuItem<String>> popupMenuItemList = [];

                      if (onDelete != null) popupMenuItemList.add(PopupMenuItem<String>(
                        value: _s.storeRegDelStore,
                        child: Text(_s.storeRegDelStore),
                      ));

                      if (onUpdate != null) popupMenuItemList.add(PopupMenuItem<String>(
                        value: _s.storeModStoreInfo,
                        child: Text(_s.storeModStoreInfo),
                      ));

                      return popupMenuItemList;
                    },
                  ) :
                  Container(),
                ],
              ),
              SizedBox(height: 12.h),
            ],
          ) :
          Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                width: 64.w,
                child: Text(
                  _s.storeStoreName,
                  style: TextStyle(
                    color: AppColor.color1012,
                    fontSize: 14.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  store.placeName,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                width: 64.w,
                child: Text(
                  _s.storeRegPhoneNumber,
                  style: TextStyle(
                    color: AppColor.color1012,
                    fontSize: 14.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  store.placePhone,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                width: 64.w,
                child: Text(
                  _s.storeRegStoreAdr,
                  style: TextStyle(
                    color: AppColor.color1012,
                    fontSize: 14.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  store.address + (store.addressDetail ?? ''),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 14.sp,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                width: 64.w,
                child: Text(
                  _s.commonBusinessNum,
                  style: TextStyle(
                    color: AppColor.color1012,
                    fontSize: 14.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  store.rgstNo,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  BoxDecoration _getBoxDecoration(){
    return boxDecoration ?? BoxDecoration(
      borderRadius: BorderRadius.circular(4.r),
      boxShadow: [
        BoxShadow(
          color: Color(0x19000000),
          blurRadius: 24.r,
          offset: Offset(0, 8),
        ),
      ],
      color: Colors.white,
    );
  }

  EdgeInsets _getContentPadding(){
    return contentPadding ?? EdgeInsets.only(right: 24.w, left: 24.w, top: 20.h, bottom: 20.h);
  }
}
