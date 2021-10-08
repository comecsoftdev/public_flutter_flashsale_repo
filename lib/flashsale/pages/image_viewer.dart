import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;


class FSImageViewerPage extends StatefulWidget {
  final ImageProvider imageProvider;

  FSImageViewerPage({Key? key,
    required this.imageProvider,
  }) : super(key: key);

  @override
  FSImageViewerPageState createState() => FSImageViewerPageState();
}

class FSImageViewerPageState extends State<FSImageViewerPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  S? _s;                     //application localization


  Widget build(BuildContext context) {
    _s = S.of(context);

    return Scaffold(
      backgroundColor: AppColor.color101,
      key: _scaffoldKey,
      body: SafeArea(
        child: ProgressHUD(
          key: _progressHUDKey,
          backgroundColor: AppColor.color90,
          borderColor: AppColor.color90,
          textStyle: TextStyle(color: AppColor.color101, fontSize: 14.0),
          indicatorColor: AppColor.color502,
          child: _buildPage(),
        ),
      ),
    );
  }

  Widget _buildPage() {
    return Center(
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return HeaderBarWidget(
      title: _s!.commonViewImage,
    );
  }

  Widget _buildBody(){
    return ClipRect(
      child: PhotoView(
        imageProvider: widget.imageProvider,
        maxScale: PhotoViewComputedScale.covered * 3.0,
        minScale: PhotoViewComputedScale.contained * 0.8,
        initialScale: PhotoViewComputedScale.contained,
      ),
    );
  }
}
