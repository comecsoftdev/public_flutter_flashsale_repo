import 'package:comecsoft/flashsale/repository/repository.dart';
import 'package:comecsoft/utils/utils.dart';

class WhatToBuyRepository{
  ApiProvider apiProvider = ApiProvider(DioHelper.getDio());

  Future<RegisterUserResponse?> registerUser(final String appToken){
    return apiProvider.registerUser(appToken);
  }

  Future<GetCategoryResponse?> getCategory(final String token){
    return apiProvider.getCategory(token);
  }

  Future<GetAddressResponse?> getAddress(final String token){
    return apiProvider.getAddress(token);
  }

  Future<InitUserDataResponse?> initUserData(final String token, final String extra){
    return apiProvider.initUserData(token, extra);
  }

  Future<GetPostsWithinDistanceResponse?> getPostsWithinDistance(final String token, final String lat, final String lng, final String distance){
    return apiProvider.getPostsWithinDistance(token, lat, lng, distance);
  }

  Future<GetPostsWithinDistrictResponse?> getPostsWithinDistrict(final String token, final String addressID, final String? extra){
    return apiProvider.getPostsWithinDistrict(token, addressID, extra);
  }

  Future<GetPostedStoreResponse?> getPostedStore(final String token, final int id, {final String extra = 'review, myreview'}){
    return apiProvider.getPostedStore(token, id, extra: extra);
  }

  Future<GetMyStoreInfoResponse?> getMyStoreInfo(final String token, final int id){
    return apiProvider.getMyStoreInfo(token, id);
  }

  Future<RegUpdateCommentResponse?> registerComment(final String token, final int? storeId, final int? parent, final String comment){
    return apiProvider.registerComment(token, storeId, parent, comment);
  }

  Future<RegUpdateCommentResponse?> updateComment(final String token, final int? storeId, final int? commentId, final String comment){
    return apiProvider.updateComment(token, storeId, commentId, comment);
  }

  Future<UnRegisterCommentResponse?> unRegisterComment(final String token, final int storeId, final int commentID){
    return apiProvider.unRegisterComment(token, storeId, commentID);
  }

  Future<RegUpdateReviewResponse?> registerReview(final String token, final int? storeId, final int? parent, final String review, final int? rating){
    return apiProvider.registerReview(token, storeId, parent, review, rating);
  }

  Future<RegUpdateReviewResponse?> updateReview(final String token, final int? storeId, final int? reviewId, final String review, final int? rating){
    return apiProvider.updateReview(token, storeId, reviewId, review, rating);
  }

  Future<UnRegisterReviewResponse?> unRegisterReview(final String token, final int storeId, final int reviewID){
    return apiProvider.unRegisterReview(token, storeId, reviewID);
  }

  Future<GetReviewsAndUnAnsweredReviewsResponse?> getReviewsAndUnAnsweredReviews(final String token, final int id, final int? page,
      final int? page_size, final String? base, final String extra){
    return apiProvider.getReviewsAndUnAnsweredReviews(token, id, page, page_size, base, extra);
  }

  Future<ActivateStoreReviewResponse?> activateStoreReview(final String token, final int storeId, final bool enable){
    return apiProvider.activateStoreReview(token, storeId, enable);
  }

  Future<RegisterReviewReportResponse?> registerReviewReport(final String token, final int storeId, final int reviewID){
    return apiProvider.registerReviewReport(token, storeId, reviewID);
  }

  Future<GetReviewsResponse?> getReviews(final String token, final int id, final int? page, final int? page_size, final String? base){
    return apiProvider.getReviews(token, id, page, page_size, base);
  }

  Future<RequestCertCodeResponse?> requestCertCode(final String token, final String phone){
    return apiProvider.requestCertCode(token, phone);
  }

  Future<VerifyCertCodeResponse?> verifyCertCodeType1(final String token, final String phone, final String certCode){
    return apiProvider.verifyCertCodeType1(token, phone, certCode);
  }

  Future<VerifyCertCodeResponse?> verifyCertCodeType2(final String token, final String phone, final String provider, final String id){
    return apiProvider.verifyCertCodeType2(token, phone, provider, id);
  }

  Future<RequestLatLngKaKaoResponse?> requestLatLngKakao(final String token, final String address){
    return apiProvider.requestLatLngKakao(token, address);
  }

  Future<RequestRegionCodeKaKaoResponse?> requestRegionCodeKakao(final String token, final String lat, final String lng){
    return apiProvider.requestRegionCodeKakao(token, lat, lng);
  }

