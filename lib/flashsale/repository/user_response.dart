import 'package:comecsoft/flashsale/models/models.dart';
import 'package:comecsoft/flashsale/models/settings.dart';
import 'package:comecsoft/common/abstract_base.dart';

class RegisterUserResponse extends RepositoryResponse{
  final String? token;
  final String? refresh;

  RegisterUserResponse({this.token, this.refresh, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return RegisterUserResponse(
      token: json["token"] == null ? null : json["token"],
      refresh: json["refresh"] == null ? null : json["refresh"],
      msg: json['msg'] == null ? null : json['msg'],
      statusCode: statusCode,
    );
  }
}

class GetCategoryResponse extends RepositoryResponse{
  final List<Category>? rootCategories;

  GetCategoryResponse({this.rootCategories, statusCode, msg}) : super(statusCode: statusCode, msg: msg);

  factory GetCategoryResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return GetCategoryResponse(
      statusCode: statusCode,
      msg: json['msg'] == null ? null : json['msg'],
      rootCategories: List.of(json["category"]).map((
          i) => Category.fromJson(i)).toList(),);
  }
}

class GetAddressResponse extends RepositoryResponse{
  final AddressBook? addressBook;

  GetAddressResponse({this.addressBook, statusCode, msg}) : super(statusCode: statusCode, msg: msg);

  factory GetAddressResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return GetAddressResponse(
      statusCode: statusCode,
      msg: json['msg'] == null ? null : json['msg'],
      addressBook: json['address_book'] == null ? null : AddressBook.fromJson(json['address_book']),);
  }
}

class InitUserDataResponse extends RepositoryResponse{
  final UserInfo? userInfo;
  final AddressBook? addressBook;
  final List<Category>? rootCategories;
  final List<Notice>? notices;
  final FsSettings? fSettings;

