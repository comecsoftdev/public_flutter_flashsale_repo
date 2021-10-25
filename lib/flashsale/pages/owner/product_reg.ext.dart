part of 'product_reg.dart';

/*
To improve readability, Use extension
 */

extension FSProductRegPageUIFunctions on FSProductRegPageState {
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
      title: (_product.id == null) ? _s!.productMgmtProdReg : _s!.productMgmtProdMod,
      backgroundColor: AppColor.color1019,
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 24.h,),
          // [ Product Info ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  _s!.productRegProductInfo,
                  style: TextStyle(
                    color: AppColor.color1010,
                    fontSize: 16.sp,
                    fontFamily: "SpoqaHanSansNeo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                FSDivider(height: 2.h, color: AppColor.color1010,),
                SizedBox(height: 24.h,),
                // [ ProductInfoInputWidget ]
                ProductInfoInputWidget(key: _productInfoInputKey, product: Product.clone(_product), products: _store.products,),
                SizedBox(height: 20.h,),
                FSTitleWithDesc(context, _s!.productRegProductImage, _s!.productRegProductImageDesc),
                SizedBox(height: 4.h,),
                // [ Product Image ]
                ImagePickerWidget(
                  key: _imagePickerWidgetKey,
                  width: 335.w,
                  height: 240.h,
                  defaultImage: _productImage,
                  desc: _s!.productRegSelectProductImage,
                  showNoImageError: true,
                ),
                SizedBox(height: 40.h,),
                // [ submit button ]
                FSButton(
                  width: 335.w,
                  height: 52.h,
                  borderRadius: 8.r,
                  borderColor: AppColor.color1019,
                  buttonColor: AppColor.color1019,
                  text: (_product.id == null) ? _s!.productMgmtProdReg : _s!.productMgmtProdMod,
                  textColor: AppColor.color101,
                  fontSize: 16.sp,
                  onTap: () => _submitPressed(),
                ),
                SizedBox(height: 10.h,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension FSProductRegPagePrivatePublicFunctions on FSProductRegPageState {
  void _submitPressed(){
    hideSoftKeyboard(context);

    // get image path
    final ImagePickerWidgetState? pickerWidgetState = (_imagePickerWidgetKey.currentState != null) ? _imagePickerWidgetKey.currentState! : null;
    final String? filePath = pickerWidgetState?.getSelectedFile()?.path;

    Product? product = _productInfoInputKey.currentState!.getProduct();

    if ((filePath == null && _product.image == null) || product == null){
      // input error, no selected image in registration mode
      showAlertSnackBar(context, _s!.storeRegResubmit);
    }else{
      if(_product.id == null){
        // register new product
        _regUpdateProduct(filePath, product.toJson()..putIfAbsent('store_id', () => _store.id));
        _progressHUDKey.currentState!.show();
      }else{
        if(_product == product && filePath == null){
          // no image and product info change in update mode
          showAlertSnackBar(context, _s!.commonNoChange);
        }else if(filePath == null){
          // only change in product info
          _regUpdateProduct(null, product.toJson()..putIfAbsent('store_id', () => _store.id));
        }else{
          _progressHUDKey.currentState!.show();
          _regUpdateProduct(filePath, product.toJson()..putIfAbsent('store_id', () => _store.id));
        }
      }
    }
  }

  void _productRegistered(product){
    Navigator.of(context).pop(product);
  }
}

extension FSProductRegPageEventFunctions on FSProductRegPageState {
  /*
  define event-related functions in post page below.
  and add FsPostEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase event){
    if(event is FSProductRegUpdateProduct) _regUpdateProduct(event.filePath, event.product);
  }

  void _regUpdateProduct(filepath, product) => BlocProvider.of<FSProductRegBloc>(context).add(
      FSProductRegUpdateProduct(token: getSSOToken(context)!, filePath: filepath, product: product)
  );
}