  Future<RegUpdateStoreResponse?> registerStore(final String token, final Map<String, dynamic> owner, final Map<String, dynamic> store){
    return apiProvider.registerStore(token, owner, store);
  }

  Future<UnRegisterStoreResponse?> unregisterStore(final String token, final int id){
    return apiProvider.unregisterStore(token, id);
  }

  Future<RegUpdateStoreResponse?> updateStore(final String token, final int? id, final Map<String, dynamic>? store, final Map<String, dynamic>? owner){
    return apiProvider.updateStore(token, id, store, owner);
  }

  Future<UpdateStoreOwnerResponse?> updateStoreOwner(final String token, final Map<String, dynamic> info){
    return apiProvider.updateStoreOwner(token, info);
  }

  Future<RegUpdateProductResponse?> registerProduct(final String token, final String filePath, final Map<String, dynamic> info){
    return apiProvider.registerProduct(token, filePath, info);
  }

  Future<RegUpdateProductResponse?> updateProduct(final String token, final String? filePath, final Map<String, dynamic> info){
    return apiProvider.updateProduct(token, filePath, info);
  }

  Future<UnRegisterProductResponse?> unRegisterProduct(final String token, final int storeId, final int productId){
    return apiProvider.unRegisterProduct(token, storeId, productId);
  }

  Future<RegUpdateBRCResponse?> registerBusiness(final String token, final String filePath, final int storeId){
    return apiProvider.registerBusinessLicense(token, filePath, storeId);
  }

  Future<UnRegisterBRCResponse?> unRegisterBusiness(final String token, final int storeId, final int registrationId){
    return apiProvider.unRegisterBusinessLicense(token, storeId, registrationId);
  }

  Future<RegUpdateBRCResponse?> updateBusiness(final String token, final String filePath, final int storeId, final int? regId){
    return apiProvider.updateBusinessLicense(token, filePath, storeId, regId);
  }

  Future<RegUpdatePostResponse?> startPosting(final String token, final int storeId, final Map<String, dynamic> info, final List<int> products){
    return apiProvider.startPosting(token, storeId, info, products);
  }

  Future<RegUpdatePostResponse?> updatePosting(final String token, final int storeId, final Map<String, dynamic> info, final List<int> products){
    return apiProvider.updatePosting(token, storeId, info, products);
  }

  Future<UnRegisterPostResponse?> stopPosting(final String token, final int id){
    return apiProvider.stopPosting(token, id);
  }

  Future<GetMyPostingsResponse?> getMyPostings(final String token){
    return apiProvider.getMyPostings(token);
  }

  Future<GetMyPostingResponse?> getMyPosting(final String token, final int placeID, final String extra){
    return apiProvider.getMyPosting(token, placeID, extra);
  }

  Future<RegisterPushTokenResponse?> registerPushToken(final String token, final String type, final String pushToken){
    return apiProvider.registerPushToken(token, type, pushToken);
  }

  Future<RegUpdateRatingResponse?> registerRating(final String token, final int? storeId, final int rating){
    return apiProvider.registerRating(token, storeId, rating);
  }

  Future<RegUpdateRatingResponse?> updateRating(final String token, final int? storeId, final int? ratingId, final int rating){
    return apiProvider.updateRating(token, storeId, ratingId, rating);
  }

  Future<TransferStoreResponse?> storeTransfer(final String token, final String recipient, final int id){
    return apiProvider.storeTransfer(token, recipient, id);
  }

  Future<TransferCancelResponse?> storeCancel(final String token, final int id){
    return apiProvider.storeCancel(token, id);
  }

  Future<TransferAcceptResponse?> storeAccept(final String token, final int storeId, final int giverId,
      final String name, final String phone){
    return apiProvider.storeAccept(token, storeId, giverId, name, phone);
  }

  Future<TransferRejectResponse?> storeReject(final String token, final int id){
    return apiProvider.storeReject(token, id);
  }

  Future<GetSimpleStoreResponse?> getSimpleStore(final String token, final int id){
    return apiProvider.getSimpleStore(token, id);
  }

  Future<RegisterStoreReportResponse?> registerStoreReport(final String token, final int storeId, final int report){
    return apiProvider.registerStoreReport(token, storeId, report);
  }

  Future<GetStoreReportResponse?> getStoreReport(final String token, final int storeId){
    return apiProvider.getStoreReport(token, storeId);
  }

  Future<ReadNoticeResponse?> readNotice(final String token, final String notice){
    return apiProvider.readNotice(token, notice);
  }

  Future<GetMyNoticesResponse?> getMyNotices(final String token){
    return apiProvider.getMyNotices(token);
  }
}