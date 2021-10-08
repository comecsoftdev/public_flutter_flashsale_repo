const double defaultLat = 37.556788;
const double defaultLng = 126.971555;

const int PeriodicUpdateTime = 1;             // location update time in min

const double DefaultFitWidth = 375;              //width of xhdpi
const double DefaultFitHeight = 812;            //height of xhdpi

// store type definition. FIXED or MOVING
const String StoreTypeFixed = 'FIXED';
const String StoreTypeMoving = 'MOVING';

// user type definition. USER or OWNER
const String UserTypeUSER = 'USER';
const String USerTypeOWNER = 'OWNER';

// default page size. same size as server.
const int defaultPageSize = 10;
const int defaultMorePageSize = 20;

// max product count registered in store
// use max product count in FsSettings maxProductCount
const int MAX_PRODUCT_COUNT = 5;
// posting validity min time
const int POSTING_VALIDITY_MIN_TIME = 10;
// max address history count
const int MAX_ADDR_HISTORY_COUNT=10;
// max tags count
const int MAX_TAG_COUNT=5;

// number of category(15 category + 1 etc)
const int numCategory = 16;

// The number of items that increase when scrolling in a post
const int POST_ITEM_INCREMENT = 10;

// max posting time(3 hours)
const int MAX_POSTING_TIME = 180;

// cache time
const GET_POSTED_STORE_CACHE_TIME = 5;
const GET_SIMPLE_STORE_CACHE_TIME = 5;
const GET_STORE_REPORT_CACHE_TIME = 60;
const GET_MY_NOTICE_CACHE_TIME = 30;
const REQUEST_LAT_LNG_KAKAO_CACHE_TIME = 120;

//Todo defaultApp and appName will be got from sso server later.
const String whattobuyApp = 'whattobuy';
const String ssoApp = 'sso';
//default sub app
const String defaultSubApp = whattobuyApp;