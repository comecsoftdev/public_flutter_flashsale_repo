part of 'post_reg.dart';

/*
To improve readability, Use extension
 */

extension FSPostRegPageUIFunctions on FSPostRegPageState {
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
      title: _s!.postRegStartPost,
      backgroundColor: AppColor.color1019,
    );
  }

  Widget _buildBody(){
    return Container(
      child: Column(
        children: [
          SizedBox(height: 24.h,),
          // [ Select post product ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:[
                FSTitleWithDesc(context, _s!.postRegPostProd, _s!.postRegPostProdDesc, color: AppColor.color1010, fontSize: 18.sp),
                Spacer(),
                Text(
                  "$_selectedProdNum/${_store.products!.length}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColor.color1010,
                    fontFamily: "SpoqaHanSansNeo",
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 14.h,),
          // [ product list ]
          ProductSwiperWidget(
            key: _productListKey,
            products: _store.products,
            selected: _initialSelectedProduct,
            multiSelect: true,
            onSelect: (value){
              setState(() {
                // update selected product number
                _selectedProdNum = value.length;
              });
            },
          ),
          SizedBox(height: 20.h,),
          FSDivider(height: 8.h, color: AppColor.color1018),
          SizedBox(height: 24.h,),
          // [ discount time ]
          PostDiscountTimeWidget(
            key: _discountTimeKey,
            maxPostEndTime: _maxPostEndTime!,
          ),
          SizedBox(height: 20.h,),
          FSDivider(height: 8.h, color: AppColor.color1018),
          SizedBox(height: 24.h,),
          // [ title - Posting location ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FSTitleWithDesc(context, _s!.postRegPostLoc, _s!.postRegPostLocDesc, color: AppColor.color1010, fontSize: 18.sp),
          ),
          SizedBox(height: 16.h,),
          // [ select posting location ]
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                // [ choose posting location ]
                GestureDetector(
                  onTapDown: (details) async{

                    List<String> menus = _postingLocationTypes;

                    String selected = await showPopupMenu(context, menus, details.globalPosition);

                    // change _postLoc depending on the selected location
                    if (selected == _postingLocationTypes[0])
                      _postLoc = LatLng(double.parse(_store.lat), double.parse(_store.lng));

                    setState(() {
                      _postingLocationType = selected;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    width: 256.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: AppColor.color1009, width: 1.w, ),
                      color: AppColor.color101,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          _postingLocationType!,
                          style: TextStyle(
                            color: AppColor.color1012,
                            fontSize: 14.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 16.r,
                          height: 16.r,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/icon/more_b.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                FSButton(
                  width: 73.w,
                  height: 48.h,
                  borderRadius: 4.r,
                  borderColor: AppColor.color1019,
                  buttonColor: AppColor.color101,
                  text: _s!.commonLocationCheck,
                  textColor: AppColor.color1019,
                  fontSize: 13.sp,
                  onTap: () => _checkPostingLocation(),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h,),
          // [ start posting ]
          FSButton(
            width: 335.w,
            height: 52.h,
            borderRadius: 8.r,
            borderColor: AppColor.color1019,
            buttonColor: AppColor.color1019,
            text: _s!.homeDrawerStartPost,
            textColor: AppColor.color101,
            fontSize: 16.sp,
            onTap: () => _submitPressed(),
          ),
          SizedBox(height: 24.h,),
        ],
      ),
    );
  }
}

extension FSPostRegPagePrivatePublicFunctions on FSPostRegPageState {
  void _setStateData(){
    _s = S.of(context);

    _fSettings = FSAppState.of(context).fSettings!;
    _maxPostEndTime = (_store.level! >= 3) ? _fSettings.l3ETime : _fSettings.l2ETime;

    if (_postingLocationTypes.length == 0){
      // currently only postRegPostStoreAddr supported
      //_postingLocationTypes..add(_s!.postRegPostStoreAddr)..add(_s!.postRegPostStoreCurrentLoc)..add(_s!.postRegPostStoreSelected);
      _postingLocationTypes..add(_s!.postRegPostStoreAddr);
      _postingLocationType = _postingLocationTypes[0];
      _postLoc = LatLng(double.parse(_store.lat), double.parse(_store.lng));
    }
  }

  void _checkPostingLocation() async{
    Map<String, dynamic> arguments = {
      'latLng': LatLng(double.parse(_store.lat), double.parse(_store.lng)),
      'locationCheckType' : LocationCheckType.confirmLocation
    };
    Navigator.of(context).pushNamed('fslocation', arguments: arguments);
  }

  void _submitPressed(){
    // get image path
    List<int?>? products = _productListKey.currentState?.getSelectedProducts();
    DateTime? postingTime = _discountTimeKey.currentState?.getPostingTime();

    // input error
    if(products!.length == 0 || postingTime == null){
      showAlertSnackBar(context, _s!.storeRegResubmit);
    }else{
      //Posting? post = _postInfoKey.currentState!.getPost();
      Posting post = Posting.clone(_post);
      post.lat = _postLoc!.latitude.toStringAsFixed(6);
      post.lng = _postLoc!.longitude.toStringAsFixed(6);
      post.validity = DateFormat("yyyy-MM-dd HH:mm").format(postingTime);

      if(_initialSelectedProduct == products){
        // no change in post
        showAlertSnackBar(context, _s!.commonNoChange);
      }else if(products.length == 0){
        showAlertSnackBar(context, _s!.storeRegResubmit);
      }
      else{
        _regUpdatePost(_store.id, post.toJson(), products);
      }
    }
  }

  void _postRegUpdated(post, products){
    showAlertDialog(context,
      _s!.postRegStartPostNormally,
      null,
      yes: _s!.commonOK,
      yesOnPressed: (){
        // remove dialog
        Navigator.of(context).pop();
        // remove post reg page and send data to store mgmt
        Navigator.of(context).pop({'post': post, 'products': products});
      },
      willPopupActive: true,
    );
  }

  void postExpired(){
    // post expired .. close this page
    logger.d('${this.runtimeType} postExpired');
    Navigator.pop(context);
  }

  void storeLocked(){
    logger.d('${this.runtimeType} storeLocked');
    Navigator.pop(context);
  }
}

extension FSPostRegPageEventFunctions on FSPostRegPageState {
  /*
  define event-related functions in post page below.
  and add FsPostEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase event){
    if(event is FSPostRegUpdatePost) _regUpdatePost(event.storeId, event.post, event.products);
  }

  void _regUpdatePost(storeId, post, products) => BlocProvider.of<FSPostRegBloc>(context).add(
      FSPostRegUpdatePost(token: getSSOToken(context)!, storeId: storeId, post: post, products: products)
  );
}