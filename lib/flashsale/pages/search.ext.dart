part of 'search.dart';

/*
To improve readability, Use extension
 */

extension FSSearchPageUIFunctions on FSSearchPageState {
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
      height: 60.h,
      color: AppColor.color101,
      padding: EdgeInsets.fromLTRB(10.w, 10.h, 20.w, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          // [ Please enter your search word ]
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  margin: EdgeInsets.all(10.r),
                  width: 24.r,
                  height: 24.r,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/icon/arrow_left_b.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Container(
                width: 271.w,
                child: TextField(
                  textInputAction: TextInputAction.search,
                  controller: _searchFieldController,
                  maxLength: 10,
                  cursorColor: AppColor.color201,
                  decoration: InputDecoration(
                      hintText: _s!.searchEnterSearchWord,
                      hintStyle: TextStyle(
                          color: AppColor.color1020,
                          fontSize: 16.sp
                      ),
                      counterText: "",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.color101),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.color101),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0)),
                  onChanged: (value) => _searchOnChange.add(value),
                ),
              ),
            ],
          ),
          Spacer(),
          FSDivider(),
        ],
      ),
    );
  }

  Widget _buildBody(){
    return (_itemCount > 0) ?
    Scrollbar(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
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
    ):
    Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            width: 50.r,
            height: 50.r,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/icon/search2_g.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Text(
            _s!.searchEnterDifferentKeyword,
            style: TextStyle(
              color: AppColor.color1020,
              fontSize: 15.sp,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

extension FSSearchPagePrivatePublicFunctions on FSSearchPageState {
  void _setStateData(){
    _s = S.of(context);

    // use all categories to search (not use category filter)
    _searchCategory = FSAppState.of(context).categoryMap!.keys.toList() as List<int>;

    // get the latest post from FSAppState.
    _posts = FSAppState.of(context).posts;

    // get selected post using category from all posts
    _selectedPosts = getSelectedPosts(_posts, FSAppState.of(context).lastLatLng!.latitude,
        FSAppState.of(context).lastLatLng!.longitude, FSAppState.of(context).searchingRule!, _searchCategory);
    // get filtered post using search word from selected posts
    _selectedFilteredPosts = _filterSearchResults(_selectedPosts);
  }

  void _searchWordChanged(word){
    logger.d('${this.runtimeType} _searchWordChanged $word');
    setState(() {
      _searchWord = word;
      _itemCount = constants.POST_ITEM_INCREMENT;
    });
  }

  List<dynamic>? _filterSearchResults(List<dynamic>? sPosts) {
    List<dynamic>? filtered = [];

    if (_searchWord != null && _searchWord!.length >= 2){
      logger.d('${this.runtimeType} _filterSearchResults $_searchWord ');
      sPosts!.forEach((item) {
        // check if store name or store address contains _searchWord
        if(item.name.contains(_searchWord) || item.address.contains(_searchWord) )  {
          filtered!.add(item);
        }else{
          // check if tags contains _searchWord
          item.tags.forEach((tag) {
            if(tag.contains(_searchWord)){
              filtered!.add(item);
            }
          });
        }
      });
    }else
      filtered = [];

    return filtered;
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

  void _postItemTapped(Posting posting){
    logger.d('${this.runtimeType} _listTapped ${posting.name}');
    hideSoftKeyboard(context);

    // goto store page with posting info
    Map<String, dynamic> arguments = {'post':  posting,};
    Navigator.of(context).pushNamed('fsstore', arguments: arguments);
  }
}