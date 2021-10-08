import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';
import 'package:comecsoft/common/constants.dart' as constants;

class ApiProvider{
  static const String SIGN_IN = 'signin';
  static const String REGISTER_USER = 'registeruser';
  static const String GET_CATEGORY = "getcategory";
  static const String GET_ADDRESS = "getaddress";
  static const String GET_INIT_USER_DATA = "getinituserdata";
  static const String GET_POSTS_WITHIN_DISTANCE = "getpostswithindistance";
  static const String GET_POSTS_WITHIN_DISTRICT = "getpostswithindistrict";
  static const String GET_POSTED_STORE = "getpostedstore";
  static const String GET_MY_STORE_PLACE = "getmystoreplaceinfo";
  static const String REGISTER_COMMENT = "registercomment";
  static const String UNREGISTER_COMMENT = "unregistercomment";
  static const String REGISTER_COMMENT_REPORT = "registercommentreport";
  static const String UPDATE_COMMENT = "updatecomment";
  static const String GET_COMMENTS = "getcomments";
  static const String REQUEST_CERT_CODE = "requestcertcode";
  static const String VERIFY_CERT_CODE_TYPE1 = "verifycertcodetype1";
  static const String VERIFY_CERT_CODE_TYPE2 = "verifycertcodetype2";
  static const String REGISTER_OWNER_STORE = "registerstore";
  static const String UNREGISTER_STORE = "unregisterstore";
  static const String UPDATE_STORE = "updatestore";
  static const String UPDATE_STORE_OWNER = "updatestoreowner";
  static const String UPDATE_STORE_AND_OWNER = "updatestorenowner";
  static const String REGISTER_PRODUCT = "registerproduct";
  static const String UPDATE_PRODUCT = "updateproduct";
  static const String UNREGISTER_PRODUCT = "unregisterproduct";
  static const String REGISTER_BUSINESS_REG = "registerbusinessreg";
  static const String UNREGISTER_BUSINESS_REG = "unregisterbusinessreg";
  static const String UPDATE_BUSINESS_REG = "updatebusinessreg";
  static const String START_POSTING = "startpost";
  static const String UPDATE_POSTING = "updatepost";
  static const String STOP_POSTING = "stoppost";
  static const String GET_MY_POSTINGS = "getmypostings";
  static const String GET_MY_POSTING = "getmyposting";
  static const String REGISTER_PUSH_DEVICE = "registerpushdevice";
  static const String REGISTER_RATING = "registerrating";
  static const String UPDATE_RATING = "updaterating";
  static const String TRANSFER_STORE = "transferstore";
  static const String TRANSFER_CANCEL = "transfercancel";
  static const String TRANSFER_ACCEPT = "acceptstore";
  static const String TRANSFER_REJECT = "rejectstore";
  static const String GET_SIMPLE_STORE = "getsimplestore";
  static const String REGISTER_STORE_REPORT = "registerstorereport";
  static const String GET_STORE_REPORT = "getstorereports";
  static const String READ_NOTICE = "readnotice";
  static const String GET_MY_NOTICES = "getmynotices";
  static const String REGISTER_REVIEW = "registerreview";
  static const String GET_REVIEWS = "getreviews";
  static const String UNREGISTER_REVIEW = "unregisterreview";
  static const String UPDATE_REVIEW = "updatereview";
  static const String GET_REVIEWS_UNANSWERED = "getreviewsandunansweredreviews";
  static const String REGISTER_REVIEW_REPORT = "registerreviewreport";
  static const String ACTIVATE_STORE_REVIEW = "activatestorereview";

  Dio? _dioFS;

  ApiProvider(this._dioFS);

