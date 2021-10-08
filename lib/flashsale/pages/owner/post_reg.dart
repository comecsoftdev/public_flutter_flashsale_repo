import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/flashsale/pages/home.dart';
import 'package:comecsoft/flashsale/pages/pages.dart';
import 'package:comecsoft/common/constants.dart' as constants;

part 'post_reg.ext.dart';

// post registration or modification page
// in case of registration post == null
// in case of modification post != null
class FSPostRegPage extends StatefulWidget {
  final Store store;
  final Posting? post;

  FSPostRegPage({Key? key,
    required this.store,
    this.post,
  }) : super(key: key);

  @override
  FSPostRegPageState createState() => FSPostRegPageState();
}

class FSPostRegPageState extends State<FSPostRegPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();
  GlobalKey<ProductSwiperWidgetState> _productListKey = new GlobalKey();
  GlobalKey<PostDiscountTimeWidgetState> _discountTimeKey = new GlobalKey();

  late Store _store;
  Posting? _post;
  late FsSettings _fSettings;
  late List<int> _initialSelectedProduct;

  // selected product number
  late int _selectedProdNum;

  LatLng? _postLoc;
  late String? _postingLocationType;
  List<String> _postingLocationTypes = [];

  S? _s;                     //application localization

  int? _maxPostEndTime;

  @override
  void initState() {
    super.initState();
    _store = widget.store;
    _post = widget.post ?? Posting.empty();

    if(_post!.id == null) _initialSelectedProduct = [];
    else _initialSelectedProduct = [for (var elem in _store.products!) if (elem.active == true) elem.id!];
    _selectedProdNum = _initialSelectedProduct.length;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _setStateData();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.color101,
      body: SafeArea(
        child: BlocListener<FSPostRegBloc, FSPostRegState>(
          listener: (context, state) async{
            if(state is FSPostRegUpdatePostSuccess) {
              logger.d('${this.runtimeType} FSPostRegUpdatePostSuccess');
              _postRegUpdated(state.post, state.products);
            }else if(state is FSPostRegUpdatePostFailure) {
              logger.d('${this.runtimeType} FSPostRegUpdatePostFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSPostRegRefreshTokenRequired) {
              logger.d('${this.runtimeType} FSPostRegRefreshTokenRequired eventToResend : ${state.eventToResend}');
              // send session related event to FsHomeBloc
              fsHomePageKey.currentState!.sendRefreshToken(state.eventToResend);
            }
          },
          child: ProgressHUD(
            key: _progressHUDKey,
            backgroundColor: AppColor.color90,
            borderColor: AppColor.color90,
            textStyle: TextStyle(color: AppColor.color101, fontSize: 14.0),
            indicatorColor: AppColor.color502,
            child: _buildPage(),
          ),
        ),
      ),
    );
  }
}