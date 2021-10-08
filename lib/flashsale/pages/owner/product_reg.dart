import 'package:comecsoft/flashsale/app_state_fs.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comecsoft/flashsale/blocs/blocs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/generated/l10n.dart';
import 'package:comecsoft/components/components.dart';
import 'package:comecsoft/common/colors.dart' as AppColor;
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/flashsale/pages/home.dart';

part 'product_reg.ext.dart';

// product registration or modification page
// in case of registration product == null
// in case of modification product != null
class FSProductRegPage extends StatefulWidget {
  final Store? store;
  final Product? product;

  FSProductRegPage({Key? key,
    required this.store,
    this.product,
  }) : super(key: key);

  @override
  FSProductRegPageState createState() => FSProductRegPageState();
}

class FSProductRegPageState extends State<FSProductRegPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ProgressHUDState> _progressHUDKey = new GlobalKey();
  GlobalKey<ImagePickerWidgetState> _imagePickerWidgetKey = new GlobalKey();
  GlobalKey<ProductInfoInputWidgetState> _productInfoInputKey = new GlobalKey();

  late Store _store;
  late Product _product;

  ImageProvider? _productImage;

  S? _s;                     //application localization

  @override
  void initState() {
    super.initState();
    _store = widget.store!;

    _product = widget.product ?? Product.empty();

    _productImage = (_product.image == null) ? null : getCachedNetworkImageProviderFromS3(_product.image!);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);

    return Scaffold(
      backgroundColor: AppColor.color101,
      key: _scaffoldKey,
      body: SafeArea(
        child: BlocListener<FSProductRegBloc, FSProductRegState>(
          listener: (context, state) async{
            if(state is FSProductRegUpdateProductSuccess) {
              logger.d('${this.runtimeType} FSProductRegisterProductSuccess');
              _productRegistered(state.product);
            }else if(state is FSProductRegUpdateProductFailure) {
              logger.d('${this.runtimeType} FSProductRegisterProductFailure');
              showAlertDialog(context,
                _s!.commonNetworkError,
                state.comment,
                yes: _s!.commonOK,
                yesOnPressed: (){
                  Navigator.pop(context);
                },
              );
            }else if(state is FSProductRegRefreshTokenRequired) {
              logger.d('${this.runtimeType} FSProductRegRefreshTokenRequired eventToResend : ${state.eventToResend}');
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
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  hideSoftKeyboard(context);
                },
              child: _buildPage()
            ),
          ),
        ),
      ),
    );
  }
}