  /*
  'RegisterUser' will be used when multiple services are included in this lbsfaou app
  Not Used Currnetly
   */
  Future<RegisterUserResponse?> registerUser(final String appToken) async{
    logger.d('${this.runtimeType} registerUser');
    _dioFS!.options.headers.remove("Authorization");

    final FormData formData = new FormData.fromMap({
      "app_token": appToken,
    });

    try{
      Response response = await _dioFS!.post(REGISTER_USER, data: formData);
      return RegisterUserResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegisterUserResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetCategoryResponse?> getCategory(final String token) async{
    logger.d('${this.runtimeType} getCategory ');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
    });

    try{
      Response response = await _dioFS!.post(GET_CATEGORY, data: formData);
      return GetCategoryResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetCategoryResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetAddressResponse?> getAddress(final String token) async{
    logger.d('${this.runtimeType} getAddress ');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
    });

    try{
      Response response = await _dioFS!.post(GET_ADDRESS, data: formData);
      return GetAddressResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetAddressResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<InitUserDataResponse?> initUserData(final String token, final String extra) async{
    logger.d('${this.runtimeType} initUserData ');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "extra": extra,
    });

    try{
      Response response = await _dioFS!.post(GET_INIT_USER_DATA, data: formData);
      return InitUserDataResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = InitUserDataResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetPostsWithinDistanceResponse?> getPostsWithinDistance(final String token, final String lat, final String lng, final String distance) async{
    logger.d('${this.runtimeType} getPostsWithinDistance $lat $lng $distance ');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "lat": lat,
      "lng": lng,
      "distance": distance,
    });

    try{
      Response response = await _dioFS!.post(GET_POSTS_WITHIN_DISTANCE, data: formData);
      return GetPostsWithinDistanceResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetPostsWithinDistanceResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetPostsWithinDistrictResponse?> getPostsWithinDistrict(final String token, final String addressID, final String? extra) async{
    logger.d('${this.runtimeType} getPostsWithinDistrict $addressID');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "address_id": addressID,
      "extra": extra,
    });

    try{
      Response response = await _dioFS!.post(GET_POSTS_WITHIN_DISTRICT, data: formData);
      return GetPostsWithinDistrictResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetPostsWithinDistrictResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetPostedStoreResponse?> getPostedStore(final String token, final int id, {final String? extra}) async{
    logger.d('${this.runtimeType} getPostedStore $id');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": id,
      "extra" : extra,
    });

    try{
      Response response = await _dioFS!.post(GET_POSTED_STORE, data: formData,
        options: buildCacheOptions(Duration(minutes: constants.GET_POSTED_STORE_CACHE_TIME), primaryKey: '{$GET_POSTED_STORE}_{$id}')
      );

      if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
        logger.d('${this.runtimeType} data from cache');
      }

      return GetPostedStoreResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetPostedStoreResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetMyStoreInfoResponse?> getMyStoreInfo(final String token, final int id) async{
    logger.d('${this.runtimeType} getMyStoreInfo $id');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "place_id": id,
    });

    try{
      Response response = await _dioFS!.post(GET_MY_STORE_PLACE, data: formData);
      return GetMyStoreInfoResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetMyStoreInfoResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdateCommentResponse?> registerComment(final String token, final int? storeId, final int? parent, final String comment) async{
    logger.d('${this.runtimeType} registerComment $storeId $parent $comment');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": storeId,
      "comment": comment,
      "parent" : parent,
    });

    try{
      Response response = await _dioFS!.post(REGISTER_COMMENT, data: formData);

      // delete GET_COMMENTS's cache with primary key & GET_POSTED_STORE
      // DioHelper.getCacheManager()!.delete('{$GET_COMMENTS}_{$storeId}');
      DioHelper.getCacheManager()!.delete('{$GET_POSTED_STORE}_{$storeId}');
      return RegUpdateCommentResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdateCommentResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdateCommentResponse?> updateComment(final String token, final int? storeId, final int? commentId, final String comment) async{
    logger.d('${this.runtimeType} updateComment $storeId $commentId $comment');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": storeId,
      "comment": comment,
      "comment_id" : commentId,
    });

    try{
      Response response = await _dioFS!.post(UPDATE_COMMENT, data: formData);

      // delete GET_COMMENTS's cache with primary key & GET_POSTED_STORE
      // DioHelper.getCacheManager()!.delete('{$GET_COMMENTS}_{$storeId}');
      DioHelper.getCacheManager()!.delete('{$GET_POSTED_STORE}_{$storeId}');
      return RegUpdateCommentResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdateCommentResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<UnRegisterCommentResponse?> unRegisterComment(final String token, final int storeId, final int commentId) async{
    logger.d('${this.runtimeType} unRegisterComment $storeId $commentId');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id" : storeId,
      "comment_id": commentId,
    });

