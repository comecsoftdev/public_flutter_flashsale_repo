// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko_KR locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko_KR';

  static String m0(name) => "앱 사용을 위해서 ${name} 권한을 허용바랍니다.";

  static String m1(name) => "OK를 누리시고 - 권한 - ${name} - 허용을 선택하시면 됩니다.";

  static String m2(name1) => "서비스 제공 시간은 ${name1}시까지입니다.\n향후 늘리도록 하겠습니다.";

  static String m3(name1, name2) =>
      "서비스 제공 시간은\n${name1}시부터 ${name2}시까지입니다.\n향후 늘리도록 하겠습니다.";

  static String m4(name) => "게시 시간은 최소 ${name}분 이상입니다";

  static String m5(name) => "가게에 최대 ${name}개 상품을 등록할 수 있습니다";

  static String m6(name) => "${name}의 할인 게시글을 신고하는 이유를 선택해주세요.";

  static String m7(name) => "전체(${name})";

  static String m8(name) => "미답변(${name})";

  static String m9(name) => "${name}로 가게 이관을 취소하시겠습니까?";

  static String m10(name) => "가게를 나타내는 검색어(최대${name}개)";

  static String m11(name) => "총 ${name}건의 신고가 접수되었습니다";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "brcRegBRCImage": MessageLookupByLibrary.simpleMessage("사업자 등록증 이미지"),
        "brcRegEnterBRCInfo":
            MessageLookupByLibrary.simpleMessage("사업자 등록증 입력"),
        "commonAddressSearch": MessageLookupByLibrary.simpleMessage("주소 검색"),
        "commonAllOK": MessageLookupByLibrary.simpleMessage("모두 확인"),
        "commonApplicationError":
            MessageLookupByLibrary.simpleMessage("프로그램 에러"),
        "commonApprovePermission": m0,
        "commonApprovePermissionDetail": m1,
        "commonBusinessNum": MessageLookupByLibrary.simpleMessage("사업자번호"),
        "commonCancel": MessageLookupByLibrary.simpleMessage("취소"),
        "commonChecking": MessageLookupByLibrary.simpleMessage("확인 중"),
        "commonClose": MessageLookupByLibrary.simpleMessage("닫기"),
        "commonConfirmed": MessageLookupByLibrary.simpleMessage("확인완료"),
        "commonConnectAgain": MessageLookupByLibrary.simpleMessage("다시 접속합니다."),
        "commonConnectAgainLater":
            MessageLookupByLibrary.simpleMessage("잠시 후에 다시 접속합니다."),
        "commonDelete": MessageLookupByLibrary.simpleMessage("삭제"),
        "commonDetails": MessageLookupByLibrary.simpleMessage("상세 내역"),
        "commonDone": MessageLookupByLibrary.simpleMessage("완료"),
        "commonEditReply": MessageLookupByLibrary.simpleMessage("답변 수정"),
        "commonEditReview": MessageLookupByLibrary.simpleMessage("리뷰 수정"),
        "commonEnd": MessageLookupByLibrary.simpleMessage("종료"),
        "commonErrorCode": MessageLookupByLibrary.simpleMessage("에러 코드"),
        "commonErrorInitialize":
            MessageLookupByLibrary.simpleMessage("앱 초기화 에러"),
        "commonErrorInputSearchTag": MessageLookupByLibrary.simpleMessage(
            "2~6글자(한글기준), 한글, 영문, 숫자만 입력가능합니다"),
        "commonErrorMaxSearchTag":
            MessageLookupByLibrary.simpleMessage("최대 5개 검색어까지 입력할 수 있습니다"),
        "commonErrorPickingImage":
            MessageLookupByLibrary.simpleMessage("이미지 선택 오류"),
        "commonErrorPickingImage2": MessageLookupByLibrary.simpleMessage(
            "이미지를 선택하지 않았거나 이미지에 오류가 있습니다"),
        "commonFailed": MessageLookupByLibrary.simpleMessage("실패"),
        "commonInputSearchTag":
            MessageLookupByLibrary.simpleMessage("검색에 필요한 태그를 입력하세요"),
        "commonIntroduce": MessageLookupByLibrary.simpleMessage("소개"),
        "commonList1": MessageLookupByLibrary.simpleMessage("건"),
        "commonLocation": MessageLookupByLibrary.simpleMessage("위치"),
        "commonLocationCheck": MessageLookupByLibrary.simpleMessage("위치 확인"),
        "commonLocationCheck2": MessageLookupByLibrary.simpleMessage("위치확인"),
        "commonLocationFailedD":
            MessageLookupByLibrary.simpleMessage("현재 위치를 찾는데 실패했습니다."),
        "commonManager": MessageLookupByLibrary.simpleMessage("사장님"),
        "commonManagerAnswer": MessageLookupByLibrary.simpleMessage("사장님 답변"),
        "commonMin": MessageLookupByLibrary.simpleMessage("분"),
        "commonModify": MessageLookupByLibrary.simpleMessage("수정"),
        "commonNetworkError": MessageLookupByLibrary.simpleMessage("네트워크 에러"),
        "commonNext": MessageLookupByLibrary.simpleMessage("다음"),
        "commonNextTime": MessageLookupByLibrary.simpleMessage("다음에"),
        "commonNoChange": MessageLookupByLibrary.simpleMessage("변경된 사항이 없습니다"),
        "commonNotPost": MessageLookupByLibrary.simpleMessage("미게시"),
        "commonOK": MessageLookupByLibrary.simpleMessage("확인"),
        "commonOR": MessageLookupByLibrary.simpleMessage("혹은"),
        "commonPermissionDenied": MessageLookupByLibrary.simpleMessage("권한 거부"),
        "commonPhone": MessageLookupByLibrary.simpleMessage("전화"),
        "commonPost": MessageLookupByLibrary.simpleMessage("게시"),
        "commonPostingExpired":
            MessageLookupByLibrary.simpleMessage("가게 게시가 만료되었습니다"),
        "commonProduct": MessageLookupByLibrary.simpleMessage("상품"),
        "commonRateAndReview":
            MessageLookupByLibrary.simpleMessage("별점과 리뷰를 작성해주세요"),
        "commonRegSuccess":
            MessageLookupByLibrary.simpleMessage("정상적으로 등록되었습니다"),
        "commonRegistration": MessageLookupByLibrary.simpleMessage("등록하기"),
        "commonReply": MessageLookupByLibrary.simpleMessage("답변"),
        "commonReport": MessageLookupByLibrary.simpleMessage("신고"),
        "commonReportCompleted": MessageLookupByLibrary.simpleMessage("신고 완료"),
        "commonReportVerb": MessageLookupByLibrary.simpleMessage("신고하기"),
        "commonReview": MessageLookupByLibrary.simpleMessage("리뷰"),
        "commonReviewHint": MessageLookupByLibrary.simpleMessage(
            "만족스러운 방문이었나요? 솔직한 방문후기를 남겨주세요. 다른분들께 큰 도움이 된답니다."),
        "commonSelectCorrectLocation":
            MessageLookupByLibrary.simpleMessage("정확한 위치를 선택한 뒤에 확인 버튼을 눌러주세요"),
        "commonSelectDone": MessageLookupByLibrary.simpleMessage("선택 완료"),
        "commonSelectImage":
            MessageLookupByLibrary.simpleMessage("이미지를 선택해주세요"),
        "commonSelected": MessageLookupByLibrary.simpleMessage("선택"),
        "commonSplashAllAroundMe":
            MessageLookupByLibrary.simpleMessage("내 주변의 모~든"),
        "commonSplashDiscount": MessageLookupByLibrary.simpleMessage("할인"),
        "commonSplashGage": MessageLookupByLibrary.simpleMessage("가게"),
        "commonSplashRo": MessageLookupByLibrary.simpleMessage("로"),
        "commonStart": MessageLookupByLibrary.simpleMessage("시작"),
        "commonStoreReport": MessageLookupByLibrary.simpleMessage("가게 신고"),
        "commonSuccess": MessageLookupByLibrary.simpleMessage("성공"),
        "commonTimeFormat1": MessageLookupByLibrary.simpleMessage("yyyy.MM.dd"),
        "commonTimeFormat2": MessageLookupByLibrary.simpleMessage("HH시 mm분"),
        "commonTimeFormat3":
            MessageLookupByLibrary.simpleMessage("yyyy.MM.dd HH:MM"),
        "commonTotal": MessageLookupByLibrary.simpleMessage("전체"),
        "commonTryAgain": MessageLookupByLibrary.simpleMessage("다시 시도합니다."),
        "commonUnSelected": MessageLookupByLibrary.simpleMessage("선택해제"),
        "commonUntil": MessageLookupByLibrary.simpleMessage("까지"),
        "commonView": MessageLookupByLibrary.simpleMessage("보기"),
        "commonViewImage": MessageLookupByLibrary.simpleMessage("이미지 보기"),
        "commonWon": MessageLookupByLibrary.simpleMessage("원"),
        "commonWriteCompleted": MessageLookupByLibrary.simpleMessage("작성 완료"),
        "commonWriteReply": MessageLookupByLibrary.simpleMessage("답변을 작성해주세요"),
        "commonWriteReply2": MessageLookupByLibrary.simpleMessage("답변 작성"),
        "commonWriteReview": MessageLookupByLibrary.simpleMessage("리뷰 작성"),
        "homeCheckCurrentLocation":
            MessageLookupByLibrary.simpleMessage("현재 위치를 확인중입니다."),
        "homeCurrentLocationUnknown":
            MessageLookupByLibrary.simpleMessage("현재 위치를 알수가 없습니다."),
        "homeDirectLocationSelection":
            MessageLookupByLibrary.simpleMessage("직접 위치 선택"),
        "homeDrawerADComment": MessageLookupByLibrary.simpleMessage(
            "광고를 시청하지 않아도 사용하시는데는 전혀 문제가 없습니다.서비스 유지 및 관리를 위해 가끔씩 광고 시청부탁드립니다."),
        "homeDrawerHelp": MessageLookupByLibrary.simpleMessage("도움말"),
        "homeDrawerMyPosting": MessageLookupByLibrary.simpleMessage("나의 게시 정보"),
        "homeDrawerMyStoreInfo":
            MessageLookupByLibrary.simpleMessage("나의 가게 정보"),
        "homeDrawerNoNotice":
            MessageLookupByLibrary.simpleMessage("공지사항이 없습니다."),
        "homeDrawerNotice": MessageLookupByLibrary.simpleMessage("공지사항"),
        "homeDrawerRegProduct":
            MessageLookupByLibrary.simpleMessage("나의 상품 등록"),
        "homeDrawerRegStore": MessageLookupByLibrary.simpleMessage("나의 가게 등록"),
        "homeDrawerRemoveCache": MessageLookupByLibrary.simpleMessage("캐시 삭제"),
        "homeDrawerSettings": MessageLookupByLibrary.simpleMessage("설정"),
        "homeDrawerStartPost": MessageLookupByLibrary.simpleMessage("게시 시작"),
        "homeDrawerStopPost": MessageLookupByLibrary.simpleMessage("게시 중지"),
        "homeDrawerUnregStore":
            MessageLookupByLibrary.simpleMessage("나의 가게 삭제"),
        "homeDrawerWatchAD": MessageLookupByLibrary.simpleMessage("광고 보기"),
        "homeExitApp": MessageLookupByLibrary.simpleMessage(
            "종료하기 위해서 2초안에 백키를 한번 더 눌러주세요."),
        "homeHelpDirectLocationSelection": MessageLookupByLibrary.simpleMessage(
            "1. 원하시는 위치를 직접 선택하시면 됩니다\n2. 현재는 일부 지역만 서비스가 지원됩니다\n3. 서비스가 지원되는 지역은 차츰 확대할 예정입니다"),
        "homeMessageReceived": MessageLookupByLibrary.simpleMessage("메세지 수신"),
        "homeNoLocationAvailable":
            MessageLookupByLibrary.simpleMessage("선택이 가능한 위치가 없습니다"),
        "homeNoPostingStore":
            MessageLookupByLibrary.simpleMessage("게시하고 있는 가게 없음."),
        "homePreSelectedLocation":
            MessageLookupByLibrary.simpleMessage("이전에 선택한 위치"),
        "homeSearchingLocationNData":
            MessageLookupByLibrary.simpleMessage("현재 위치를 찾고 초기 데이터를 가지고 옵니다."),
        "homeSelectLocation":
            MessageLookupByLibrary.simpleMessage("위치를 선택해주세요"),
        "homeServiceEndTimeWarning": m2,
        "homeServiceTime": MessageLookupByLibrary.simpleMessage("서비스 시간"),
        "homeServiceTimeWarning": m3,
        "homeSetCurrentLocation":
            MessageLookupByLibrary.simpleMessage("현재 위치로 설정"),
        "homeUpdateRequired":
            MessageLookupByLibrary.simpleMessage("새로운 버전이 있습니다\n업데이트가 필요합니다."),
        "homeWantToUpdate":
            MessageLookupByLibrary.simpleMessage("새로운 버전이 있습니다\n업데이트 하시겠습니까?"),
        "introDiscountStore": MessageLookupByLibrary.simpleMessage("할인중인 가게"),
        "introDuringBusiness": MessageLookupByLibrary.simpleMessage(
            "영업중에도 쉽고 빠르게\n정보를 업로드할 수 있습니다."),
        "introEasyComfortable": MessageLookupByLibrary.simpleMessage("쉽고 편하게"),
        "introEncourageCustomers":
            MessageLookupByLibrary.simpleMessage("매력적인 혜택으로\n고객 방문을 유도해보세요."),
        "introFind": MessageLookupByLibrary.simpleMessage("찾기"),
        "introFindService": MessageLookupByLibrary.simpleMessage(
            "음식부터 다양한 잡화까지\n필요한 서비스를 찾아보세요."),
        "introIs": MessageLookupByLibrary.simpleMessage("은"),
        "introMeetStore": MessageLookupByLibrary.simpleMessage(
            "현재 내 주변에서 할인을 진행하고 있는\n가게들을 만나보세요."),
        "introNearMe": MessageLookupByLibrary.simpleMessage("내 근처"),
        "introNearbyCustomer": MessageLookupByLibrary.simpleMessage("주변 고개"),
        "introNotifyDiscount": MessageLookupByLibrary.simpleMessage(
            "근처에 있는 고객에게\n가게의 할인 소식을 알려보세요."),
        "introPromote": MessageLookupByLibrary.simpleMessage("내 가게 홍보하기"),
        "introSales": MessageLookupByLibrary.simpleMessage("곧 매출"),
        "introStoreVisit": MessageLookupByLibrary.simpleMessage("매장 방문"),
        "introTakeLook": MessageLookupByLibrary.simpleMessage("살펴보기"),
        "introTo": MessageLookupByLibrary.simpleMessage("에게"),
        "introUse": MessageLookupByLibrary.simpleMessage("사용하기"),
        "introVariousCategory": MessageLookupByLibrary.simpleMessage("다양한 업종"),
        "introVisitStore": MessageLookupByLibrary.simpleMessage(
            "손 쉽게 원하는 정보를 찾고\n바로 가게를 방문해보세요."),
        "loginAgreeLocationBased":
            MessageLookupByLibrary.simpleMessage("위치기반서비스이용약관 동의(필수)"),
        "loginAgreePrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("개인정보처리방침 동의(필수)"),
        "loginAgreeTermPrivacy":
            MessageLookupByLibrary.simpleMessage("이용 약관과 개인정보처리방침에 동의해주세요"),
        "loginAgreeTermsAndCondition":
            MessageLookupByLibrary.simpleMessage("이용약관동의(필수)"),
        "loginAppServerAuthError":
            MessageLookupByLibrary.simpleMessage("어플리케이션 서버 인증 오류"),
        "loginAuthError": MessageLookupByLibrary.simpleMessage("인증 실패"),
        "loginFacebook": MessageLookupByLibrary.simpleMessage("페이스북"),
        "loginFailed": MessageLookupByLibrary.simpleMessage("로그인 실패"),
        "loginFailedAndTryAgain":
            MessageLookupByLibrary.simpleMessage("로그인에 실패했습니다. 다시 한번 시도해주세요."),
        "loginGoogle": MessageLookupByLibrary.simpleMessage("구글"),
        "loginPrivacyPolicy": MessageLookupByLibrary.simpleMessage("개인정보처리방침"),
        "loginSessionExpired":
            MessageLookupByLibrary.simpleMessage("로그인 세션 만료"),
        "loginSignIn": MessageLookupByLibrary.simpleMessage("로그인"),
        "loginTermsService": MessageLookupByLibrary.simpleMessage("이용약관"),
        "loginTryAgain": MessageLookupByLibrary.simpleMessage("다시 로그인 합니다."),
        "loginWithFacebook":
            MessageLookupByLibrary.simpleMessage("페이스북계정으로 시작하기"),
        "loginWithGoogle": MessageLookupByLibrary.simpleMessage("구글계정으로 시작하기"),
        "myStoreBusinessReg": MessageLookupByLibrary.simpleMessage("사업자등록증"),
        "myStoreBusinessRegDesc": MessageLookupByLibrary.simpleMessage(
            "1. 사업자등록증을 사진으로 찍거나 앨범에서 선택해서 등록할 수 있습니다\n2. 현재는 사업자등록증을 등록하지 않아도 서비스 이용이 가능합니다\n3. 향 후, 서비스 개편 혹은 추가등에 따라 사업자등록증을 필수로 등록해야할 수 도 있습니다"),
        "myStoreDeleteBRC":
            MessageLookupByLibrary.simpleMessage("사업자등록증을 삭제하시겠습니까?"),
        "myStoreDeleteProduct":
            MessageLookupByLibrary.simpleMessage("상품을 삭제하시겠습니까?"),
        "myStoreDeleteStore":
            MessageLookupByLibrary.simpleMessage("가게를 삭제하시겠습니까?"),
        "myStoreLocked":
            MessageLookupByLibrary.simpleMessage("가게가 잠겨진 상태로 게시가 불가능합니다"),
        "myStoreMyStore": MessageLookupByLibrary.simpleMessage("나의 가게"),
        "myStoreNoProduct":
            MessageLookupByLibrary.simpleMessage("등록된 상품이 없습니다"),
        "myStoreNotPosted":
            MessageLookupByLibrary.simpleMessage("가게가 게시 되지 않음"),
        "myStoreNotRegistered": MessageLookupByLibrary.simpleMessage("등록 안됨"),
        "myStorePosting": MessageLookupByLibrary.simpleMessage("가게 게시"),
        "myStoreRegisterProduct":
            MessageLookupByLibrary.simpleMessage("상품을 등록하세요"),
        "myStoreSelectBRC":
            MessageLookupByLibrary.simpleMessage("사업자등록증을 선택하세요"),
        "myStoreStopPosting":
            MessageLookupByLibrary.simpleMessage("게시를 중지하시겠습니까?"),
        "myStoreToBeLocked":
            MessageLookupByLibrary.simpleMessage("가게가 잠겨진 상태로 변경되었습니다"),
        "myStoreViewMyPosting":
            MessageLookupByLibrary.simpleMessage("나의 가게 게시 보기"),
        "postCategoryNotSet":
            MessageLookupByLibrary.simpleMessage("카테고리 설정이 되지 않았는지 확인해주세요."),
        "postCheckCategory":
            MessageLookupByLibrary.simpleMessage("카테고리 설정을 확인해주세요."),
        "postListSearchStore": MessageLookupByLibrary.simpleMessage("가게 검색"),
        "postListStoreList": MessageLookupByLibrary.simpleMessage("가게 목록"),
        "postListUntilTime":
            MessageLookupByLibrary.simpleMessage("a hh시 mm분까지"),
        "postNoDiscountStore":
            MessageLookupByLibrary.simpleMessage("현재 이 지역에는\n할인중인 가게가 없습니다."),
        "postRegAvailablePostingTime":
            MessageLookupByLibrary.simpleMessage("게시 가능한 시간"),
        "postRegCheckLocation": MessageLookupByLibrary.simpleMessage(
            "오른쪽 버튼을 클릭하셔서 게시할 위치를 지도상에서 확인해주세요"),
        "postRegCheckStorePostingLoc":
            MessageLookupByLibrary.simpleMessage("가게 게시 위치를 확인하세요"),
        "postRegChoosePostLoc":
            MessageLookupByLibrary.simpleMessage("게시 위치를 선택하세요"),
        "postRegChoosePostTime":
            MessageLookupByLibrary.simpleMessage("게시 시간을 선택하세요"),
        "postRegChooseProductPost":
            MessageLookupByLibrary.simpleMessage("게시할 상품을 눌러서 선택하세요"),
        "postRegDiscountTime": MessageLookupByLibrary.simpleMessage("할인 시간"),
        "postRegEnterPostInfo":
            MessageLookupByLibrary.simpleMessage("게시 정보 입력"),
        "postRegEnterPostTime":
            MessageLookupByLibrary.simpleMessage("오른쪽 버튼을 클릭하셔서 게시 시간을 입력하세요"),
        "postRegModifyPostInfo":
            MessageLookupByLibrary.simpleMessage("게시 정보 수정"),
        "postRegNoPostingTime":
            MessageLookupByLibrary.simpleMessage("남아 있는 게시 시간이 없습니다"),
        "postRegPostInfo": MessageLookupByLibrary.simpleMessage("게시 정보"),
        "postRegPostLoc": MessageLookupByLibrary.simpleMessage("게시 위치"),
        "postRegPostLocDesc": MessageLookupByLibrary.simpleMessage(
            "1. \'위치확인\'을 눌러서 할인 상품을 게시할 위치를 확인하세요\n2. 현재는 등록된 가게주소에서만 게시할 수 있습니다\n3. 향 후에는 다양한 위치에서 할인 상품을 게시할 수 있도록 할 예정입니다"),
        "postRegPostMinTime": m4,
        "postRegPostProd": MessageLookupByLibrary.simpleMessage("게시 상품"),
        "postRegPostProdDesc": MessageLookupByLibrary.simpleMessage(
            "1. 등록된 상품에서 \'게시\'라는 항목을 눌러주세요\n2. 게시라고 선택된 상품만 사용자들이 볼 수 있습니다"),
        "postRegPostStoreAddr":
            MessageLookupByLibrary.simpleMessage("가게 주소에서 게시"),
        "postRegPostStoreCurrentLoc":
            MessageLookupByLibrary.simpleMessage("현재 위치에서 게시"),
        "postRegPostStoreSelected":
            MessageLookupByLibrary.simpleMessage("지도에서 선택한 위치에 게시"),
        "postRegPostingTime": MessageLookupByLibrary.simpleMessage("게시 시간"),
        "postRegPostingTimeDesc": MessageLookupByLibrary.simpleMessage(
            "1. \'시간설정\'을 눌러서 할인 상품을 게시할 시간을 선택하세요\n2. 최소 20분부터 최대 3시간까지 선택할 수 있습니다"),
        "postRegRemainingPostingTime":
            MessageLookupByLibrary.simpleMessage("남아 있는 게시 시간"),
        "postRegSelectProdToPost":
            MessageLookupByLibrary.simpleMessage("게시할 상품을 선택하세요"),
        "postRegSetPostTime": MessageLookupByLibrary.simpleMessage("게시 시간 설정"),
        "postRegStartPost": MessageLookupByLibrary.simpleMessage("게시시작"),
        "postRegStartPostNormally":
            MessageLookupByLibrary.simpleMessage("정상적으로 게시를 시작했습니다"),
        "postRegTimeNotPost":
            MessageLookupByLibrary.simpleMessage("게시 가능한 시간이 아닙니다"),
        "postRegTimeSetting": MessageLookupByLibrary.simpleMessage("시간 설정"),
        "productListNoProduct":
            MessageLookupByLibrary.simpleMessage("가게에 등록된 상품이 없습니다"),
        "productMgmtNoRegProd":
            MessageLookupByLibrary.simpleMessage("아직 등록된 상품이 없습니다"),
        "productMgmtProdDetail":
            MessageLookupByLibrary.simpleMessage("상품 상세정보"),
        "productMgmtProdMod": MessageLookupByLibrary.simpleMessage("상품수정"),
        "productMgmtProdReg": MessageLookupByLibrary.simpleMessage("상품등록"),
        "productRegDProductExpensive":
            MessageLookupByLibrary.simpleMessage("할인 가격이 더 비쌉니다"),
        "productRegEnterProductDPrice":
            MessageLookupByLibrary.simpleMessage("상품 할인 가격을 입력해주세요"),
        "productRegEnterProductDesc":
            MessageLookupByLibrary.simpleMessage("상품 설명을 입력해주세요"),
        "productRegEnterProductInfo":
            MessageLookupByLibrary.simpleMessage("상품 정보 입력"),
        "productRegEnterProductNameCorrectly":
            MessageLookupByLibrary.simpleMessage("상품 이름을 정확히 입력해주세요"),
        "productRegEnterProductPrice":
            MessageLookupByLibrary.simpleMessage("상품 가격을 입력해주세요"),
        "productRegMaxProduct": m5,
        "productRegModifyProductInfo":
            MessageLookupByLibrary.simpleMessage("상품 정보 수정"),
        "productRegProductDPrice": MessageLookupByLibrary.simpleMessage("할인가격"),
        "productRegProductDPriceDesc": MessageLookupByLibrary.simpleMessage(
            "1. 상품의 할인가격을 입력하세요\n2. 할인가격이 상품가격보다 클 수는 없습니다"),
        "productRegProductDRate": MessageLookupByLibrary.simpleMessage("상품할인율"),
        "productRegProductDesc": MessageLookupByLibrary.simpleMessage("상품소개"),
        "productRegProductDescDesc":
            MessageLookupByLibrary.simpleMessage("1. 상품을 소개하는 설명을 입력하세요"),
        "productRegProductImage":
            MessageLookupByLibrary.simpleMessage("상품 이미지"),
        "productRegProductImageDesc": MessageLookupByLibrary.simpleMessage(
            "1. 상품이미지를 사진으로 찍거나 앨범에서 선택해서 등록하세요"),
        "productRegProductInfo": MessageLookupByLibrary.simpleMessage("상품 정보"),
        "productRegProductName": MessageLookupByLibrary.simpleMessage("상품이름"),
        "productRegProductNameDesc": MessageLookupByLibrary.simpleMessage(
            "1. 상품이름을 입력하세요\n2. 동일한 상품이름은 입력할 수 없습니다"),
        "productRegProductPrice": MessageLookupByLibrary.simpleMessage("상품가격"),
        "productRegProductPriceDesc":
            MessageLookupByLibrary.simpleMessage("1. 할인 전 상품가격을 입력하세요"),
        "productRegSameProdRegistered":
            MessageLookupByLibrary.simpleMessage("동일한 상품 이름이 이미 등록되어 있습니다"),
        "productRegSelFromAlbum":
            MessageLookupByLibrary.simpleMessage("앨범에서 선택"),
        "productRegSelectProductImage":
            MessageLookupByLibrary.simpleMessage("상품 이미지를 선택해주세요"),
        "productRegTakePicture": MessageLookupByLibrary.simpleMessage("사진 찍기"),
        "reportBeReported": MessageLookupByLibrary.simpleMessage("신고되었습니다"),
        "reportChooseReason": MessageLookupByLibrary.simpleMessage("사유 선택"),
        "reportETC": MessageLookupByLibrary.simpleMessage("기타 사유"),
        "reportInappropriateAddress":
            MessageLookupByLibrary.simpleMessage("가게의 주소가 실제 주소와 달라요"),
        "reportInappropriateBusinessRegId":
            MessageLookupByLibrary.simpleMessage("가게의 사업자등록번호가 실제와 달라요"),
        "reportInappropriateBusinessRegIdSub":
            MessageLookupByLibrary.simpleMessage(
                "00*-0*-****0은 사업자등록전이라 임시번호이며 정상입니다"),
        "reportInappropriatePhoneNumber":
            MessageLookupByLibrary.simpleMessage("가게의 전화번화가 실제 전화번호와 달라요"),
        "reportInappropriatePrice":
            MessageLookupByLibrary.simpleMessage("가격이 실제 판매 가격이 아니에요"),
        "reportInappropriateProductImage":
            MessageLookupByLibrary.simpleMessage("부적절한 이미지를 사용했어요"),
        "reportInappropriateStoreLocation":
            MessageLookupByLibrary.simpleMessage("가게의 위치가 실제 위치와 달라요"),
        "reportInappropriateStoreName":
            MessageLookupByLibrary.simpleMessage("가게의 이름이 실제 이름과 달라요"),
        "reportLikeToReport": MessageLookupByLibrary.simpleMessage("신고하시겠습니까?"),
        "reportReportDetail": MessageLookupByLibrary.simpleMessage("신고내역"),
        "reportSelectOneReason": MessageLookupByLibrary.simpleMessage(
            "여러 사유에 해당될 경우, 대표적인 사유 1개를 \n선택해주세요"),
        "reportSelectReason": m6,
        "reviewMgmtDisableReview":
            MessageLookupByLibrary.simpleMessage("리뷰/평점사용이 비활성화 되었습니다"),
        "reviewMgmtEnableReview":
            MessageLookupByLibrary.simpleMessage("리뷰/평점사용이 활성화 되었습니다"),
        "reviewMgmtEnableReviewRating":
            MessageLookupByLibrary.simpleMessage("리뷰/평점 사용"),
        "reviewMgmtEnableReviewRatingDesc": MessageLookupByLibrary.simpleMessage(
            "1. 리뷰/평점 사용이 비활성화되면 사용자들은 가게에 대한 리뷰와 평점을 작성할 수 없습니다\n2. 리뷰/평점 사용이 비활성화되면 가게의 리뷰와 평점이 비공개로 전환됩니다"),
        "reviewMgmtReviewMgmt": MessageLookupByLibrary.simpleMessage("리뷰 관리"),
        "reviewMgmtTotalReview": m7,
        "reviewMgmtUnansweredReview": m8,
        "searchEnterDifferentKeyword": MessageLookupByLibrary.simpleMessage(
            "두 글자 이상 입력하거나\n다른 키워드로 검색해 보세요"),
        "searchEnterSearchWord":
            MessageLookupByLibrary.simpleMessage("검색어를 입력하세요"),
        "searchingRule": MessageLookupByLibrary.simpleMessage("검색 규칙"),
        "searchingRuleAreaSelection":
            MessageLookupByLibrary.simpleMessage("지역 선택"),
        "searchingRuleAtCurrentLocation":
            MessageLookupByLibrary.simpleMessage("현재 위치에서"),
        "searchingRuleCategory": MessageLookupByLibrary.simpleMessage("카테고리"),
        "searchingRuleDetailedAreaSelection":
            MessageLookupByLibrary.simpleMessage("상세 지역 선택"),
        "searchingRuleIn1KM": MessageLookupByLibrary.simpleMessage("1KM 이내"),
        "searchingRuleIn2KM": MessageLookupByLibrary.simpleMessage("2KM 이내"),
        "searchingRuleInTheChosenArea":
            MessageLookupByLibrary.simpleMessage("선택된 지역내에서"),
        "searchingRuleLocation": MessageLookupByLibrary.simpleMessage("위치"),
        "settingUserDataDeleted":
            MessageLookupByLibrary.simpleMessage("등록된 모든 데이타가 삭제됩니다"),
        "settingUserWithdrawal": MessageLookupByLibrary.simpleMessage("회원 탈퇴"),
        "settingUserWithdrawalMembership":
            MessageLookupByLibrary.simpleMessage("회원 탈퇴하시겠습니까?"),
        "settingsAccount": MessageLookupByLibrary.simpleMessage("계정"),
        "settingsAddressUpdate":
            MessageLookupByLibrary.simpleMessage("주소 업데이트"),
        "settingsAskLogout":
            MessageLookupByLibrary.simpleMessage("로그아웃하시겠습니까?"),
        "settingsAuthority": MessageLookupByLibrary.simpleMessage("권한"),
        "settingsCancelTransferStoreManagerAuthority":
            MessageLookupByLibrary.simpleMessage("가게관리자 권한 넘기기 취소"),
        "settingsClearCache":
            MessageLookupByLibrary.simpleMessage("임시 저장 데이터 삭제"),
        "settingsData": MessageLookupByLibrary.simpleMessage("데이터"),
        "settingsEmailTransferred":
            MessageLookupByLibrary.simpleMessage("권한 이관받을 사람의 이메일을\n입력해주세요"),
        "settingsGetStoreManagerAuthority":
            MessageLookupByLibrary.simpleMessage("가게관리자 권한 받아오기"),
        "settingsLocationBasedTermsService":
            MessageLookupByLibrary.simpleMessage("위치기반서비스이용약관"),
        "settingsLogout": MessageLookupByLibrary.simpleMessage("로그아웃"),
        "settingsMisc": MessageLookupByLibrary.simpleMessage("기타"),
        "settingsStoreTransferAccept":
            MessageLookupByLibrary.simpleMessage("가게 이관을 받으시겠습니까?"),
        "settingsStoreTransferCancel": m9,
        "settingsTermsService": MessageLookupByLibrary.simpleMessage("이용약관"),
        "settingsTransferStoreManagerAuthority":
            MessageLookupByLibrary.simpleMessage("가게관리자 권한 넘기기"),
        "settingsUpdateAddress":
            MessageLookupByLibrary.simpleMessage("주소를 업데이트하시겠습니까?"),
        "settingsUseCollectionPersonalInfo":
            MessageLookupByLibrary.simpleMessage("개인정보 이용 및 수집"),
        "settingsVersion": MessageLookupByLibrary.simpleMessage("버전"),
        "settingsWantClearCache":
            MessageLookupByLibrary.simpleMessage("캐시 삭제를 하시겠습니까?"),
        "storeAskReportReview":
            MessageLookupByLibrary.simpleMessage("해당 리뷰를 신고하시겠습니까?"),
        "storeDeactivatedReview":
            MessageLookupByLibrary.simpleMessage("리뷰/평점 비활성화"),
        "storeDeactivatedReviewByManager": MessageLookupByLibrary.simpleMessage(
            "가게 관리자의 요청으로 리뷰/평점이\n비활성화된 상태입니다"),
        "storeDiscountProduct": MessageLookupByLibrary.simpleMessage("할인 상품"),
        "storeFullRating": MessageLookupByLibrary.simpleMessage("전체 평가"),
        "storeFullReview": MessageLookupByLibrary.simpleMessage("전체 리뷰"),
        "storeMgmtAfterProdReg":
            MessageLookupByLibrary.simpleMessage("상품등록 후 이용가능합니다"),
        "storeMgmtAllProduct": MessageLookupByLibrary.simpleMessage("전체 상품"),
        "storeMgmtBeingDeleted":
            MessageLookupByLibrary.simpleMessage("가게가 삭제된 상태입니다."),
        "storeMgmtBeingDeletedDesc":
            MessageLookupByLibrary.simpleMessage("1. 삭제 상태에서는 가게를 게시할 수 없습니다"),
        "storeMgmtBeingLocked":
            MessageLookupByLibrary.simpleMessage("가게가 잠긴상태입니다."),
        "storeMgmtBeingLockedDesc": MessageLookupByLibrary.simpleMessage(
            "1. 사용자들의 신고로 인해 가게가 잠김상태가 되었습니다\n2. \'신고내역보기\'를 눌러서 사용자들의 신고 내역을 확인할 수 있습니다\n3. 잠김상태에서는 가게를 게시할 수 없습니다\n4. 가게가 잠김상태가 되면 가게 게시내역과 신고 내용이 서버에 저장됩니다\n5. 잠김상태는 하루가 지나면 정상으로 변경되며 게시가 가능합니다"),
        "storeMgmtBeingPosted":
            MessageLookupByLibrary.simpleMessage("가게가 게시중입니다."),
        "storeMgmtBeingPostedDesc": MessageLookupByLibrary.simpleMessage(
            "1. 사용자가 가게의 할인 상품 정보를 볼 수 있는 상태입니다\n2. \'게시확인\' 메뉴를 눌러서 게시 내용을 확인하거나 게시를 중지할 수 있습니다"),
        "storeMgmtCheckReport": MessageLookupByLibrary.simpleMessage("신고내역 보기"),
        "storeMgmtItemUnit": MessageLookupByLibrary.simpleMessage("개"),
        "storeMgmtNotBeingPosted":
            MessageLookupByLibrary.simpleMessage("가게가 게시상태가 아닙니다"),
        "storeMgmtNotBeingPostedDesc": MessageLookupByLibrary.simpleMessage(
            "1. \'게시시작\' 메뉴를 눌러서 할인 상품의 게시를 시작하세요"),
        "storeMgmtNotPostWhileLocked":
            MessageLookupByLibrary.simpleMessage("가게가 잠김상태에서는 게시할 수 없습니다"),
        "storeMgmtPostCheck": MessageLookupByLibrary.simpleMessage("게시 확인"),
        "storeMgmtPostMgmt": MessageLookupByLibrary.simpleMessage("게시 관리"),
        "storeMgmtPostedProduct":
            MessageLookupByLibrary.simpleMessage("게시중인 상품"),
        "storeMgmtProductMgmt": MessageLookupByLibrary.simpleMessage("상품 관리"),
        "storeMgmtProductMgmt2": MessageLookupByLibrary.simpleMessage("상품관리"),
        "storeMgmtReviewMgmt": MessageLookupByLibrary.simpleMessage("리뷰 관리"),
        "storeMgmtStoreDataDeleted":
            MessageLookupByLibrary.simpleMessage("등록된 모든 데이타가 삭제됩니다"),
        "storeMgmtTransferredNotDeleted":
            MessageLookupByLibrary.simpleMessage("이관중인 가게는 삭제할 수 없습니다"),
        "storeMgmtUnAnsweredReview":
            MessageLookupByLibrary.simpleMessage("미답변 리뷰"),
        "storeModStoreInfo": MessageLookupByLibrary.simpleMessage("가게정보 수정"),
        "storeModStoreOwnerInfo":
            MessageLookupByLibrary.simpleMessage("가게관리자 정보 수정"),
        "storeModifyReview": MessageLookupByLibrary.simpleMessage("리뷰 수정"),
        "storeMoreReview": MessageLookupByLibrary.simpleMessage("리뷰 더보기"),
        "storeMyRate": MessageLookupByLibrary.simpleMessage("나의 평가"),
        "storeMyReview": MessageLookupByLibrary.simpleMessage("나의 리뷰"),
        "storeNoAnsweredReview":
            MessageLookupByLibrary.simpleMessage("미답변 리뷰가 없습니다"),
        "storeNoReview": MessageLookupByLibrary.simpleMessage("작성된 리뷰가 없습니다"),
        "storeProductOnSale": MessageLookupByLibrary.simpleMessage("할인 중인 상품"),
        "storeRateStore": MessageLookupByLibrary.simpleMessage("가게 평가하기"),
        "storeRatingsReviews": MessageLookupByLibrary.simpleMessage("평점 및 리뷰"),
        "storeReg6DigitVrfNum":
            MessageLookupByLibrary.simpleMessage("6자리 인증번호를 넣어주세요"),
        "storeRegALotDifferenceAddressLocation":
            MessageLookupByLibrary.simpleMessage(
                "주소와 선택하신 위치의 차이가 많이 납니다\n주소를 다시 확인하세요"),
        "storeRegActivatePhoneVrf":
            MessageLookupByLibrary.simpleMessage("전화번호 인증페이지를 활성화하시겠습니까?"),
        "storeRegAddTag": MessageLookupByLibrary.simpleMessage("태그추가"),
        "storeRegAnyName": MessageLookupByLibrary.simpleMessage("홍길동"),
        "storeRegCarNumber": MessageLookupByLibrary.simpleMessage("차량 번호"),
        "storeRegCertNum": MessageLookupByLibrary.simpleMessage("인증번호"),
        "storeRegCheckLocation":
            MessageLookupByLibrary.simpleMessage("가게의 위치를 지도상에서 확인해주세요"),
        "storeRegChooseStoreType":
            MessageLookupByLibrary.simpleMessage("가게형태를 선택하세요"),
        "storeRegDelStore": MessageLookupByLibrary.simpleMessage("가게 삭제"),
        "storeRegEnterAddress":
            MessageLookupByLibrary.simpleMessage("주소를 입력해주세요"),
        "storeRegEnterCarNum":
            MessageLookupByLibrary.simpleMessage("차량번호를 입력해주세요"),
        "storeRegEnterCertCode":
            MessageLookupByLibrary.simpleMessage("인증번호를 입력하세요"),
        "storeRegEnterNameCorrectly":
            MessageLookupByLibrary.simpleMessage("이름을 정확히 입력해주세요"),
        "storeRegEnterPhoneNum":
            MessageLookupByLibrary.simpleMessage("전화번호를 입력하세요"),
        "storeRegEnterStoreInfo":
            MessageLookupByLibrary.simpleMessage("가게 정보 입력"),
        "storeRegEnterStoreNameCorrectly":
            MessageLookupByLibrary.simpleMessage("가게 이름을 정확히 입력해주세요"),
        "storeRegEnterStorePhoneCorrectly":
            MessageLookupByLibrary.simpleMessage("가게 전화번호를 정확히 입력해주세요"),
        "storeRegEnterStoreRegNoCorrectly":
            MessageLookupByLibrary.simpleMessage("가게 사업자 등록 번호를 정확히 입력해주세요"),
        "storeRegExample": MessageLookupByLibrary.simpleMessage("예시"),
        "storeRegFindAddr": MessageLookupByLibrary.simpleMessage("주소찾기"),
        "storeRegGetPhoneVerification":
            MessageLookupByLibrary.simpleMessage("전화번호인증을 받으세요"),
        "storeRegManagerName": MessageLookupByLibrary.simpleMessage("관리자 이름"),
        "storeRegManagerNameDesc": MessageLookupByLibrary.simpleMessage(
            "1. 가게 관리자 이름이나 별명을 입력해주세요\n2. 해당 정보는 사용자에게 공개되지 않습니다"),
        "storeRegManagerPhone":
            MessageLookupByLibrary.simpleMessage("관리자 전화번호"),
        "storeRegManagerPhoneDesc": MessageLookupByLibrary.simpleMessage(
            "1. \'번호인증\'을 눌러서 전화번호 인증을 받으세요\n2. 해당 정보는 사용자에게 공개되지 않습니다"),
        "storeRegNotSupportedArea": MessageLookupByLibrary.simpleMessage(
            "가게 위치가 현재 지원되지 않는 지역입니다\n차후에 지원하도록 하겠습니다"),
        "storeRegNotVerifiedNumber":
            MessageLookupByLibrary.simpleMessage("인증받은 전화번호가 아닙니다"),
        "storeRegPhoneNumber": MessageLookupByLibrary.simpleMessage("전화번호"),
        "storeRegPhoneNumberVrf":
            MessageLookupByLibrary.simpleMessage("전화번호 인증"),
        "storeRegPhoneVrf": MessageLookupByLibrary.simpleMessage("번호인증"),
        "storeRegPhoneVrfSuccess":
            MessageLookupByLibrary.simpleMessage("전화번호 인증에 성공했습니다"),
        "storeRegProduct": MessageLookupByLibrary.simpleMessage("등록된 상품"),
        "storeRegRegSuccess":
            MessageLookupByLibrary.simpleMessage("정상적으로 가게를 등록했습니다"),
        "storeRegReqCertNum": MessageLookupByLibrary.simpleMessage("번호요청"),
        "storeRegReqVrfNumber":
            MessageLookupByLibrary.simpleMessage("인증 번호 요청"),
        "storeRegResubmit": MessageLookupByLibrary.simpleMessage(
            "입력된 값에 문제가 있습니다\n 문제를 확인하시고 다시 진행하시기 바랍니다"),
        "storeRegSaveEdit": MessageLookupByLibrary.simpleMessage("수정사항저장"),
        "storeRegSelectCategory":
            MessageLookupByLibrary.simpleMessage("카테고리를 선택해주세요"),
        "storeRegSelectRegistrationImage":
            MessageLookupByLibrary.simpleMessage("사업자등록증 이미지를 선택해주세요"),
        "storeRegSentSMSVrfCode":
            MessageLookupByLibrary.simpleMessage("SMS 인증 코드를 보냈습니다"),
        "storeRegStoreAdr": MessageLookupByLibrary.simpleMessage("가게 주소"),
        "storeRegStoreAdrDesc": MessageLookupByLibrary.simpleMessage(
            "1. \'주소찾기\'를 눌러서 가게의 주소를 검색하고 선택하세요\n2. 가게주소와 상세주소는 사용자에게 공개됩니다"),
        "storeRegStoreAdrDetail":
            MessageLookupByLibrary.simpleMessage("가게 상세 주소"),
        "storeRegStoreAdrDetailDesc": MessageLookupByLibrary.simpleMessage(
            "1. 가게의 상세주소를 입력하세요\n2. 반드시 \'위치확인\'을 눌러서 지도상에 가게의 위치가 정확한지 확인하세요"),
        "storeRegStoreCategory":
            MessageLookupByLibrary.simpleMessage("가게 카테고리"),
        "storeRegStoreCategoryDesc": MessageLookupByLibrary.simpleMessage(
            "1. \'카테고리\'를 눌러서 가게에 가장 적합한 카테고리를 선택하세요\n2. 해당 정보는 사용자에게 공개됩니다"),
        "storeRegStoreFixed": MessageLookupByLibrary.simpleMessage("일반 가게"),
        "storeRegStoreLocationCheck":
            MessageLookupByLibrary.simpleMessage("위치 확인"),
        "storeRegStoreLocationCheckDesc": MessageLookupByLibrary.simpleMessage(
            "사용자가 지도상의 위치를 보고 가게를 확인합니다.지도상에 가게 위치를 확인하세요.지도를 클릭하면 가게의 위치변경이 가능합니다."),
        "storeRegStoreLocationNotFound": MessageLookupByLibrary.simpleMessage(
            "위치를 찾을 수 없습니다\n주소를 다시 한 번 확인해주세요"),
        "storeRegStoreMoving": MessageLookupByLibrary.simpleMessage("이동식 가게"),
        "storeRegStoreName": MessageLookupByLibrary.simpleMessage("가게 이름"),
        "storeRegStoreNameDesc": MessageLookupByLibrary.simpleMessage(
            "1. 사용자가 확인할 수 있는 가게이름을 입력하세요(예를들어, 가게 간판이름 등)\n2. 해당 정보는 사용자에게 공개됩니다"),
        "storeRegStorePhoneNumber":
            MessageLookupByLibrary.simpleMessage("가게 전화번호"),
        "storeRegStorePhoneNumberDesc": MessageLookupByLibrary.simpleMessage(
            "1. 가게 전화번호를 입력하세요\n2. 해당 정보는 사용자에게 공개됩니다"),
        "storeRegStoreReg": MessageLookupByLibrary.simpleMessage("가게 등록"),
        "storeRegStoreReg2": MessageLookupByLibrary.simpleMessage("가게등록"),
        "storeRegStoreRegNo": MessageLookupByLibrary.simpleMessage("사업자 등록 번호"),
        "storeRegStoreRegNoDesc": MessageLookupByLibrary.simpleMessage(
            "1. 사업자 등록번호를 입력하세요\n2. 아직 사업자 등록 전이라면 \'000-00-00000\'을 입력하시면 됩니다\n3. 향 후, 서비스 개편 혹은 추가등에 따라 사업자 등록번호를 필수로 입력해야할 수 도 있습니다\n4. 해당 정보는 사용자에게 일부만 공개됩니다(예를 들어, 12*-4*-****0)"),
        "storeRegTagDescription": m10,
        "storeRegTagDescriptionDesc": MessageLookupByLibrary.simpleMessage(
            "1. 해당 태그들은 사용자들이 검색을 할 때 사용되어집니다"),
        "storeRegUnRegStoreSuccess":
            MessageLookupByLibrary.simpleMessage("정상적으로 가게가 삭제되었습니다"),
        "storeRegVerifyPhoneNum":
            MessageLookupByLibrary.simpleMessage("전화번호를 인증해 주세요"),
        "storeRegVrfCertNumber":
            MessageLookupByLibrary.simpleMessage("인증 번호 검증"),
        "storeRegVrfNumber": MessageLookupByLibrary.simpleMessage("인증 번호"),
        "storeRegVrfReq": MessageLookupByLibrary.simpleMessage("인증요청"),
        "storeRegWrongPhoneNumber":
            MessageLookupByLibrary.simpleMessage("전화번호를 잘못 입력했습니다"),
        "storeReportReview": MessageLookupByLibrary.simpleMessage("리뷰 신고"),
        "storeReportTotalReport": m11,
        "storeReviewReply": MessageLookupByLibrary.simpleMessage("리뷰보고 답변달기"),
        "storeStoreInfo": MessageLookupByLibrary.simpleMessage("가게 정보"),
        "storeStoreMgmt": MessageLookupByLibrary.simpleMessage("가게관리"),
        "storeStoreName": MessageLookupByLibrary.simpleMessage("가게명"),
        "storeStoreOwnerInfo": MessageLookupByLibrary.simpleMessage("가게관리자 정보"),
        "storeStoreRate": MessageLookupByLibrary.simpleMessage("가게 평가"),
        "storeStoreReview": MessageLookupByLibrary.simpleMessage("가게 리뷰"),
        "storeTransferAcceptTransfer":
            MessageLookupByLibrary.simpleMessage("가게 권한 이전을 승인하시겠습니까?"),
        "storeTransferDenyPermission":
            MessageLookupByLibrary.simpleMessage("권한 거절"),
        "storeTransferEnterEmailCorrectly":
            MessageLookupByLibrary.simpleMessage("이메일을 올바르게 입력해주세요"),
        "storeTransferGetPermission":
            MessageLookupByLibrary.simpleMessage("권한 받기"),
        "storeTransferObtainStore":
            MessageLookupByLibrary.simpleMessage("해당 가게의 관리자 권한을 받아오시겠습니까?"),
        "storeTransferRejectTransfer":
            MessageLookupByLibrary.simpleMessage("가게 권한 이전을 거부하시겠습니까?"),
        "storeTransferRequestTransfer":
            MessageLookupByLibrary.simpleMessage("정상적으로 가게를 이관을 요청했습니다"),
        "storeTransferStoreTakeOver":
            MessageLookupByLibrary.simpleMessage("가게 인수"),
        "storeTransferStoreTransfer":
            MessageLookupByLibrary.simpleMessage("가게 이관"),
        "storeTransferTransfer": MessageLookupByLibrary.simpleMessage("이관하기"),
        "storeTransferTransferSuccess":
            MessageLookupByLibrary.simpleMessage("정상적으로 가게를 이관받았습니다"),
        "storeVisitorReviews": MessageLookupByLibrary.simpleMessage("방문객 리뷰"),
        "storeWriteReview": MessageLookupByLibrary.simpleMessage("리뷰 작성하기")
      };
}
