part of 'post.dart';

/*
To improve readability, Use extension
 */

extension FSPostPageUIFunctions on FSPostPageState {
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
    return Container(
      color: AppColor.color101,
      height: 50.h,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 0, 10.w, 0),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  // [ location name ]
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 190.w,
                        ),
                        child: Text(
                          fsHomePageKey.currentState!.getCurrentLocName(),
                          style: TextStyle(
                            color: AppColor.color1008,
                            fontSize: 18.sp,
                            fontFamily: "SpoqaHanSansNeo",
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 12.r,
                        height: 12.r,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/icon/arrow_drop_down2.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                  Spacer(),
                  // [ search ]
                  InkWell(
                    onTap: () {
                      // Map<String, dynamic> arguments = {'post': _posts, };
                      Navigator.of(context).pushNamed('fssearch');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      width: 24.r,
                      height: 24.r,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/icon/search.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  // [ select category ]
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
                        ),
                        context: context,
                        builder: (BuildContext context){
                          return CategoryGridMenuWidget(categories: FSAppState.of(context).rootCategories, selected: _searchCategory, onChanged: _categoryChanged);
                        },
                        barrierColor: AppColor.color203,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      width: 24.r,
                      height: 24.r,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/icon/category.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  // [ go home ]
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      width: 24.r,
                      height: 24.r,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/icon/home_b.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FSDivider(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(){
    return (_itemCount > 0) ?
    Scrollbar(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 0.h),
        child: ListView.builder(
          controller: _scrollController,
          primary: false,
          shrinkWrap: true,
          itemCount: _itemCount,
          itemBuilder: (BuildContext context, int index) => Container(
            padding: EdgeInsets.only(top: 15.h,),
            child: Column(
              children: [
                PostItemWidget(
                  posting: _selectedFilteredPosts![index],
                  onTap: _postItemTapped,
                ),
                SizedBox(height: 15.h,),
                FSDivider(),
              ],
            ),
          ),
        ),
      ),
    ) :
    Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _s!.postNoDiscountStore,
            style: TextStyle(
              color: AppColor.color1012,
              fontSize: 16.sp,
              fontFamily: "SpoqaHanSansNeo",
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '(${_s!.postCheckCategory})',
            style: TextStyle(
              color: AppColor.color1012,
              fontSize: 16.sp,
              fontFamily: "SpoqaHanSansNeo",
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

extension FSPostPagePrivatePublicFunctions on FSPostPageState {
  void _setStateData(){
    _s = S.of(context);

    // use FSAppState.of(context).searchingRule!.categories to check dynamic change of category selection
    _searchCategory = FSAppState.of(context).searchingRule!.categories ?? [];

    // get the latest post from FSAppState.
    _posts = FSAppState.of(context).posts;

    // get selected post from all posts
    _selectedPosts = getSelectedPosts(_posts, FSAppState.of(context).lastLatLng!.latitude,
        FSAppState.of(context).lastLatLng!.longitude, FSAppState.of(context).searchingRule!, _searchCategory);

    // get filtered post from selected posts
    _selectedFilteredPosts = _filterSearchResults(_selectedPosts);
  }

  List<dynamic>? _filterSearchResults(List<dynamic>? posts) {
    // NOT Use _searchWord in post.dart. Search is supported in search.dart
    return posts;
  }

  void _scrollListener() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      // add items SliverChildBuilderDelegate()
      setState(() {
        _itemCount += constants.POST_ITEM_INCREMENT;
      });
    }
  }

  void _categoryChanged({List<int>? selected}){
    setState(() {
      _searchCategory = selected ?? [];
      _itemCount = constants.POST_ITEM_INCREMENT;
    });

    //call home's _categoryChanged to update FSAppState.of(context).searchingRule!.categories
    fsHomePageKey.currentState!.categoryChanged(selected: selected);
  }

  void _postItemTapped(Posting posting){
    logger.d('${this.runtimeType} _listTapped ${posting.name}');
    hideSoftKeyboard(context);

    // goto store page with posting info
    Map<String, dynamic> arguments = {'post':  posting,};
    Navigator.of(context).pushNamed('fsstore', arguments: arguments);
  }
}