  InitUserDataResponse({this.userInfo, this.addressBook, this.rootCategories, this.notices, this.fSettings, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory InitUserDataResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return InitUserDataResponse(
      statusCode: statusCode,
      userInfo: json['user_info'] == null ? null : UserInfo.fromJson(json['user_info']),
      addressBook: json['address_book'] == null ? null : AddressBook.fromJson(json['address_book']),
      rootCategories: (json['category'] as List?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))?.toList(),
      notices: (json['notice'] as List?)
          ?.map((e) => Notice.fromJson(e as Map<String, dynamic>))?.toList(),
      fSettings: json['settings'] == null ? null : FsSettings.fromJson(json['settings']),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class GetPostsWithinDistanceResponse extends RepositoryResponse{
  final List<Posting>? postings;

  GetPostsWithinDistanceResponse({this.postings, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory GetPostsWithinDistanceResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return GetPostsWithinDistanceResponse(
      statusCode: statusCode,
      postings: (json['post'] as List?)
          ?.map((e) => Posting.fromJson(e as Map<String, dynamic>))?.toList(),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class GetPostsWithinDistrictResponse extends RepositoryResponse{
  final List<Posting>? postings;
  final LocAddress? address;

  GetPostsWithinDistrictResponse({this.postings, this.address, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory GetPostsWithinDistrictResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return GetPostsWithinDistrictResponse(
      statusCode: statusCode,
      postings: (json['post'] as List?)
          ?.map((e) => Posting.fromJson(e as Map<String, dynamic>))?.toList(),
      address: json['address'] == null
          ? null
          : LocAddress.fromJson(json['address'] as Map<String, dynamic>),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class GetPostedStoreResponse extends RepositoryResponse{
  final Store? store;
  final ReviewInfo? reviewInfo;
  final Review? myReview;

  GetPostedStoreResponse({this.store, this.reviewInfo, this.myReview, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory GetPostedStoreResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return GetPostedStoreResponse(
      statusCode: statusCode,
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
      reviewInfo: json['review'] == null
          ? null
          : ReviewInfo.fromJson(json['review'] as Map<String, dynamic>),
      myReview: json['myreview'] == null
          ? null
          : Review.fromJson(json['myreview'] as Map<String, dynamic>),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class GetMyStoreInfoResponse extends RepositoryResponse{
  final Store? storePlace;

  GetMyStoreInfoResponse({this.storePlace, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory GetMyStoreInfoResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return GetMyStoreInfoResponse(
      statusCode: statusCode,
//      storePlace: (json['place'] as List)
//          ?.map((e) =>
//      e == null ? null : StorePlace.fromJson(e as Map<String, dynamic>))
//          ?.toList(),
      storePlace: json['place'] == null
          ? null
          : Store.fromJson(json['place'] as Map<String, dynamic>),
      msg: json['msg'] == null ? null :json['msg'],
    );
  }
}

class RequestCertCodeResponse extends RepositoryResponse{
  RequestCertCodeResponse({statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RequestCertCodeResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return RequestCertCodeResponse(
      msg: json['msg'] == null ? null : json['msg'],
      statusCode: statusCode,
    );
  }
}

class VerifyCertCodeResponse extends RepositoryResponse{
  VerifyCertCodeResponse({statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory VerifyCertCodeResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return VerifyCertCodeResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
    );
  }
}


class RequestLatLngKaKaoResponse {
  final KakaoMeta? meta;
  final List<KaKaoDocument>? documents;

  RequestLatLngKaKaoResponse({this.meta, this.documents});

  factory RequestLatLngKaKaoResponse.fromJson(Map<String, dynamic> json,){
    return RequestLatLngKaKaoResponse(
      documents: (json['documents'] as List?)
          ?.map((e) => KaKaoDocument.fromJson(e as Map<String, dynamic>))?.toList(),
    );
  }
}

class RequestRegionCodeKaKaoResponse {
  final KakaoMeta? meta;
  final List<KaKaoDocumentRegionCode>? documents;

  RequestRegionCodeKaKaoResponse({this.meta, this.documents});

  factory RequestRegionCodeKaKaoResponse.fromJson(Map<String, dynamic> json,){
    return RequestRegionCodeKaKaoResponse(
      documents: (json['documents'] as List?)
          ?.map((e) => KaKaoDocumentRegionCode.fromJson(e as Map<String, dynamic>))?.toList(),
    );
  }
}

class RegUpdateStoreResponse extends RepositoryResponse{
  final UserInfo? userInfo;
  final Store? store;
  final StoreOwner? storeOwner;

  RegUpdateStoreResponse({this.userInfo, this.store, this.storeOwner, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RegUpdateStoreResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return RegUpdateStoreResponse(
      statusCode: statusCode,
      userInfo: json['user_info'] == null ? null : UserInfo.fromJson(json['user_info']),
      store: json['store'] == null ? null : Store.fromJson(json['store']),
      storeOwner: json['store_owner'] == null ? null : StoreOwner.fromJson(json['store_owner']),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class UnRegisterOwnerNStoreResponse extends RepositoryResponse{
  UnRegisterOwnerNStoreResponse({statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory UnRegisterOwnerNStoreResponse.fromJson(Map<String, dynamic> json, int statusCode){
    return UnRegisterOwnerNStoreResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
    );
  }
}

class UpdateStoreResponse  extends RepositoryResponse{
  final Store? store;
  final StoreOwner? storeOwner;

  UpdateStoreResponse({this.store, this.storeOwner, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory UpdateStoreResponse.fromJson(Map<String, dynamic> json, int statusCode) {
    return UpdateStoreResponse(
      statusCode: statusCode,
      store: json['store'] == null ? null : Store.fromJson(json['store']),
      storeOwner: json['owner'] == null ? null : StoreOwner.fromJson(json['owner']),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class UpdateStoreOwnerResponse  extends RepositoryResponse{
  final StoreOwner? storeOwner;

  UpdateStoreOwnerResponse({this.storeOwner, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory UpdateStoreOwnerResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return UpdateStoreOwnerResponse(
      statusCode: statusCode,
      storeOwner: json['store_owner'] == null ? null : StoreOwner.fromJson(json['store']),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class RegUpdateProductResponse extends RepositoryResponse{
  final Product? product;

  RegUpdateProductResponse({this.product, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RegUpdateProductResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return RegUpdateProductResponse(
      statusCode : statusCode,
      product: json['product'] == null ? null :Product.fromJson(json['product']),
      msg: json['msg'] == null ? null :json['msg'],
    );
  }
}

class UnRegisterStoreResponse extends RepositoryResponse{
  final int? storeId;

  UnRegisterStoreResponse({this.storeId, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory UnRegisterStoreResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return UnRegisterStoreResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null : json['msg'],
      storeId: json['store'] == null ? null : json['store']['id'],
    );
  }
}

class UnRegisterProductResponse extends RepositoryResponse{
  final int? productId;

  UnRegisterProductResponse({this.productId, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory UnRegisterProductResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return UnRegisterProductResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
      productId: json['product'] == null ? null :json['product']['id'],
    );
  }
}

class RegUpdateBRCResponse extends RepositoryResponse{
  final BusinessRegInfo? registration;

  RegUpdateBRCResponse({this.registration, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RegUpdateBRCResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return RegUpdateBRCResponse(
      statusCode : statusCode,
      registration: json['registration'] == null
          ? null
          : BusinessRegInfo.fromJson(json['registration'] as Map<String, dynamic>),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class UnRegisterBRCResponse extends RepositoryResponse{
  final int? registrationId;

  UnRegisterBRCResponse({this.registrationId, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory UnRegisterBRCResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return UnRegisterBRCResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
      registrationId: json['registration'] == null ? null :json['registration']['id'],
    );
  }
}

class RegUpdatePostResponse extends RepositoryResponse{
  final Posting? posting;

  RegUpdatePostResponse({this.posting, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RegUpdatePostResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return RegUpdatePostResponse(
      statusCode : statusCode,
      posting: json['post'] == null ? null :Posting.fromJson(json['post']),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class UnRegisterPostResponse extends RepositoryResponse{
  final int? storeId;
  final ExtraUserInfo? extraUserInfo;

  UnRegisterPostResponse({this.storeId, this.extraUserInfo, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory UnRegisterPostResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return UnRegisterPostResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null : json['msg'],
      storeId: json['post'] == null ? null :json['post']['store'],
      extraUserInfo: json['extra_user_info'] == null ? null :ExtraUserInfo.fromJson(json['extra_user_info']),
    );
  }
}

class GetMyPostingsResponse extends RepositoryResponse{
  final List<Posting>? postings;

  GetMyPostingsResponse({this.postings, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory GetMyPostingsResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return GetMyPostingsResponse(
      statusCode : statusCode,
      postings: (json['posting'] as List?)
          ?.map((e) => Posting.fromJson(e as Map<String, dynamic>))?.toList(),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class GetMyPostingResponse extends RepositoryResponse{
  final Posting? posting;
  final ExtraUserInfo? extraUserInfo;
  final Store? store;
  final CommentInfo? commentInfo;

  GetMyPostingResponse({this.posting, this.extraUserInfo, this.store, this.commentInfo, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory GetMyPostingResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return GetMyPostingResponse(
      statusCode : statusCode,
      posting: json['posting'] == null ? null :Posting.fromJson(json['posting']),
      extraUserInfo: json['extra_user_info'] == null ? null :ExtraUserInfo.fromJson(json['extra_user_info']),
      store: json['store'] == null ? null :Store.fromJson(json['store']),
      commentInfo: json['comment'] == null ? null : CommentInfo.fromJson(json['comment'] as Map<String, dynamic>),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class RegisterPushTokenResponse extends RepositoryResponse{

  RegisterPushTokenResponse({statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RegisterPushTokenResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return RegisterPushTokenResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

// response for register rating and update rating
class RegUpdateRatingResponse extends RepositoryResponse{
  final int? ratingId;

  RegUpdateRatingResponse({this.ratingId, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RegUpdateRatingResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return RegUpdateRatingResponse(
      ratingId: json["rating_id"] == null ? null : json["rating_id"],
      msg: json['msg'] == null ? null : json['msg'],
      statusCode: statusCode,
    );
  }
}

// response for register comment and update comment
class RegUpdateCommentResponse extends RepositoryResponse{
  final Comment? comment;

  RegUpdateCommentResponse({this.comment, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RegUpdateCommentResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return RegUpdateCommentResponse(
      comment: json['comment'] == null ? null :Comment.fromJson(json['comment']),
      msg: json['msg'] == null ? null : json['msg'],
      statusCode: statusCode,
    );
  }
}

class GetReviewsAndUnAnsweredReviewsResponse extends RepositoryResponse{
  final ReviewInfo? reviewInfo;
  final ReviewInfo? unansweredReviewInfo;

  GetReviewsAndUnAnsweredReviewsResponse({this.reviewInfo, this.unansweredReviewInfo, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory GetReviewsAndUnAnsweredReviewsResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return GetReviewsAndUnAnsweredReviewsResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
      reviewInfo: json['review'] == null
          ? null
          : ReviewInfo.fromJson(json['review'] as Map<String, dynamic>),
      unansweredReviewInfo: json['unanswered'] == null
          ? null
          : ReviewInfo.fromJson(json['unanswered'] as Map<String, dynamic>),
    );
  }
}

// response for register review and update review
class RegUpdateReviewResponse extends RepositoryResponse{
  final Review? review;

  RegUpdateReviewResponse({this.review, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RegUpdateReviewResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return RegUpdateReviewResponse(
      review: json['review'] == null ? null :Review.fromJson(json['review']),
      msg: json['msg'] == null ? null : json['msg'],
      statusCode: statusCode,
    );
  }
}

class UnRegisterCommentResponse extends RepositoryResponse{
  final int? commentId;

  UnRegisterCommentResponse({this.commentId, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory UnRegisterCommentResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return UnRegisterCommentResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
      commentId: json['comment_id'] as int?,
    );
  }
}

class UnRegisterReviewResponse extends RepositoryResponse{
  final int? reviewId;

  UnRegisterReviewResponse({this.reviewId, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory UnRegisterReviewResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return UnRegisterReviewResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
      reviewId: json['review_id'] as int?,
    );
  }
}

class RegisterReviewReportResponse extends RepositoryResponse{
  final int? reportId;

  RegisterReviewReportResponse({this.reportId, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RegisterReviewReportResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return RegisterReviewReportResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
      reportId: json['report_id'] as int?,
    );
  }
}

class GetReviewsResponse extends RepositoryResponse{
  final ReviewInfo? reviewInfo;

  GetReviewsResponse({this.reviewInfo, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory GetReviewsResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return GetReviewsResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
      reviewInfo: json['review'] == null
          ? null
          : ReviewInfo.fromJson(json['review'] as Map<String, dynamic>),
    );
  }
}

class TransferStoreResponse extends RepositoryResponse{
  final StoreGiver? storeGiver;

  TransferStoreResponse({this.storeGiver, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory TransferStoreResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return TransferStoreResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
      storeGiver: json['store_giver'] == null
          ? null
          : StoreGiver.fromJson(json['store_giver'] as Map<String, dynamic>),
    );
  }
}

class TransferCancelResponse extends RepositoryResponse{
  final int? transferId;

  TransferCancelResponse({this.transferId, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory TransferCancelResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return TransferCancelResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
    );
  }
}

class TransferAcceptResponse extends RepositoryResponse{
  final UserInfo? userInfo;

  TransferAcceptResponse({this.userInfo, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory TransferAcceptResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return TransferAcceptResponse(
      statusCode: statusCode,
      userInfo: json['user_info'] == null ? null : UserInfo.fromJson(json['user_info']),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class TransferRejectResponse extends RepositoryResponse{
  final int? transferId;

  TransferRejectResponse({this.transferId, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory TransferRejectResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return TransferRejectResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
    );
  }
}

class GetSimpleStoreResponse extends RepositoryResponse{
  final Store? store;

  GetSimpleStoreResponse({this.store, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory GetSimpleStoreResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return GetSimpleStoreResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
    );
  }
}

class RegisterStoreReportResponse extends RepositoryResponse{
  final int? reportId;

  RegisterStoreReportResponse({this.reportId, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory RegisterStoreReportResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return RegisterStoreReportResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null :json['msg'],
      reportId: json['report_id'] as int?,
    );
  }
}

class GetStoreReportResponse extends RepositoryResponse{
  final List<StoreReport>? storeReport;

  GetStoreReportResponse({this.storeReport, statusCode, msg}) : super(statusCode: statusCode, msg: msg);

  factory GetStoreReportResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return GetStoreReportResponse(
      statusCode: statusCode,
      msg: json['msg'] == null ? null : json['msg'],
      storeReport: List.of(json["report"]).map((
          i) => StoreReport.fromJson(i)).toList(),);
  }
}

class ReadNoticeResponse extends RepositoryResponse{

  ReadNoticeResponse({statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory ReadNoticeResponse.fromJson(Map<String, dynamic> json, int? statusCode){
    return ReadNoticeResponse(
      statusCode : statusCode,
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class GetMyNoticesResponse extends RepositoryResponse{
  final List<Notice>? notices;

  GetMyNoticesResponse({this.notices, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory GetMyNoticesResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return GetMyNoticesResponse(
      statusCode: statusCode,
      notices: (json['notice'] as List?)
          ?.map((e) => Notice.fromJson(e as Map<String, dynamic>))?.toList(),
      msg: json['msg'] == null ? null : json['msg'],
    );
  }
}

class ActivateStoreReviewResponse extends RepositoryResponse{
  final bool? enable;

  ActivateStoreReviewResponse({this.enable, statusCode, msg})
      : super(statusCode: statusCode, msg: msg);

  factory ActivateStoreReviewResponse.fromJson(Map<String, dynamic> json, int? statusCode) {
    return ActivateStoreReviewResponse(
      enable: json['enable'] as bool?,
      msg: json['msg'] == null ? null : json['msg'],
      statusCode: statusCode,
    );
  }
}