    try{
      Response response = await _dioFS!.post(UNREGISTER_COMMENT, data: formData);

      // delete GET_COMMENTS's cache with primary key & GET_POSTED_STORE
      // DioHelper.getCacheManager()!.delete('{$GET_COMMENTS}_{$storeId}');
      DioHelper.getCacheManager()!.delete('{$GET_POSTED_STORE}_{$storeId}');
      return UnRegisterCommentResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = UnRegisterCommentResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdateReviewResponse?> registerReview(final String token, final int? storeId, final int? parent, final String review, final int? rating) async{
    logger.d('${this.runtimeType} registerReview $storeId $parent $review $rating');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": storeId,
      "review": review,
      "parent" : parent,
      "rating" : rating,
    });

    try{
      Response response = await _dioFS!.post(REGISTER_REVIEW, data: formData);

      // delete GET_REVIEWS's cache with primary key & GET_POSTED_STORE
      DioHelper.getCacheManager()!.delete('{$GET_POSTED_STORE}_{$storeId}');
      return RegUpdateReviewResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdateReviewResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<UnRegisterReviewResponse?> unRegisterReview(final String token, final int storeId, final int reviewId) async{
    logger.d('${this.runtimeType} unRegisterReview $storeId $reviewId');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id" : storeId,
      "review_id": reviewId,
    });

    try{
      Response response = await _dioFS!.post(UNREGISTER_REVIEW, data: formData);

      // delete GET_REVIEWS's cache with primary key & GET_POSTED_STORE
      DioHelper.getCacheManager()!.delete('{$GET_POSTED_STORE}_{$storeId}');
      return UnRegisterReviewResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = UnRegisterReviewResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdateReviewResponse?> updateReview(final String token, final int? storeId, final int? reviewId, final String review, final int? rating) async{
    logger.d('${this.runtimeType} updateReview $storeId $reviewId $review $rating');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": storeId,
      "review": review,
      "review_id" : reviewId,
      "rating" : rating
    });

    try{
      Response response = await _dioFS!.post(UPDATE_REVIEW, data: formData);

      // delete GET_REVIES's cache with primary key & GET_POSTED_STORE
      DioHelper.getCacheManager()!.delete('{$GET_POSTED_STORE}_{$storeId}');
      return RegUpdateReviewResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdateReviewResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetReviewsAndUnAnsweredReviewsResponse?> getReviewsAndUnAnsweredReviews(
      final String token, final id, final int? page, final int? page_size, final String? base, final String extra ) async{
    logger.d('${this.runtimeType} getReviewsAndUnAnsweredReviews $id $page $page_size');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": id,
      "page": page,
      "page_size": page_size,
      "base" : base,
      "extra": extra,
    });

    try{
      Response response = await _dioFS!.post(GET_REVIEWS_UNANSWERED, data: formData,);

      return GetReviewsAndUnAnsweredReviewsResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetReviewsAndUnAnsweredReviewsResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<ActivateStoreReviewResponse?> activateStoreReview(
      final String token, final int storeId, final bool enable,) async{
    logger.d('${this.runtimeType} activateStoreReview $storeId $enable');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": storeId,
      'enable': enable,
    });

    try{
      Response response = await _dioFS!.post(ACTIVATE_STORE_REVIEW, data: formData,);

      DioHelper.getCacheManager()!.delete('{$GET_POSTED_STORE}_{$storeId}');
      return ActivateStoreReviewResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = ActivateStoreReviewResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegisterReviewReportResponse?> registerReviewReport(final String token, final int storeID, final int reviewId) async{
    logger.d('${this.runtimeType} registerReviewReport $storeID $reviewId');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id" : storeID,
      "review_id": reviewId,
    });

    try{
      Response response = await _dioFS!.post(REGISTER_REVIEW_REPORT, data: formData);
      return RegisterReviewReportResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegisterReviewReportResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetReviewsResponse?> getReviews(final String token, final id, final int? page, final int? page_size, final String? base) async{
    logger.d('${this.runtimeType} getReviews $id $page $page_size $base');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": id,
      "page": page,
      "page_size": page_size,
      "base" : base
    });

