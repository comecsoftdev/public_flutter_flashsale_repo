part of 'settings.dart';

/*
To improve readability, Use extension
 */

extension FSSettingsPageUIFunctions on FSSettingsPageState {
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
      title: _s!.homeDrawerSettings,
    );
  }

  Widget _buildBody() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h,),
          ////////////////////////// [ Accounts ]
          Container(
              child: _buildMainMenu(_s!.settingsAccount)
          ),
          // [ Email ]
          Container(
              child: _buildSubMenu(title: widget.user.email,)
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FSDivider(),
          ),
          // [ log out ]
          Container(
            child: _buildSubMenu(
                title: _s!.settingsLogout,
                onTap: (){
                  showAlertDialog(context,
                    _s!.settingsLogout,
                    _s!.settingsAskLogout,
                    yes: _s!.commonOK,
                    yesOnPressed: (){
                      _sendLogout();
                    },
                    no: _s!.commonCancel,
                    noOnPressed: () => Navigator.pop(context),
                  );
                }
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FSDivider(),
          ),
          // [ Withdrawl ]
          Container(
            child: _buildSubMenu(
                title: _s!.settingUserWithdrawal,
                onTap: (){
                  showAlertDialog(context,
                    _s!.settingUserWithdrawalMembership,
                    _s!.settingUserDataDeleted,
                    yes: _s!.commonOK,
                    yesOnPressed: (){
                      _sendDeleteUser();
                    },
                    no: _s!.commonCancel,
                    noOnPressed: () => Navigator.pop(context),
                  );
                }
            ),
          ),
          FSDivider(),
          SizedBox(height: 25.h,),
          ////////////////////////// [ Data ]
          Container(
            child: _buildMainMenu(_s!.settingsData),
          ),
          // [ Delete Cache ]
          Container(
            child: _buildSubMenu(
              title: _s!.settingsClearCache,
              onTap: (){
                showAlertDialog(context,
                  _s!.settingsWantClearCache,
                  null,
                  yes: _s!.commonOK,
                  yesOnPressed: (){
                    DioHelper.getCacheManager()!.clearAll();
                    Navigator.pop(context);
                  },
                  no: _s!.commonCancel,
                  noOnPressed: () => Navigator.pop(context),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FSDivider(),
          ),
          // [ Update Address ]
          Container(
            child: _buildSubMenu(
              title: _s!.settingsAddressUpdate,
              enable: _updateAddr,
              onTap: (){
                showAlertDialog(context,
                  _s!.settingsUpdateAddress,
                  null,
                  yes: _s!.commonOK,
                  yesOnPressed: (){
                    _getAddress();
                    Navigator.pop(context);
                  },
                  no: _s!.commonCancel,
                  noOnPressed: () => Navigator.pop(context),
                );
              },
            ),
          ),
          FSDivider(),
          SizedBox(height: 25.h,),
          ////////////////////////// [ Authority ]
          Container(
            child: _buildMainMenu(_s!.settingsAuthority),
          ),
          // [ Get Store Manger Authority ]
          (_userType == constants.UserTypeUSER) ? _buildUserAuthority() : _buildOwnerAuthority(),
          FSDivider(),
          SizedBox(height: 25.h,),
          ////////////////////////// [ Misc ]
          Container(
            child: _buildMainMenu(_s!.settingsMisc),
          ),
          // [ Terms Service  ]
          Container(
            child: _buildSubMenu(
              title: _s!.settingsTermsService,
              onTap: (){
                Map<String, dynamic> arguments = {
                  'title': _s!.loginTermsService, 'initialHost': env['TERM_SERVICE']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
                };
                Navigator.of(context).pushNamed('fswebview', arguments: arguments);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FSDivider(),
          ),
          // [ Use of Personal Info ]
          Container(
            child: _buildSubMenu(
              title: _s!.settingsUseCollectionPersonalInfo,
              onTap: (){
                Map<String, dynamic> arguments = {
                  'title': _s!.loginPrivacyPolicy, 'initialHost': env['PRIVACY_POLICY']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
                };
                Navigator.of(context).pushNamed('fswebview', arguments: arguments);
              },
            ),
          ),
          FSDivider(),
          // [ Location-based service terms and conditions ]
          Container(
            child: _buildSubMenu(
              title: _s!.settingsLocationBasedTermsService,
              onTap: (){
                Map<String, dynamic> arguments = {
                  'title': _s!.settingsLocationBasedTermsService, 'initialHost': env['LOCATION_BASE_TERM_SERVICE']!, 'initialPath': '', 'type': WebViewType.WebViewNormal
                };
                Navigator.of(context).pushNamed('fswebview', arguments: arguments);
              },
            ),
          ),
          FSDivider(),
          SizedBox(height: 25.h,),
          ////////////////////////// [ Version ]
          Container(
            child: _buildMainMenu(_s!.settingsVersion),
          ),
          // [ Version Detail  ]
          Container(
            child: _buildSubMenu(
              title: _version,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainMenu(String title){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.color1012,
          fontSize: 15.sp,
          fontFamily: "SpoqaHanSansNeo",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildSubMenu({required String title, bool enable = true, dynamic onTap}){
    Widget subMenu = Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
      child :Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                color: (enable) ?  AppColor.color1010 : AppColor.color1008,
                fontSize: 17.sp,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: (onTap != null) ? Container(
              width: 16.r,
              height: 16.r,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/icon/arrow_right_g.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ) : Container(),
          ),
        ],
      ),
    );

    if (onTap != null && enable){
      return InkWell(
        onTap: () => onTap?.call(),
        child: subMenu,
      );
    }else return subMenu;
  }

  Widget _buildUserAuthority(){
    return Column(
      children: [
        Container(
          child: _buildSubMenu(
            title: _s!.settingsGetStoreManagerAuthority,
            enable: (_storeRecipient != null)? true : false,
            onTap: (){
              _getSimpleStoreInfo(_storeRecipient!.storeId);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOwnerAuthority(){
    return Column(
      children: [
        Container(
          child: _buildSubMenu(
            title: _s!.settingsTransferStoreManagerAuthority,
            enable: (_storeGiver != null) ? false : true,
            onTap: () => _showStoreTransferForGiver(),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: FSDivider(),
        ),
        Container(
          child: _buildSubMenu(
            title: _s!.settingsCancelTransferStoreManagerAuthority,
            enable: (_storeGiver != null) ? true : false,
            onTap: () => showAlertDialog(context,
              _s!.settingsStoreTransferCancel(_storeGiver!.recipient),
              null,
              yes: _s!.commonOK,
              yesOnPressed: (){
                Navigator.pop(context);
                _transferCancel(_storeGiver!.id);
              },
              no: _s!.commonCancel,
              noOnPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }
}

extension FSSettinsPagePrivatePublicFunctions on FSSettingsPageState {
  void _setStateData(){
    _s = S.of(context);

    _userType = FSAppState.of(context).userInfo!.type;
    // If you transferred the store manager privileges as a store manager,
    // storeGiver is Not null, and storeGiver.id is transfer ID
    _storeGiver = FSAppState.of(context).userInfo!.storeGiver;
    // If you have been given store administrator privileges,
    // _storeRecipient is Not null, and storeRecipient.id is transfer ID
    _storeRecipient = FSAppState.of(context).userInfo!.storeRecipient;
    _store = (FSAppState.of(context).userInfo!.store != null) ? FSAppState.of(context).userInfo!.store![0] : null;
    // version name is stored in SSO AppState
    _version = '${getPackageInfo(context).version}';

    _updateAddr = (FSAppState.of(context).fSettings!.addrVer! > FSAppState.of(context).addressBook!.ver) ?  true : false;
  }

  // Shows store transfer page To get the email of the person to whom the store management rights will be transferred
  void _showStoreTransferForGiver(){
    Map<String, dynamic> arguments = {'type' : StoreTransferType.transfer, 'store': _store,};
    Navigator.of(context).pushNamed('fsstoretransfer', arguments: arguments).then((value){
      if(value != null && value is StoreGiver){
        showAlertDialog(context,
          _s!.storeTransferRequestTransfer,
          null,
          yes: _s!.commonOK,
          yesOnPressed: (){
            Navigator.pop(context);
            UserInfo userInfo = FSAppState.of(context).userInfo!;
            userInfo.storeGiver = _storeGiver = value;
            FSAppState.of(context).setUserInfo(userInfo);
            setState(() { });
          },
          willPopupActive: true,
        );
      }
    });
  }

  // Shows store transfer information for the person who will take over store management rights
  void _showStoreTransferForRecipient(Store? store){
    Map<String, dynamic> arguments = {'type' : StoreTransferType.take, 'store': store, 'recipient': _storeRecipient};
    Navigator.of(context).pushNamed('fsstoretransfer', arguments: arguments).then((value){
      // accept store
      if(value != null && value is UserInfo){
        // success accepting store
        showAlertDialog(context,
          _s!.storeTransferTransferSuccess,
          null,
          yes: _s!.commonOK,
          yesOnPressed: (){
            // goto home page
            fsHomePageKey.currentState!.setUserInfo(value);
            Navigator.popUntil(context, ModalRoute.withName('fshome'));
          },
        );
      }
      // reject store
      else if(value != null && value is int){
        UserInfo userInfo = FSAppState.of(context).userInfo!;
        userInfo.storeRecipient = _storeRecipient = null;
        FSAppState.of(context).setUserInfo(userInfo);
        setState(() { });
      }
    });
  }
}

extension FSSettingsPageEventFunctions on FSSettingsPageState {
  /*
  define event-related functions in settings page below.
  and add FsSettingsEvent in _sendEventToResend() to resend this after refreshing token.
   */
  void sendEventToResend(BlocEventBase event){
    if(event is FSSettingSignOut) _sendLogout();
    if(event is FSSettingTransferCancel) _transferCancel(event.transferId);
    if(event is FSSettingGetSimpleStore) _getSimpleStoreInfo(event.storeId);
    if(event is FSSettingGetAddress) _getAddress();
    if(event is FSSettingDeleteUser) _sendDeleteUser();
  }

  void _sendLogout() => BlocProvider.of<FsSettingsBloc>(context).add(FSSettingSignOut(token: getSSOToken(context)!, refresh: getSSORefreshToken(context)!));
  void _sendDeleteUser() => BlocProvider.of<FsSettingsBloc>(context).add(FSSettingDeleteUser(token: getSSOToken(context)!));
  // Cancel the transfer of store
  void _transferCancel(id) => BlocProvider.of<FsSettingsBloc>(context).add(FSSettingTransferCancel(
      token: getSSOToken(context)!, transferId: id));
  // Get simple store information to show to the person who will be transferred
  void _getSimpleStoreInfo(id) => BlocProvider.of<FsSettingsBloc>(context).add(FSSettingGetSimpleStore(
      token: getSSOToken(context)!, storeId: id));
  // Get new address if there is an address update
  void _getAddress() => BlocProvider.of<FsSettingsBloc>(context).add(FSSettingGetAddress(
      token: getSSOToken(context)!));
}