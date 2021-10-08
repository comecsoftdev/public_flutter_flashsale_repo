part of 'product_mgmt.dart';

/*
To improve readability, Use extension
 */

extension FSProductMgmtPageUIFunctions on FSProductMgmtPageState {
  Widget _buildPage() {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              _buildHeader(),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return HeaderBarWidget(
      title: _s!.storeMgmtProductMgmt2,
      backgroundColor: AppColor.color1019,
    );
  }

  Widget _buildBody() {
    return (_store.products != null && _store.products!.length > 0) ? _buildProducts() : _buildNoProduct();
  }

  Widget _buildNoProduct(){
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80.h,),
            Text(
              _s!.productMgmtNoRegProd,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.color1010,
                fontSize: 16.sp,
                fontFamily: "SpoqaHanSansNeo",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 56.h,),
            FSButton(
              width: 335.w,
              height: 52.h,
              borderRadius: 8.r,
              borderColor: AppColor.color1019,
              buttonColor: AppColor.color1019,
              text: _s!.productMgmtProdReg,
              textColor: AppColor.color101,
              fontSize: 16.sp,
              onTap: (){
                Map<String, dynamic> arguments = {'store': _store};
                Navigator.of(context).pushNamed('fsproductreg', arguments: arguments).then((value){
                  if(value is Product)
                    setState(() {
                      if (_store.products == null) _store.products = []..add(value);
                      else _store.products!.add(value);
                    });
                });
              },
            ),
          ],
        )
    );
  }

  Widget _buildProducts(){
    return Container(
      child: Column(
        children: [
          SizedBox(height: 24.h,),
          // [ title - Registered Product ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _s!.storeRegProduct,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 16.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 20.w,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      _store.products!.length.toString(),
                      style: TextStyle(
                        color: AppColor.color1012,
                        fontSize: 13.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      _s!.commonList1,
                      style: TextStyle(
                        color: AppColor.color1012,
                        fontSize: 13.sp,
                        fontFamily: "SpoqaHanSansNeo",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h,),
          FSDivider(height: 4.h, color: AppColor.color1016),
          // [ product list ]
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: _store.products!.length,
            itemBuilder: (BuildContext context, int index) => Container(
              child: Column(
                children: [
                  SizedBox(height: 21.h,),
                  // [ description of product ]
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ProductItemWidget(
                      product: _store.products![index],
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  // [ Button for delete & modify ]
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 36.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        FSButton(
                          width: 160.w,
                          height: 36.h,
                          borderRadius: 4.r,
                          borderColor: AppColor.color1009,
                          buttonColor: AppColor.color101,
                          text: _s!.commonDelete,
                          textColor: AppColor.color1012,
                          fontSize: 13.sp,
                          onTap:() => _productDeleteTapped(index),
                        ),
                        SizedBox(width: 14.w),
                        FSButton(
                          width: 160.w,
                          height: 36.h,
                          borderRadius: 4.r,
                          borderColor: AppColor.color1019,
                          buttonColor: AppColor.color101,
                          text: _s!.commonModify,
                          textColor: AppColor.color1019,
                          fontSize: 13.sp,
                          onTap: (){
                            Map<String, dynamic> arguments = {'store': _store, 'product': _store.products![index]};
                            Navigator.of(context).pushNamed('fsproductreg', arguments: arguments).then((value){
                              if(value is Product)
                                setState(() {
                                  _store.products![_store.products!.indexWhere((element) => element.id == value.id)] = value;
                                });
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  FSDivider(height: 4.h, color: AppColor.color1016),
                ],
              ),
            ),
          ),
          SizedBox(height: 42.h,),
          // [ register product ]
          FSButton(
            width: 335.w,
            height: 52.h,
            borderRadius: 8.r,
            borderColor: AppColor.color1019,
            buttonColor: AppColor.color1019,
            text: _s!.productMgmtProdReg,
            textColor: AppColor.color101,
            fontSize: 16.sp,
            onTap: () => _productRegisterTapped(),
          ),
          SizedBox(height: 24.h,),
        ],
      ),
    );
  }
}

extension FSProductMgmtPagePrivatePublicFunctions on FSProductMgmtPageState {
  void _productRegisterTapped(){
    if( _store.products!.length >= FSAppState.of(context).fSettings!.maxProductCount!){
      showAlertDialog(context,
        _s!.productRegMaxProduct(FSAppState.of(context).fSettings!.maxProductCount!),
        null,
        yes: _s!.commonOK,
        yesOnPressed: (){
          Navigator.pop(context);
        },
      );
      return;
    }

    Map<String, dynamic> arguments = {'store': _store};
    Navigator.of(context).pushNamed('fsproductreg', arguments: arguments).then((value){
      if(value is Product)
        setState(() {
          if (_store.products == null) _store.products = []..add(value);
          else _store.products!.add(value);
        });
    });
  }

  void _productDeleteTapped(index){
    // show product delete popup
    showAlertDialog(context,
      _s!.myStoreDeleteProduct,
      null,
      yes: _s!.commonOK,
      yesOnPressed: (){
        Navigator.pop(context);
        _unRegisterProduct(_store.id, _store.products![index].id);
      },
      no: _s!.commonCancel,
      noOnPressed: () => Navigator.pop(context),
    );
  }

  void _productDeleted(int? productId){
    _store.products!.removeWhere((element) => element.id == productId);
  }
}

extension FSProductMgmtPageEventFunctions on FSProductMgmtPageState {
  /*
  define event-related functions in post page below.
  and add FsPostEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase event){
    if(event is FSProductMgmtUnregisterProduct) _unRegisterProduct(event.storeId, event.productId);
  }

  void _unRegisterProduct(storeId, productId) => BlocProvider.of<FSProductMgmtBloc>(context).add(
      FSProductMgmtUnregisterProduct(token: getSSOToken(context)!, storeId: storeId, productId: productId)
  );
}