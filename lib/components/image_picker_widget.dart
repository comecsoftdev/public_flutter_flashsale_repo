import 'dart:io';
import 'package:comecsoft/components/animation_widget.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;

class ImagePickerWidget extends StatefulWidget {
  final double width;
  final double height;
  final ImageProvider? defaultImage;
  final String? desc;
  final bool showNoImageError;
  final BoxFit fit;

  ImagePickerWidget({
    Key? key,
    required this.width,
    required this.height,
    this.defaultImage,
    this.desc,
    this.showNoImageError = false,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  ImagePickerWidgetState createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget> {
  late double _width, _height;
  File? _imageFile;
  late String desc;

  late S _s;                     //application localization

  bool _showNoSelectionError = false;

  @override
  void initState() {
    super.initState();
    _width = widget.width;
    _height = widget.height;
  }

  @override
  void didChangeDependencies() {
    _s = S.of(context);

    desc = widget.desc ?? _s.commonSelectImage;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColor.color1009, width: 1.w, ),
              color: AppColor.color1018,
            ),
            child: (_imageFile != null || widget.defaultImage != null) ? InkWell(
              onTap: (){
                Map<String, dynamic> arguments = {'imageProvider': (_imageFile != null) ? FileImage(_imageFile!) : widget.defaultImage!};
                Navigator.of(context).pushNamed('fsimageviewer', arguments: arguments);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: (_imageFile != null) ? FileImage(_imageFile!) : widget.defaultImage!,
                    fit: widget.fit,
                  ),
                ),
              ),
            ) :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: AssetImage("assets/images/icon/camera.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  desc,
                  style: TextStyle(
                    color: AppColor.color1012,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h,),
          Container(
            width: _width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FSButton(
                  width: 160.w,
                  height: 36.h,
                  borderRadius: 4.r,
                  borderColor: AppColor.color1012,
                  buttonColor: AppColor.color101,
                  text: _s.productRegTakePicture,
                  textColor: AppColor.color1010,
                  fontSize: 13.sp,
                  onTap: () => _onImagePickButtonPressed(ImageSource.camera, context: context),
                ),
                SizedBox(width: 14.h,),
                FSButton(
                  width: 160.w,
                  height: 36.h,
                  borderRadius: 4.r,
                  borderColor: AppColor.color1019,
                  buttonColor: AppColor.color101,
                  text: _s.productRegSelFromAlbum,
                  textColor: AppColor.color1019,
                  fontSize: 13.sp,
                  onTap: () => _onImagePickButtonPressed(ImageSource.gallery, context: context),
                ),
              ],
            ),
          ),
          (widget.showNoImageError && _showNoSelectionError) ?
          Container(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              children: [
                SizedBox(height: 8.h,),
                Text(
                  desc,
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ) :
          Container(),
        ],
      ),
    );
  }

  void _onImagePickButtonPressed(ImageSource source, {BuildContext? context}) async {
    try {
      PickedFile? pickedImageFile = await (ImagePicker().getImage(source: source));
      _imageFile = File(pickedImageFile!.path);
      setState(() {});
    } catch (e) {
      showAlertDialog(context!,
        _s.commonErrorPickingImage,
        _s.commonErrorPickingImage2,
        yes: _s.commonOK,
        yesOnPressed: () => Navigator.pop(context),
      );
    }
  }

  File? getSelectedFile(){
    setState(() {
      _showNoSelectionError = (_imageFile == null && widget.defaultImage == null) ? true : false;
    });

    // return null If there is no file selected
    return _imageFile;
  }
}