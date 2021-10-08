import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/accounts/app_state.dart';
import 'package:comecsoft/accounts/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/common/constants.dart' as constants;
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/flashsale/pages/pages.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;

class ItemModel {
  bool expanded;
  Widget header;
  Widget content;

  ItemModel({this.expanded: false, required this.header, required this.content});
}

class FSNoticePage extends StatefulWidget {
  final List<Notice>? notices;

  FSNoticePage({Key? key,
    this.notices,
  }) : super(key: key);

  @override
  FSNoticePageState createState() => FSNoticePageState();
}

class FSNoticePageState extends State<FSNoticePage> {
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  List<ItemModel> _items = [];

  S? _s;                     //application localization

  @override
  void initState() {
    logger.d('${this.runtimeType} initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    logger.d('${this.runtimeType} didChangeDependencies');
    _s = S.of(context);

    if(_items.length == 0){
      _items = _createItemModel(widget.notices!);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color101,
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
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            _buildHeader(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return HeaderBarWidget(
      title: _s!.homeDrawerNotice,
    );
  }

  Widget _buildBody() {
    return Container(
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index){
          return ExpansionPanelList(
            //dividerColor:Colors.red,
            elevation:1,
            children: [
              ExpansionPanel(
                canTapOnHeader: true,
                body: Container(
                  child: _items[index].content
                ),
                headerBuilder: (BuildContext context, bool isExpanded){
                  return Container(
                    child: _items[index].header
                  );
                },
                isExpanded: _items[index].expanded,
              ),
            ],
            expansionCallback: (int item, bool status){
              setState(() {
                _items[index].expanded = !_items[index].expanded;
              });
            },
          );
        },
      ),
    );
  }

  List<ItemModel>_createItemModel(List<Notice> notices){
    List<ItemModel> itemModels = [];
    notices.forEach((element) {
      ItemModel itemModel = ItemModel(
        header: Container(
          width: 1.sw,
          color: AppColor.color101,
          padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 20.w, ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(
                element.title,
                style: TextStyle(
                  color: AppColor.color1010,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                child: Text(
                  getTimeFormatType1(_s!, element.created),
                  style: TextStyle(
                    color: AppColor.color1020,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        content: Container(
          width: 1.sw,
          color: AppColor.color1018,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h, ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  element.notice,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 15.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        )
      );
      itemModels.add(itemModel);
    });

    return itemModels;
  }
}