    try{
      Response response = await _dioFS!.post(GET_REVIEWS, data: formData,);

      return GetReviewsResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetReviewsResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RequestCertCodeResponse?> requestCertCode(final String token, final String phone) async{
    logger.d('${this.runtimeType} requestCertCode');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "phone": phone,
    });

    try{
      Response response = await _dioFS!.post(REQUEST_CERT_CODE, data: formData);
      return RequestCertCodeResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RequestCertCodeResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  //verify cert code on whattobuy Server
  Future<VerifyCertCodeResponse?> verifyCertCodeType1(final String token, final String phone, final String certCode) async{
    logger.d('${this.runtimeType} verifyCertCodeType1');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "phone": phone,
      "cert_code": certCode,
    });

    try{
      Response response = await _dioFS!.post(VERIFY_CERT_CODE_TYPE1, data: formData);
      return VerifyCertCodeResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = VerifyCertCodeResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  //verify cert code on firebase Server
  Future<VerifyCertCodeResponse?> verifyCertCodeType2(final String token, final String phone, final String provider, final String id) async{
    logger.d('${this.runtimeType} verifyCertCodeType2');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "phone": phone,
      "provider": provider,
      "user_id": id,
    });

    try{
      Response response = await _dioFS!.post(VERIFY_CERT_CODE_TYPE2, data: formData);
      return VerifyCertCodeResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = VerifyCertCodeResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }
  
