import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/flashsale/pages/home.dart';
import 'package:comecsoft/common/constants.dart' as constants;

part 'post.ext.dart';

enum SortStyle{
  locationBased,
  ratingBased,
  validityBased,
}

class FSPostPage extends StatefulWidget {
  FSPostPage({Key? key,
  }) : super(key: key);

  @override
  FSPostPageState createState() => FSPostPageState();
}

class FSPostPageState extends State<FSPostPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();

  // get the _selectedPosts using category from _post
  // get the _selectedFilteredPosts using search word from _selectedPosts( search word NOT USED in post.dart)
  List<Posting>? _posts;
  List<dynamic>? _selectedPosts;
  List<dynamic>? _selectedFilteredPosts;
  // currently only support SortStyle.locationBased
  SortStyle _sortStyle = SortStyle.locationBased;

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  int _itemCount = constants.POST_ITEM_INCREMENT;

  String _searchWord = '';
  List<int> _searchCategory = [];

  S? _s;                     //application localization

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

  Widget build(BuildContext context) {
    _setStateData();

    // sort post as sort style(SortStyle.locationBased)
    if (_sortStyle == SortStyle.locationBased) _selectedFilteredPosts!.sort((a,b) => (a.distanceFromMe - b.distanceFromMe).toInt());

    if (_itemCount > _selectedFilteredPosts!.length) _itemCount = _selectedFilteredPosts!.length;

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
}