  Future<RequestLatLngKaKaoResponse?> requestLatLngKakao(final String token, final String address) async{
    logger.d('${this.runtimeType} requestLatLngKakao $address');

    final String _endpoint = 'https://dapi.kakao.com/v2/local/search/address.json?query=$address';

    var encoded = Uri.encodeFull(_endpoint);
    Options options = Options(
      headers: {
        'Authorization' : 'KakaoAK ' + token,
      },
    );

    options.extra = buildCacheOptions(Duration(minutes: constants.REQUEST_LAT_LNG_KAKAO_CACHE_TIME), primaryKey: 'LatLngKakao_{$address}').extra;

    try{
      Response response = await _dioFS!.get(encoded, options: options);

      if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
        logger.d('${this.runtimeType} data from cache');
      }
      return RequestLatLngKaKaoResponse.fromJson(response.data);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          return RequestLatLngKaKaoResponse.fromJson(error.response!.data);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RequestRegionCodeKaKaoResponse?> requestRegionCodeKakao(final String token, final String lat, final String lng) async{
    logger.d('${this.runtimeType} requestLatLngKakao $lat $lng');

    final String _endpoint = 'https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=$lng&y=$lat';

    var encoded = Uri.encodeFull(_endpoint);
    Options options = Options(
      headers: {
        'Authorization' : 'KakaoAK ' + token,
      },
    );

    options.extra = buildCacheOptions(Duration(minutes: constants.REQUEST_LAT_LNG_KAKAO_CACHE_TIME), primaryKey: 'RegionCodeKakao_{$lat}_{$lng}').extra;

    try{
      Response response = await _dioFS!.get(encoded, options: options);

      if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
        logger.d('${this.runtimeType} data from cache');
      }
      return RequestRegionCodeKaKaoResponse.fromJson(response.data);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RequestRegionCodeKaKaoResponse.fromJson(error.response!.data);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdateStoreResponse?> registerStore(final String token, final Map<String, dynamic> owner, final Map<String, dynamic> store) async{
    logger.d('${this.runtimeType} RegisterStoreResponse $owner $store');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    Map<String, dynamic> parameter = {
      'owner_name': owner['name'],
      'owner_phone': owner['phone'],
      'name': store['name'],
      'phone': store['phone'],
      'address': store['address'],
      'address_detail': store['address_detail'],
      'car_no': store['car_no'],
      'home_url': store['home_url'],
      'type': store['type'],
      'category': store['category'],
      'rgstID': store['rgstID'],
      'lat': store['lat'],
      'lng': store['lng'],
      'tags' : store['tags']
    };

    final FormData formData = new FormData.fromMap(parameter);

    try{
      Response response = await _dioFS!.post(REGISTER_OWNER_STORE, data: formData);
      return RegUpdateStoreResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdateStoreResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<UnRegisterStoreResponse?> unregisterStore(final String token, final int id) async{
    logger.d('${this.runtimeType} unregisterOwnerNStore $id');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": id,
    });

    try{
      Response response = await _dioFS!.post(UNREGISTER_STORE, data: formData);
      return UnRegisterStoreResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = UnRegisterStoreResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdateStoreResponse?> updateStore(final String token, final int? id, final Map<String, dynamic>? store, final Map<String, dynamic>? owner) async{
    logger.d('${this.runtimeType} updateStorePlace $store $owner');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    Map<String, dynamic> parameter = {};
    if(owner != null){
      parameter['owner_name'] = owner['name'];
      parameter['owner_phone'] = owner['phone'];
    }
    if(store != null)
      parameter.addAll(store);

    parameter['store_id'] = id;


    final FormData formData = new FormData.fromMap(parameter);

    try{
      Response response = await _dioFS!.post(UPDATE_STORE_AND_OWNER, data: formData);
      return RegUpdateStoreResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdateStoreResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<UpdateStoreOwnerResponse?> updateStoreOwner(final String token, final Map<String, dynamic> info) async{
    logger.d('${this.runtimeType} updateStoreOwner $info');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    Map<String, dynamic> parameter = {};
    parameter.addAll(info);

    final FormData formData = new FormData.fromMap(parameter);

    try{
      Response response = await _dioFS!.post(UPDATE_STORE_OWNER, data: formData);
      return UpdateStoreOwnerResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = UpdateStoreOwnerResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdateProductResponse?> registerProduct(final String token, final String filePath, final Map<String, dynamic> info) async{
    logger.d('${this.runtimeType} registerProduct $info');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    info['image'] = await MultipartFile.fromFile(filePath);

    Map<String, dynamic> parameter = {
      'store_id': info['store_id'],
      'name': info['name'],
      'comment': info['comment'],
      'price': info['price'],
      'd_price': info['d_price'],
    };

    parameter.addAll(info);

    final FormData formData = new FormData.fromMap(parameter);

    try{
      Response response = await _dioFS!.post(REGISTER_PRODUCT, data: formData);
      return RegUpdateProductResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdateProductResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdateProductResponse?> updateProduct(final String token, final String? filePath, final Map<String, dynamic> info) async{
    logger.d('${this.runtimeType} updateProduct $info');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    info['image'] = filePath == null ? null : await MultipartFile.fromFile(filePath);

    Map<String, dynamic> parameter = {
      'product_id': info['id'],
      'store_id': info['store_id'],
      'name': info['name'],
      'comment': info['comment'],
      'price': info['price'],
      'd_price': info['d_price'],
    };

    parameter.addAll(info);

    final FormData formData = new FormData.fromMap(parameter);

    try{
      Response response = await _dioFS!.post(UPDATE_PRODUCT, data: formData);
      return RegUpdateProductResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdateProductResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<UnRegisterProductResponse?> unRegisterProduct(final String token, final int storeId, final int productId) async{
    logger.d('${this.runtimeType} unRegisterProduct $storeId $productId');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": storeId,
      "product_id": productId,
    });

    try{
      Response response = await _dioFS!.post(UNREGISTER_PRODUCT, data: formData);
      return UnRegisterProductResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = UnRegisterProductResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdateBRCResponse?> registerBusinessLicense(final String token, final String filePath, final int store) async{
    logger.d('${this.runtimeType} registerBusinessLicense $store');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final Map<String, dynamic> info = {
      'store_id': store,
    };

    info['image'] = await MultipartFile.fromFile(filePath);

    final FormData formData = new FormData.fromMap(info);

    try{
      Response response = await _dioFS!.post(REGISTER_BUSINESS_REG, data: formData);
      return RegUpdateBRCResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdateBRCResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<UnRegisterBRCResponse?> unRegisterBusinessLicense(final String token, final int storeId, final int registrationId) async{
    logger.d('${this.runtimeType} registerBusinessLicense $storeId $registrationId');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final Map<String, dynamic> info = {
      'store_id': storeId,
      'registration_id': registrationId
    };

    final FormData formData = new FormData.fromMap(info);

    try{
      Response response = await _dioFS!.post(UNREGISTER_BUSINESS_REG, data: formData);
      return UnRegisterBRCResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = UnRegisterBRCResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdateBRCResponse?> updateBusinessLicense(final String token, final String filePath, final int storeId, final int? regId) async{
    logger.d('${this.runtimeType} updateBusinessLicense $storeId $regId');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final Map<String, dynamic> info = {
      'store_id': storeId,
      'registration_id': regId,
    };

    info['image'] = await MultipartFile.fromFile(filePath);

    final FormData formData = new FormData.fromMap(info);

    try{
      Response response = await _dioFS!.post(UPDATE_BUSINESS_REG, data: formData);
      return RegUpdateBRCResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdateBRCResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdatePostResponse?> startPosting(final String token, final storeId, final Map<String, dynamic> info, final List<int> products) async{
    logger.d('${this.runtimeType} startPosting $info');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": storeId,
      "products": products.join(','),
      "validity": info['validity'],
      "lat": info['lat'],
      "lng": info['lng'],
    });

    try{
      Response response = await _dioFS!.post(START_POSTING, data: formData);

      // delete GET_POSTED_STORE's cache with primary key after start posting
      DioHelper.getCacheManager()!.delete('{$GET_POSTED_STORE}_{$storeId}');

      return RegUpdatePostResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdatePostResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdatePostResponse?> updatePosting(final String token, final storeId, final Map<String, dynamic> info, final List<int> products) async{
    logger.d('${this.runtimeType} startPosting $info');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": storeId,
      "products": products.join(','),
      "validity": info['validity'],
      "lat": info['lat'],
      "lng": info['lng'],
    });

    try{
      Response response = await _dioFS!.post(UPDATE_POSTING, data: formData);
      return RegUpdatePostResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdatePostResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<UnRegisterPostResponse?> stopPosting(final String token, final int id) async{
    logger.d('${this.runtimeType} stopPosting $id');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": id,
    });

    try{
      Response response = await _dioFS!.post(STOP_POSTING, data: formData);

      return UnRegisterPostResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = UnRegisterPostResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetMyPostingsResponse?> getMyPostings(final String token) async{
    logger.d('${this.runtimeType} getMyPostings');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
    });

    try{
      Response response = await _dioFS!.post(GET_MY_POSTINGS, data: formData);
      return GetMyPostingsResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetMyPostingsResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetMyPostingResponse?> getMyPosting(final String token, final int placeID, final String extra) async{
    logger.d('${this.runtimeType} getMyPosting $placeID');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "place_id": placeID,
      "extra": extra,
    });

    try{
      Response response = await _dioFS!.post(GET_MY_POSTING, data: formData);
      return GetMyPostingResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetMyPostingResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegisterPushTokenResponse?> registerPushToken(final String token, final String type, final String pushToken) async{
    logger.d('${this.runtimeType} registerPushToken $type');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "type": type,
      "registration_id": pushToken,
    });

    try{
      Response response = await _dioFS!.post(REGISTER_PUSH_DEVICE, data: formData);
      return RegisterPushTokenResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegisterPushTokenResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdateRatingResponse?> registerRating(final String token, final int? storeId, final int rating) async{
    logger.d('${this.runtimeType} registerRating $storeId $rating');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": storeId,
      "rating": rating,
    });

    try{
      Response response = await _dioFS!.post(REGISTER_RATING, data: formData);

      // delete GET_POSTED_STORE's cache with primary key
      DioHelper.getCacheManager()!.delete('{$GET_POSTED_STORE}_{$storeId}');
      return RegUpdateRatingResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdateRatingResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegUpdateRatingResponse?> updateRating(final String token, final int? storeId, final int? ratingId, final int rating) async{
    logger.d('${this.runtimeType} updateRating $ratingId $rating');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "rating_id": ratingId,
      "store_id": storeId,
      "rating": rating,
    });

    try{
      Response response = await _dioFS!.post(UPDATE_RATING, data: formData);

      // delete GET_POSTED_STORE's cache with primary key
      DioHelper.getCacheManager()!.delete('{$GET_POSTED_STORE}_{$storeId}');
      return RegUpdateRatingResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegUpdateRatingResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<TransferStoreResponse?> storeTransfer(final String token, final recipient, final int id) async{
    logger.d('${this.runtimeType} storeTransfer $recipient $id');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "recipient": recipient,
      "store_id": id,
    });

    try{
      Response response = await _dioFS!.post(TRANSFER_STORE, data: formData);
      return TransferStoreResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = TransferStoreResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<TransferCancelResponse?> storeCancel(final String token, final int id) async{
    logger.d('${this.runtimeType} storeCancel $id');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "transfer_id": id,
    });

    try{
      Response response = await _dioFS!.post(TRANSFER_CANCEL, data: formData);
      return TransferCancelResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = TransferCancelResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<TransferAcceptResponse?> storeAccept(final String token, final int storeId, final int giverId,
      final String name, final String phone) async{
    logger.d('${this.runtimeType} storeAccept $storeId, $giverId, $name, ');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": storeId,
      "giver_id": giverId,
      "owner_phone": phone,
      "owner_name": name,
    });

    try{
      Response response = await _dioFS!.post(TRANSFER_ACCEPT, data: formData);
      return TransferAcceptResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = TransferAcceptResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<TransferRejectResponse?> storeReject(final String token, final int id) async{
    logger.d('${this.runtimeType} storeReject $id');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "transfer_id": id,
    });

    try{
      Response response = await _dioFS!.post(TRANSFER_REJECT, data: formData);
      return TransferRejectResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = TransferRejectResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetSimpleStoreResponse?> getSimpleStore(final String token, final int id) async{
    logger.d('${this.runtimeType} getSimpleStore $id');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": id,
    });

    try{
      Response response = await _dioFS!.post(GET_SIMPLE_STORE, data: formData,
          options: buildCacheOptions(Duration(minutes: constants.GET_SIMPLE_STORE_CACHE_TIME)));

      if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
        logger.d('${this.runtimeType} data from cache');
      }

      return GetSimpleStoreResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetSimpleStoreResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<RegisterStoreReportResponse?> registerStoreReport(final String token, final storeId, final int report) async{
    logger.d('${this.runtimeType} registerStoreReport $storeId $report');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": storeId,
      "report": report,
    });

    try{
      Response response = await _dioFS!.post(REGISTER_STORE_REPORT, data: formData);
      return RegisterStoreReportResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = RegisterStoreReportResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetStoreReportResponse?> getStoreReport(final String token, final storeId) async{
    logger.d('${this.runtimeType} registerStoreReport $storeId');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "store_id": storeId,
    });

    try{
      Response response = await _dioFS!.post(GET_STORE_REPORT, data: formData,
          options: buildCacheOptions(Duration(minutes: constants.GET_STORE_REPORT_CACHE_TIME)));

      if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
        logger.d('${this.runtimeType} data from cache');
      }

      return GetStoreReportResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetStoreReportResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<ReadNoticeResponse?> readNotice(final String token, final String notice) async{
    logger.d('${this.runtimeType} readNotice $notice');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
      "notices": notice
    });

    try{
      Response response = await _dioFS!.post(READ_NOTICE, data: formData);
      return ReadNoticeResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = ReadNoticeResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }

  Future<GetMyNoticesResponse?> getMyNotices(final String token) async{
    logger.d('${this.runtimeType} getMyNotices ');
    _dioFS!.options.headers["Authorization"] = "JWT $token";

    final FormData formData = new FormData.fromMap({
    });

    try{
      Response response = await _dioFS!.post(GET_MY_NOTICES, data: formData,
          options: buildCacheOptions(Duration(minutes: constants.GET_MY_NOTICE_CACHE_TIME)));

      if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
        logger.d('${this.runtimeType} data from cache');
      }

      return GetMyNoticesResponse.fromJson(response.data, response.statusCode);
    }on DioError catch (error) {
      logger.d('${this.runtimeType} Exception occurred: $error');
      var response;
      try{
        if(error.response != null) {
          response = GetMyNoticesResponse.fromJson(error.response!.data, error.response!.statusCode);
        }
      }catch (e){}
      return response;
    }
  }
}