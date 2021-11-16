// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `내 주변의 모~든`
  String get commonSplashAllAroundMe {
    return Intl.message(
      '내 주변의 모~든',
      name: 'commonSplashAllAroundMe',
      desc: '',
      args: [],
    );
  }

  /// `할인`
  String get commonSplashDiscount {
    return Intl.message(
      '할인',
      name: 'commonSplashDiscount',
      desc: '',
      args: [],
    );
  }

  /// `가게`
  String get commonSplashGage {
    return Intl.message(
      '가게',
      name: 'commonSplashGage',
      desc: '',
      args: [],
    );
  }

  /// `로`
  String get commonSplashRo {
    return Intl.message(
      '로',
      name: 'commonSplashRo',
      desc: '',
      args: [],
    );
  }

  /// `위치`
  String get commonLocation {
    return Intl.message(
      '위치',
      name: 'commonLocation',
      desc: '',
      args: [],
    );
  }

  /// `위치 확인`
  String get commonLocationCheck {
    return Intl.message(
      '위치 확인',
      name: 'commonLocationCheck',
      desc: '',
      args: [],
    );
  }

  /// `위치확인`
  String get commonLocationCheck2 {
    return Intl.message(
      '위치확인',
      name: 'commonLocationCheck2',
      desc: '',
      args: [],
    );
  }

  /// `현재 위치를 찾는데 실패했습니다.`
  String get commonLocationFailedD {
    return Intl.message(
      '현재 위치를 찾는데 실패했습니다.',
      name: 'commonLocationFailedD',
      desc: '',
      args: [],
    );
  }

  /// `권한 거부`
  String get commonPermissionDenied {
    return Intl.message(
      '권한 거부',
      name: 'commonPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `앱 사용을 위해서 {name} 권한을 허용바랍니다.`
  String commonApprovePermission(Object name) {
    return Intl.message(
      '앱 사용을 위해서 $name 권한을 허용바랍니다.',
      name: 'commonApprovePermission',
      desc: '',
      args: [name],
    );
  }

  /// `OK를 누리시고 - 권한 - {name} - 허용을 선택하시면 됩니다.`
  String commonApprovePermissionDetail(Object name) {
    return Intl.message(
      'OK를 누리시고 - 권한 - $name - 허용을 선택하시면 됩니다.',
      name: 'commonApprovePermissionDetail',
      desc: '',
      args: [name],
    );
  }

  /// `에러 코드`
  String get commonErrorCode {
    return Intl.message(
      '에러 코드',
      name: 'commonErrorCode',
      desc: '',
      args: [],
    );
  }

  /// `네트워크 에러`
  String get commonNetworkError {
    return Intl.message(
      '네트워크 에러',
      name: 'commonNetworkError',
      desc: '',
      args: [],
    );
  }

  /// `확인`
  String get commonOK {
    return Intl.message(
      '확인',
      name: 'commonOK',
      desc: '',
      args: [],
    );
  }

  /// `모두 확인`
  String get commonAllOK {
    return Intl.message(
      '모두 확인',
      name: 'commonAllOK',
      desc: '',
      args: [],
    );
  }

  /// `완료`
  String get commonDone {
    return Intl.message(
      '완료',
      name: 'commonDone',
      desc: '',
      args: [],
    );
  }

  /// `취소`
  String get commonCancel {
    return Intl.message(
      '취소',
      name: 'commonCancel',
      desc: '',
      args: [],
    );
  }

  /// `닫기`
  String get commonClose {
    return Intl.message(
      '닫기',
      name: 'commonClose',
      desc: '',
      args: [],
    );
  }

  /// `실패`
  String get commonFailed {
    return Intl.message(
      '실패',
      name: 'commonFailed',
      desc: '',
      args: [],
    );
  }

  /// `성공`
  String get commonSuccess {
    return Intl.message(
      '성공',
      name: 'commonSuccess',
      desc: '',
      args: [],
    );
  }

  /// `수정`
  String get commonModify {
    return Intl.message(
      '수정',
      name: 'commonModify',
      desc: '',
      args: [],
    );
  }

  /// `삭제`
  String get commonDelete {
    return Intl.message(
      '삭제',
      name: 'commonDelete',
      desc: '',
      args: [],
    );
  }

  /// `답변`
  String get commonReply {
    return Intl.message(
      '답변',
      name: 'commonReply',
      desc: '',
      args: [],
    );
  }

  /// `신고`
  String get commonReport {
    return Intl.message(
      '신고',
      name: 'commonReport',
      desc: '',
      args: [],
    );
  }

  /// `가게 신고`
  String get commonStoreReport {
    return Intl.message(
      '가게 신고',
      name: 'commonStoreReport',
      desc: '',
      args: [],
    );
  }

  /// `신고하기`
  String get commonReportVerb {
    return Intl.message(
      '신고하기',
      name: 'commonReportVerb',
      desc: '',
      args: [],
    );
  }

  /// `신고 완료`
  String get commonReportCompleted {
    return Intl.message(
      '신고 완료',
      name: 'commonReportCompleted',
      desc: '',
      args: [],
    );
  }

  /// `프로그램 에러`
  String get commonApplicationError {
    return Intl.message(
      '프로그램 에러',
      name: 'commonApplicationError',
      desc: '',
      args: [],
    );
  }

  /// `다시 시도합니다.`
  String get commonTryAgain {
    return Intl.message(
      '다시 시도합니다.',
      name: 'commonTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `다시 접속합니다.`
  String get commonConnectAgain {
    return Intl.message(
      '다시 접속합니다.',
      name: 'commonConnectAgain',
      desc: '',
      args: [],
    );
  }

  /// `잠시 후에 다시 접속합니다.`
  String get commonConnectAgainLater {
    return Intl.message(
      '잠시 후에 다시 접속합니다.',
      name: 'commonConnectAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `등록하기`
  String get commonRegistration {
    return Intl.message(
      '등록하기',
      name: 'commonRegistration',
      desc: '',
      args: [],
    );
  }

  /// `확인 중`
  String get commonChecking {
    return Intl.message(
      '확인 중',
      name: 'commonChecking',
      desc: '',
      args: [],
    );
  }

  /// `확인완료`
  String get commonConfirmed {
    return Intl.message(
      '확인완료',
      name: 'commonConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `분`
  String get commonMin {
    return Intl.message(
      '분',
      name: 'commonMin',
      desc: '',
      args: [],
    );
  }

  /// `변경된 사항이 없습니다`
  String get commonNoChange {
    return Intl.message(
      '변경된 사항이 없습니다',
      name: 'commonNoChange',
      desc: '',
      args: [],
    );
  }

  /// `가게 게시가 만료되었습니다`
  String get commonPostingExpired {
    return Intl.message(
      '가게 게시가 만료되었습니다',
      name: 'commonPostingExpired',
      desc: '',
      args: [],
    );
  }

  /// `주소 검색`
  String get commonAddressSearch {
    return Intl.message(
      '주소 검색',
      name: 'commonAddressSearch',
      desc: '',
      args: [],
    );
  }

  /// `정상적으로 등록되었습니다`
  String get commonRegSuccess {
    return Intl.message(
      '정상적으로 등록되었습니다',
      name: 'commonRegSuccess',
      desc: '',
      args: [],
    );
  }

  /// `검색에 필요한 태그를 입력하세요`
  String get commonInputSearchTag {
    return Intl.message(
      '검색에 필요한 태그를 입력하세요',
      name: 'commonInputSearchTag',
      desc: '',
      args: [],
    );
  }

  /// `2~6글자(한글기준), 한글, 영문, 숫자만 입력가능합니다`
  String get commonErrorInputSearchTag {
    return Intl.message(
      '2~6글자(한글기준), 한글, 영문, 숫자만 입력가능합니다',
      name: 'commonErrorInputSearchTag',
      desc: '',
      args: [],
    );
  }

  /// `최대 5개 검색어까지 입력할 수 있습니다`
  String get commonErrorMaxSearchTag {
    return Intl.message(
      '최대 5개 검색어까지 입력할 수 있습니다',
      name: 'commonErrorMaxSearchTag',
      desc: '',
      args: [],
    );
  }

  /// `앱 초기화 에러`
  String get commonErrorInitialize {
    return Intl.message(
      '앱 초기화 에러',
      name: 'commonErrorInitialize',
      desc: '',
      args: [],
    );
  }

  /// `이미지 선택 오류`
  String get commonErrorPickingImage {
    return Intl.message(
      '이미지 선택 오류',
      name: 'commonErrorPickingImage',
      desc: '',
      args: [],
    );
  }

  /// `이미지를 선택하지 않았거나 이미지에 오류가 있습니다`
  String get commonErrorPickingImage2 {
    return Intl.message(
      '이미지를 선택하지 않았거나 이미지에 오류가 있습니다',
      name: 'commonErrorPickingImage2',
      desc: '',
      args: [],
    );
  }

  /// `다음에`
  String get commonNextTime {
    return Intl.message(
      '다음에',
      name: 'commonNextTime',
      desc: '',
      args: [],
    );
  }

  /// `다음`
  String get commonNext {
    return Intl.message(
      '다음',
      name: 'commonNext',
      desc: '',
      args: [],
    );
  }

  /// `보기`
  String get commonView {
    return Intl.message(
      '보기',
      name: 'commonView',
      desc: '',
      args: [],
    );
  }

  /// `건`
  String get commonList1 {
    return Intl.message(
      '건',
      name: 'commonList1',
      desc: '',
      args: [],
    );
  }

  /// `리뷰`
  String get commonReview {
    return Intl.message(
      '리뷰',
      name: 'commonReview',
      desc: '',
      args: [],
    );
  }

  /// `전화`
  String get commonPhone {
    return Intl.message(
      '전화',
      name: 'commonPhone',
      desc: '',
      args: [],
    );
  }

  /// `전체`
  String get commonTotal {
    return Intl.message(
      '전체',
      name: 'commonTotal',
      desc: '',
      args: [],
    );
  }

  /// `선택`
  String get commonSelected {
    return Intl.message(
      '선택',
      name: 'commonSelected',
      desc: '',
      args: [],
    );
  }

  /// `선택해제`
  String get commonUnSelected {
    return Intl.message(
      '선택해제',
      name: 'commonUnSelected',
      desc: '',
      args: [],
    );
  }

  /// `원`
  String get commonWon {
    return Intl.message(
      '원',
      name: 'commonWon',
      desc: '',
      args: [],
    );
  }

  /// `소개`
  String get commonIntroduce {
    return Intl.message(
      '소개',
      name: 'commonIntroduce',
      desc: '',
      args: [],
    );
  }

  /// `사업자번호`
  String get commonBusinessNum {
    return Intl.message(
      '사업자번호',
      name: 'commonBusinessNum',
      desc: '',
      args: [],
    );
  }

  /// `사장님`
  String get commonManager {
    return Intl.message(
      '사장님',
      name: 'commonManager',
      desc: '',
      args: [],
    );
  }

  /// `사장님 답변`
  String get commonManagerAnswer {
    return Intl.message(
      '사장님 답변',
      name: 'commonManagerAnswer',
      desc: '',
      args: [],
    );
  }

  /// `이미지 보기`
  String get commonViewImage {
    return Intl.message(
      '이미지 보기',
      name: 'commonViewImage',
      desc: '',
      args: [],
    );
  }

  /// `정확한 위치를 선택한 뒤에 확인 버튼을 눌러주세요`
  String get commonSelectCorrectLocation {
    return Intl.message(
      '정확한 위치를 선택한 뒤에 확인 버튼을 눌러주세요',
      name: 'commonSelectCorrectLocation',
      desc: '',
      args: [],
    );
  }

  /// `선택 완료`
  String get commonSelectDone {
    return Intl.message(
      '선택 완료',
      name: 'commonSelectDone',
      desc: '',
      args: [],
    );
  }

  /// `yyyy.MM.dd`
  String get commonTimeFormat1 {
    return Intl.message(
      'yyyy.MM.dd',
      name: 'commonTimeFormat1',
      desc: '',
      args: [],
    );
  }

  /// `HH시 mm분`
  String get commonTimeFormat2 {
    return Intl.message(
      'HH시 mm분',
      name: 'commonTimeFormat2',
      desc: '',
      args: [],
    );
  }

  /// `yyyy.MM.dd HH:MM`
  String get commonTimeFormat3 {
    return Intl.message(
      'yyyy.MM.dd HH:MM',
      name: 'commonTimeFormat3',
      desc: '',
      args: [],
    );
  }

  /// `리뷰 작성`
  String get commonWriteReview {
    return Intl.message(
      '리뷰 작성',
      name: 'commonWriteReview',
      desc: '',
      args: [],
    );
  }

  /// `리뷰 수정`
  String get commonEditReview {
    return Intl.message(
      '리뷰 수정',
      name: 'commonEditReview',
      desc: '',
      args: [],
    );
  }

  /// `답변 작성`
  String get commonWriteReply2 {
    return Intl.message(
      '답변 작성',
      name: 'commonWriteReply2',
      desc: '',
      args: [],
    );
  }

  /// `답변 수정`
  String get commonEditReply {
    return Intl.message(
      '답변 수정',
      name: 'commonEditReply',
      desc: '',
      args: [],
    );
  }

  /// `만족스러운 방문이었나요? 솔직한 방문후기를 남겨주세요. 다른분들께 큰 도움이 된답니다.`
  String get commonReviewHint {
    return Intl.message(
      '만족스러운 방문이었나요? 솔직한 방문후기를 남겨주세요. 다른분들께 큰 도움이 된답니다.',
      name: 'commonReviewHint',
      desc: '',
      args: [],
    );
  }

  /// `별점과 리뷰를 작성해주세요`
  String get commonRateAndReview {
    return Intl.message(
      '별점과 리뷰를 작성해주세요',
      name: 'commonRateAndReview',
      desc: '',
      args: [],
    );
  }

  /// `작성 완료`
  String get commonWriteCompleted {
    return Intl.message(
      '작성 완료',
      name: 'commonWriteCompleted',
      desc: '',
      args: [],
    );
  }

  /// `답변을 작성해주세요`
  String get commonWriteReply {
    return Intl.message(
      '답변을 작성해주세요',
      name: 'commonWriteReply',
      desc: '',
      args: [],
    );
  }

  /// `시작`
  String get commonStart {
    return Intl.message(
      '시작',
      name: 'commonStart',
      desc: '',
      args: [],
    );
  }

  /// `상품`
  String get commonProduct {
    return Intl.message(
      '상품',
      name: 'commonProduct',
      desc: '',
      args: [],
    );
  }

  /// `이미지를 선택해주세요`
  String get commonSelectImage {
    return Intl.message(
      '이미지를 선택해주세요',
      name: 'commonSelectImage',
      desc: '',
      args: [],
    );
  }

  /// `까지`
  String get commonUntil {
    return Intl.message(
      '까지',
      name: 'commonUntil',
      desc: '',
      args: [],
    );
  }

  /// `게시`
  String get commonPost {
    return Intl.message(
      '게시',
      name: 'commonPost',
      desc: '',
      args: [],
    );
  }

  /// `미게시`
  String get commonNotPost {
    return Intl.message(
      '미게시',
      name: 'commonNotPost',
      desc: '',
      args: [],
    );
  }

  /// `종료`
  String get commonEnd {
    return Intl.message(
      '종료',
      name: 'commonEnd',
      desc: '',
      args: [],
    );
  }

  /// `상세 내역`
  String get commonDetails {
    return Intl.message(
      '상세 내역',
      name: 'commonDetails',
      desc: '',
      args: [],
    );
  }

  /// `혹은`
  String get commonOR {
    return Intl.message(
      '혹은',
      name: 'commonOR',
      desc: '',
      args: [],
    );
  }

  /// `로그인`
  String get loginSignIn {
    return Intl.message(
      '로그인',
      name: 'loginSignIn',
      desc: '',
      args: [],
    );
  }

  /// `구글계정으로 시작하기`
  String get loginWithGoogle {
    return Intl.message(
      '구글계정으로 시작하기',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `페이스북계정으로 시작하기`
  String get loginWithFacebook {
    return Intl.message(
      '페이스북계정으로 시작하기',
      name: 'loginWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `구글`
  String get loginGoogle {
    return Intl.message(
      '구글',
      name: 'loginGoogle',
      desc: '',
      args: [],
    );
  }

  /// `페이스북`
  String get loginFacebook {
    return Intl.message(
      '페이스북',
      name: 'loginFacebook',
      desc: '',
      args: [],
    );
  }

  /// `인증 실패`
  String get loginAuthError {
    return Intl.message(
      '인증 실패',
      name: 'loginAuthError',
      desc: '',
      args: [],
    );
  }

  /// `어플리케이션 서버 인증 오류`
  String get loginAppServerAuthError {
    return Intl.message(
      '어플리케이션 서버 인증 오류',
      name: 'loginAppServerAuthError',
      desc: '',
      args: [],
    );
  }

  /// `로그인 실패`
  String get loginFailed {
    return Intl.message(
      '로그인 실패',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `로그인에 실패했습니다. 다시 한번 시도해주세요.`
  String get loginFailedAndTryAgain {
    return Intl.message(
      '로그인에 실패했습니다. 다시 한번 시도해주세요.',
      name: 'loginFailedAndTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `로그인 세션 만료`
  String get loginSessionExpired {
    return Intl.message(
      '로그인 세션 만료',
      name: 'loginSessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `다시 로그인 합니다.`
  String get loginTryAgain {
    return Intl.message(
      '다시 로그인 합니다.',
      name: 'loginTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `만 14세 이상입니다(필수)`
  String get loginAgreeOver14Years {
    return Intl.message(
      '만 14세 이상입니다(필수)',
      name: 'loginAgreeOver14Years',
      desc: '',
      args: [],
    );
  }

  /// `이용약관동의(필수)`
  String get loginAgreeTermsAndCondition {
    return Intl.message(
      '이용약관동의(필수)',
      name: 'loginAgreeTermsAndCondition',
      desc: '',
      args: [],
    );
  }

  /// `개인정보처리방침 동의(필수)`
  String get loginAgreePrivacyPolicy {
    return Intl.message(
      '개인정보처리방침 동의(필수)',
      name: 'loginAgreePrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `위치기반서비스이용약관 동의(필수)`
  String get loginAgreeLocationBased {
    return Intl.message(
      '위치기반서비스이용약관 동의(필수)',
      name: 'loginAgreeLocationBased',
      desc: '',
      args: [],
    );
  }

  /// `아래의 필수 항목에\n동의해주세요`
  String get loginAgreeTermPrivacy {
    return Intl.message(
      '아래의 필수 항목에\n동의해주세요',
      name: 'loginAgreeTermPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `이용약관`
  String get loginTermsService {
    return Intl.message(
      '이용약관',
      name: 'loginTermsService',
      desc: '',
      args: [],
    );
  }

  /// `개인정보처리방침`
  String get loginPrivacyPolicy {
    return Intl.message(
      '개인정보처리방침',
      name: 'loginPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `위치기반서비스 이용약관`
  String get loginLocationBased {
    return Intl.message(
      '위치기반서비스 이용약관',
      name: 'loginLocationBased',
      desc: '',
      args: [],
    );
  }

  /// `현재 위치를 찾고 초기 데이터를 가지고 옵니다.`
  String get homeSearchingLocationNData {
    return Intl.message(
      '현재 위치를 찾고 초기 데이터를 가지고 옵니다.',
      name: 'homeSearchingLocationNData',
      desc: '',
      args: [],
    );
  }

  /// `나의 가게 등록`
  String get homeDrawerRegStore {
    return Intl.message(
      '나의 가게 등록',
      name: 'homeDrawerRegStore',
      desc: '',
      args: [],
    );
  }

  /// `나의 가게 삭제`
  String get homeDrawerUnregStore {
    return Intl.message(
      '나의 가게 삭제',
      name: 'homeDrawerUnregStore',
      desc: '',
      args: [],
    );
  }

  /// `나의 상품 등록`
  String get homeDrawerRegProduct {
    return Intl.message(
      '나의 상품 등록',
      name: 'homeDrawerRegProduct',
      desc: '',
      args: [],
    );
  }

  /// `나의 가게 정보`
  String get homeDrawerMyStoreInfo {
    return Intl.message(
      '나의 가게 정보',
      name: 'homeDrawerMyStoreInfo',
      desc: '',
      args: [],
    );
  }

  /// `나의 게시 정보`
  String get homeDrawerMyPosting {
    return Intl.message(
      '나의 게시 정보',
      name: 'homeDrawerMyPosting',
      desc: '',
      args: [],
    );
  }

  /// `게시 시작`
  String get homeDrawerStartPost {
    return Intl.message(
      '게시 시작',
      name: 'homeDrawerStartPost',
      desc: '',
      args: [],
    );
  }

  /// `게시 중지`
  String get homeDrawerStopPost {
    return Intl.message(
      '게시 중지',
      name: 'homeDrawerStopPost',
      desc: '',
      args: [],
    );
  }

  /// `광고 보기`
  String get homeDrawerWatchAD {
    return Intl.message(
      '광고 보기',
      name: 'homeDrawerWatchAD',
      desc: '',
      args: [],
    );
  }

  /// `광고를 시청하지 않아도 사용하시는데는 전혀 문제가 없습니다.서비스 유지 및 관리를 위해 가끔씩 광고 시청부탁드립니다.`
  String get homeDrawerADComment {
    return Intl.message(
      '광고를 시청하지 않아도 사용하시는데는 전혀 문제가 없습니다.서비스 유지 및 관리를 위해 가끔씩 광고 시청부탁드립니다.',
      name: 'homeDrawerADComment',
      desc: '',
      args: [],
    );
  }

  /// `캐시 삭제`
  String get homeDrawerRemoveCache {
    return Intl.message(
      '캐시 삭제',
      name: 'homeDrawerRemoveCache',
      desc: '',
      args: [],
    );
  }

  /// `공지사항`
  String get homeDrawerNotice {
    return Intl.message(
      '공지사항',
      name: 'homeDrawerNotice',
      desc: '',
      args: [],
    );
  }

  /// `공지사항이 없습니다.`
  String get homeDrawerNoNotice {
    return Intl.message(
      '공지사항이 없습니다.',
      name: 'homeDrawerNoNotice',
      desc: '',
      args: [],
    );
  }

  /// `설정`
  String get homeDrawerSettings {
    return Intl.message(
      '설정',
      name: 'homeDrawerSettings',
      desc: '',
      args: [],
    );
  }

  /// `도움말`
  String get homeDrawerHelp {
    return Intl.message(
      '도움말',
      name: 'homeDrawerHelp',
      desc: '',
      args: [],
    );
  }

  /// `현재 위치를 확인중입니다.`
  String get homeCheckCurrentLocation {
    return Intl.message(
      '현재 위치를 확인중입니다.',
      name: 'homeCheckCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `종료하기 위해서 2초안에 백키를 한번 더 눌러주세요.`
  String get homeExitApp {
    return Intl.message(
      '종료하기 위해서 2초안에 백키를 한번 더 눌러주세요.',
      name: 'homeExitApp',
      desc: '',
      args: [],
    );
  }

  /// `메세지 수신`
  String get homeMessageReceived {
    return Intl.message(
      '메세지 수신',
      name: 'homeMessageReceived',
      desc: '',
      args: [],
    );
  }

  /// `게시하고 있는 가게 없음.`
  String get homeNoPostingStore {
    return Intl.message(
      '게시하고 있는 가게 없음.',
      name: 'homeNoPostingStore',
      desc: '',
      args: [],
    );
  }

  /// `현재 위치를 알수가 없습니다.`
  String get homeCurrentLocationUnknown {
    return Intl.message(
      '현재 위치를 알수가 없습니다.',
      name: 'homeCurrentLocationUnknown',
      desc: '',
      args: [],
    );
  }

  /// `새로운 버전이 있습니다\n업데이트 하시겠습니까?`
  String get homeWantToUpdate {
    return Intl.message(
      '새로운 버전이 있습니다\n업데이트 하시겠습니까?',
      name: 'homeWantToUpdate',
      desc: '',
      args: [],
    );
  }

  /// `주요 개선 사항이 있습니다\n최신 버젼으로 업데이트가 필요합니다.`
  String get homeUpdateRequired {
    return Intl.message(
      '주요 개선 사항이 있습니다\n최신 버젼으로 업데이트가 필요합니다.',
      name: 'homeUpdateRequired',
      desc: '',
      args: [],
    );
  }

  /// `현재 가게 게시시간은\n{name1}시부터 {name2}시까지입니다.\n향후 늘리도록 하겠습니다.`
  String homeServiceTimeWarning(Object name1, Object name2) {
    return Intl.message(
      '현재 가게 게시시간은\n$name1시부터 $name2시까지입니다.\n향후 늘리도록 하겠습니다.',
      name: 'homeServiceTimeWarning',
      desc: '',
      args: [name1, name2],
    );
  }

  /// `현재 가게 게시시간은 {name1}시까지입니다.\n향후 늘리도록 하겠습니다.`
  String homeServiceEndTimeWarning(Object name1) {
    return Intl.message(
      '현재 가게 게시시간은 $name1시까지입니다.\n향후 늘리도록 하겠습니다.',
      name: 'homeServiceEndTimeWarning',
      desc: '',
      args: [name1],
    );
  }

  /// `서비스 시간`
  String get homeServiceTime {
    return Intl.message(
      '서비스 시간',
      name: 'homeServiceTime',
      desc: '',
      args: [],
    );
  }

  /// `위치를 선택해주세요`
  String get homeSelectLocation {
    return Intl.message(
      '위치를 선택해주세요',
      name: 'homeSelectLocation',
      desc: '',
      args: [],
    );
  }

  /// `현재 위치로 설정`
  String get homeSetCurrentLocation {
    return Intl.message(
      '현재 위치로 설정',
      name: 'homeSetCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `이전에 선택한 위치`
  String get homePreSelectedLocation {
    return Intl.message(
      '이전에 선택한 위치',
      name: 'homePreSelectedLocation',
      desc: '',
      args: [],
    );
  }

  /// `직접 위치 선택`
  String get homeDirectLocationSelection {
    return Intl.message(
      '직접 위치 선택',
      name: 'homeDirectLocationSelection',
      desc: '',
      args: [],
    );
  }

  /// `선택이 가능한 위치가 없습니다`
  String get homeNoLocationAvailable {
    return Intl.message(
      '선택이 가능한 위치가 없습니다',
      name: 'homeNoLocationAvailable',
      desc: '',
      args: [],
    );
  }

  /// `1. 원하시는 위치를 직접 선택하시면 됩니다\n2. 현재는 일부 지역만 서비스가 지원됩니다\n3. 서비스가 지원되는 지역은 차츰 확대할 예정입니다`
  String get homeHelpDirectLocationSelection {
    return Intl.message(
      '1. 원하시는 위치를 직접 선택하시면 됩니다\n2. 현재는 일부 지역만 서비스가 지원됩니다\n3. 서비스가 지원되는 지역은 차츰 확대할 예정입니다',
      name: 'homeHelpDirectLocationSelection',
      desc: '',
      args: [],
    );
  }

  /// `서비스 점검 중`
  String get homeServiceCheckInProgress {
    return Intl.message(
      '서비스 점검 중',
      name: 'homeServiceCheckInProgress',
      desc: '',
      args: [],
    );
  }

  /// `가게 목록`
  String get postListStoreList {
    return Intl.message(
      '가게 목록',
      name: 'postListStoreList',
      desc: '',
      args: [],
    );
  }

  /// `가게 검색`
  String get postListSearchStore {
    return Intl.message(
      '가게 검색',
      name: 'postListSearchStore',
      desc: '',
      args: [],
    );
  }

  /// `a hh시 mm분까지`
  String get postListUntilTime {
    return Intl.message(
      'a hh시 mm분까지',
      name: 'postListUntilTime',
      desc: '',
      args: [],
    );
  }

  /// `현재 이 지역에는\n할인중인 가게가 없습니다.`
  String get postNoDiscountStore {
    return Intl.message(
      '현재 이 지역에는\n할인중인 가게가 없습니다.',
      name: 'postNoDiscountStore',
      desc: '',
      args: [],
    );
  }

  /// `카테고리 설정이 되지 않았는지 확인해주세요.`
  String get postCategoryNotSet {
    return Intl.message(
      '카테고리 설정이 되지 않았는지 확인해주세요.',
      name: 'postCategoryNotSet',
      desc: '',
      args: [],
    );
  }

  /// `카테고리 설정을 확인해주세요.`
  String get postCheckCategory {
    return Intl.message(
      '카테고리 설정을 확인해주세요.',
      name: 'postCheckCategory',
      desc: '',
      args: [],
    );
  }

  /// `검색 규칙`
  String get searchingRule {
    return Intl.message(
      '검색 규칙',
      name: 'searchingRule',
      desc: '',
      args: [],
    );
  }

  /// `카테고리`
  String get searchingRuleCategory {
    return Intl.message(
      '카테고리',
      name: 'searchingRuleCategory',
      desc: '',
      args: [],
    );
  }

  /// `위치`
  String get searchingRuleLocation {
    return Intl.message(
      '위치',
      name: 'searchingRuleLocation',
      desc: '',
      args: [],
    );
  }

  /// `1KM 이내`
  String get searchingRuleIn1KM {
    return Intl.message(
      '1KM 이내',
      name: 'searchingRuleIn1KM',
      desc: '',
      args: [],
    );
  }

  /// `2KM 이내`
  String get searchingRuleIn2KM {
    return Intl.message(
      '2KM 이내',
      name: 'searchingRuleIn2KM',
      desc: '',
      args: [],
    );
  }

  /// `현재 위치에서`
  String get searchingRuleAtCurrentLocation {
    return Intl.message(
      '현재 위치에서',
      name: 'searchingRuleAtCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `선택된 지역내에서`
  String get searchingRuleInTheChosenArea {
    return Intl.message(
      '선택된 지역내에서',
      name: 'searchingRuleInTheChosenArea',
      desc: '',
      args: [],
    );
  }

  /// `지역 선택`
  String get searchingRuleAreaSelection {
    return Intl.message(
      '지역 선택',
      name: 'searchingRuleAreaSelection',
      desc: '',
      args: [],
    );
  }

  /// `상세 지역 선택`
  String get searchingRuleDetailedAreaSelection {
    return Intl.message(
      '상세 지역 선택',
      name: 'searchingRuleDetailedAreaSelection',
      desc: '',
      args: [],
    );
  }

  /// `계정`
  String get settingsAccount {
    return Intl.message(
      '계정',
      name: 'settingsAccount',
      desc: '',
      args: [],
    );
  }

  /// `로그아웃`
  String get settingsLogout {
    return Intl.message(
      '로그아웃',
      name: 'settingsLogout',
      desc: '',
      args: [],
    );
  }

  /// `데이터`
  String get settingsData {
    return Intl.message(
      '데이터',
      name: 'settingsData',
      desc: '',
      args: [],
    );
  }

  /// `임시 저장 데이터 삭제`
  String get settingsClearCache {
    return Intl.message(
      '임시 저장 데이터 삭제',
      name: 'settingsClearCache',
      desc: '',
      args: [],
    );
  }

  /// `캐시 삭제를 하시겠습니까?`
  String get settingsWantClearCache {
    return Intl.message(
      '캐시 삭제를 하시겠습니까?',
      name: 'settingsWantClearCache',
      desc: '',
      args: [],
    );
  }

  /// `권한`
  String get settingsAuthority {
    return Intl.message(
      '권한',
      name: 'settingsAuthority',
      desc: '',
      args: [],
    );
  }

  /// `가게관리자 권한 넘기기`
  String get settingsTransferStoreManagerAuthority {
    return Intl.message(
      '가게관리자 권한 넘기기',
      name: 'settingsTransferStoreManagerAuthority',
      desc: '',
      args: [],
    );
  }

  /// `가게관리자 권한 넘기기 취소`
  String get settingsCancelTransferStoreManagerAuthority {
    return Intl.message(
      '가게관리자 권한 넘기기 취소',
      name: 'settingsCancelTransferStoreManagerAuthority',
      desc: '',
      args: [],
    );
  }

  /// `가게관리자 권한 받아오기`
  String get settingsGetStoreManagerAuthority {
    return Intl.message(
      '가게관리자 권한 받아오기',
      name: 'settingsGetStoreManagerAuthority',
      desc: '',
      args: [],
    );
  }

  /// `버전`
  String get settingsVersion {
    return Intl.message(
      '버전',
      name: 'settingsVersion',
      desc: '',
      args: [],
    );
  }

  /// `기타`
  String get settingsMisc {
    return Intl.message(
      '기타',
      name: 'settingsMisc',
      desc: '',
      args: [],
    );
  }

  /// `이용약관`
  String get settingsTermsService {
    return Intl.message(
      '이용약관',
      name: 'settingsTermsService',
      desc: '',
      args: [],
    );
  }

  /// `개인정보 이용 및 수집`
  String get settingsUseCollectionPersonalInfo {
    return Intl.message(
      '개인정보 이용 및 수집',
      name: 'settingsUseCollectionPersonalInfo',
      desc: '',
      args: [],
    );
  }

  /// `위치기반서비스이용약관`
  String get settingsLocationBasedTermsService {
    return Intl.message(
      '위치기반서비스이용약관',
      name: 'settingsLocationBasedTermsService',
      desc: '',
      args: [],
    );
  }

  /// `로그아웃하시겠습니까?`
  String get settingsAskLogout {
    return Intl.message(
      '로그아웃하시겠습니까?',
      name: 'settingsAskLogout',
      desc: '',
      args: [],
    );
  }

  /// `권한 이관받을 사람의 이메일을\n입력해주세요`
  String get settingsEmailTransferred {
    return Intl.message(
      '권한 이관받을 사람의 이메일을\n입력해주세요',
      name: 'settingsEmailTransferred',
      desc: '',
      args: [],
    );
  }

  /// `{name}로 가게 이관을 취소하시겠습니까?`
  String settingsStoreTransferCancel(Object name) {
    return Intl.message(
      '$name로 가게 이관을 취소하시겠습니까?',
      name: 'settingsStoreTransferCancel',
      desc: '',
      args: [name],
    );
  }

  /// `가게 이관을 받으시겠습니까?`
  String get settingsStoreTransferAccept {
    return Intl.message(
      '가게 이관을 받으시겠습니까?',
      name: 'settingsStoreTransferAccept',
      desc: '',
      args: [],
    );
  }

  /// `주소 업데이트`
  String get settingsAddressUpdate {
    return Intl.message(
      '주소 업데이트',
      name: 'settingsAddressUpdate',
      desc: '',
      args: [],
    );
  }

  /// `주소를 업데이트하시겠습니까?`
  String get settingsUpdateAddress {
    return Intl.message(
      '주소를 업데이트하시겠습니까?',
      name: 'settingsUpdateAddress',
      desc: '',
      args: [],
    );
  }

  /// `등록된 모든 데이타가 삭제됩니다`
  String get settingUserDataDeleted {
    return Intl.message(
      '등록된 모든 데이타가 삭제됩니다',
      name: 'settingUserDataDeleted',
      desc: '',
      args: [],
    );
  }

  /// `회원 탈퇴`
  String get settingUserWithdrawal {
    return Intl.message(
      '회원 탈퇴',
      name: 'settingUserWithdrawal',
      desc: '',
      args: [],
    );
  }

  /// `회원 탈퇴하시겠습니까?`
  String get settingUserWithdrawalMembership {
    return Intl.message(
      '회원 탈퇴하시겠습니까?',
      name: 'settingUserWithdrawalMembership',
      desc: '',
      args: [],
    );
  }

  /// `할인 중인 상품`
  String get storeProductOnSale {
    return Intl.message(
      '할인 중인 상품',
      name: 'storeProductOnSale',
      desc: '',
      args: [],
    );
  }

  /// `평점 및 리뷰`
  String get storeRatingsReviews {
    return Intl.message(
      '평점 및 리뷰',
      name: 'storeRatingsReviews',
      desc: '',
      args: [],
    );
  }

  /// `가게 평가하기`
  String get storeRateStore {
    return Intl.message(
      '가게 평가하기',
      name: 'storeRateStore',
      desc: '',
      args: [],
    );
  }

  /// `가게 평가`
  String get storeStoreRate {
    return Intl.message(
      '가게 평가',
      name: 'storeStoreRate',
      desc: '',
      args: [],
    );
  }

  /// `나의 평가`
  String get storeMyRate {
    return Intl.message(
      '나의 평가',
      name: 'storeMyRate',
      desc: '',
      args: [],
    );
  }

  /// `전체 평가`
  String get storeFullRating {
    return Intl.message(
      '전체 평가',
      name: 'storeFullRating',
      desc: '',
      args: [],
    );
  }

  /// `가게 리뷰`
  String get storeStoreReview {
    return Intl.message(
      '가게 리뷰',
      name: 'storeStoreReview',
      desc: '',
      args: [],
    );
  }

  /// `나의 리뷰`
  String get storeMyReview {
    return Intl.message(
      '나의 리뷰',
      name: 'storeMyReview',
      desc: '',
      args: [],
    );
  }

  /// `전체 리뷰`
  String get storeFullReview {
    return Intl.message(
      '전체 리뷰',
      name: 'storeFullReview',
      desc: '',
      args: [],
    );
  }

  /// `리뷰 더보기`
  String get storeMoreReview {
    return Intl.message(
      '리뷰 더보기',
      name: 'storeMoreReview',
      desc: '',
      args: [],
    );
  }

  /// `리뷰 작성하기`
  String get storeWriteReview {
    return Intl.message(
      '리뷰 작성하기',
      name: 'storeWriteReview',
      desc: '',
      args: [],
    );
  }

  /// `리뷰 수정`
  String get storeModifyReview {
    return Intl.message(
      '리뷰 수정',
      name: 'storeModifyReview',
      desc: '',
      args: [],
    );
  }

  /// `등록된 상품`
  String get storeRegProduct {
    return Intl.message(
      '등록된 상품',
      name: 'storeRegProduct',
      desc: '',
      args: [],
    );
  }

  /// `리뷰보고 답변달기`
  String get storeReviewReply {
    return Intl.message(
      '리뷰보고 답변달기',
      name: 'storeReviewReply',
      desc: '',
      args: [],
    );
  }

  /// `가게 정보`
  String get storeStoreInfo {
    return Intl.message(
      '가게 정보',
      name: 'storeStoreInfo',
      desc: '',
      args: [],
    );
  }

  /// `가게관리자 정보`
  String get storeStoreOwnerInfo {
    return Intl.message(
      '가게관리자 정보',
      name: 'storeStoreOwnerInfo',
      desc: '',
      args: [],
    );
  }

  /// `가게정보 수정`
  String get storeModStoreInfo {
    return Intl.message(
      '가게정보 수정',
      name: 'storeModStoreInfo',
      desc: '',
      args: [],
    );
  }

  /// `가게관리자 정보 수정`
  String get storeModStoreOwnerInfo {
    return Intl.message(
      '가게관리자 정보 수정',
      name: 'storeModStoreOwnerInfo',
      desc: '',
      args: [],
    );
  }

  /// `작성된 리뷰가 없습니다`
  String get storeNoReview {
    return Intl.message(
      '작성된 리뷰가 없습니다',
      name: 'storeNoReview',
      desc: '',
      args: [],
    );
  }

  /// `가게관리`
  String get storeStoreMgmt {
    return Intl.message(
      '가게관리',
      name: 'storeStoreMgmt',
      desc: '',
      args: [],
    );
  }

  /// `할인 상품`
  String get storeDiscountProduct {
    return Intl.message(
      '할인 상품',
      name: 'storeDiscountProduct',
      desc: '',
      args: [],
    );
  }

  /// `가게명`
  String get storeStoreName {
    return Intl.message(
      '가게명',
      name: 'storeStoreName',
      desc: '',
      args: [],
    );
  }

  /// `방문객 리뷰`
  String get storeVisitorReviews {
    return Intl.message(
      '방문객 리뷰',
      name: 'storeVisitorReviews',
      desc: '',
      args: [],
    );
  }

  /// `미답변 리뷰가 없습니다`
  String get storeNoAnsweredReview {
    return Intl.message(
      '미답변 리뷰가 없습니다',
      name: 'storeNoAnsweredReview',
      desc: '',
      args: [],
    );
  }

  /// `리뷰 신고`
  String get storeReportReview {
    return Intl.message(
      '리뷰 신고',
      name: 'storeReportReview',
      desc: '',
      args: [],
    );
  }

  /// `해당 리뷰를 신고하시겠습니까?`
  String get storeAskReportReview {
    return Intl.message(
      '해당 리뷰를 신고하시겠습니까?',
      name: 'storeAskReportReview',
      desc: '',
      args: [],
    );
  }

  /// `리뷰/평점이 비활성화된 상태입니다`
  String get storeDeactivatedReviewByManager {
    return Intl.message(
      '리뷰/평점이 비활성화된 상태입니다',
      name: 'storeDeactivatedReviewByManager',
      desc: '',
      args: [],
    );
  }

  /// `리뷰/평점 비활성화`
  String get storeDeactivatedReview {
    return Intl.message(
      '리뷰/평점 비활성화',
      name: 'storeDeactivatedReview',
      desc: '',
      args: [],
    );
  }

  /// `총 {name}건의 신고가 접수되었습니다`
  String storeReportTotalReport(Object name) {
    return Intl.message(
      '총 $name건의 신고가 접수되었습니다',
      name: 'storeReportTotalReport',
      desc: '',
      args: [name],
    );
  }

  /// `전화번호 인증`
  String get storeRegPhoneNumberVrf {
    return Intl.message(
      '전화번호 인증',
      name: 'storeRegPhoneNumberVrf',
      desc: '',
      args: [],
    );
  }

  /// `전화번호`
  String get storeRegPhoneNumber {
    return Intl.message(
      '전화번호',
      name: 'storeRegPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `인증 번호 요청`
  String get storeRegReqVrfNumber {
    return Intl.message(
      '인증 번호 요청',
      name: 'storeRegReqVrfNumber',
      desc: '',
      args: [],
    );
  }

  /// `인증 번호`
  String get storeRegVrfNumber {
    return Intl.message(
      '인증 번호',
      name: 'storeRegVrfNumber',
      desc: '',
      args: [],
    );
  }

  /// `인증 번호 검증`
  String get storeRegVrfCertNumber {
    return Intl.message(
      '인증 번호 검증',
      name: 'storeRegVrfCertNumber',
      desc: '',
      args: [],
    );
  }

  /// `예시`
  String get storeRegExample {
    return Intl.message(
      '예시',
      name: 'storeRegExample',
      desc: '',
      args: [],
    );
  }

  /// `6자리 인증번호를 넣어주세요`
  String get storeReg6DigitVrfNum {
    return Intl.message(
      '6자리 인증번호를 넣어주세요',
      name: 'storeReg6DigitVrfNum',
      desc: '',
      args: [],
    );
  }

  /// `SMS 인증 코드를 보냈습니다`
  String get storeRegSentSMSVrfCode {
    return Intl.message(
      'SMS 인증 코드를 보냈습니다',
      name: 'storeRegSentSMSVrfCode',
      desc: '',
      args: [],
    );
  }

  /// `전화번호 인증에 성공했습니다`
  String get storeRegPhoneVrfSuccess {
    return Intl.message(
      '전화번호 인증에 성공했습니다',
      name: 'storeRegPhoneVrfSuccess',
      desc: '',
      args: [],
    );
  }

  /// `전화번호를 인증해 주세요`
  String get storeRegVerifyPhoneNum {
    return Intl.message(
      '전화번호를 인증해 주세요',
      name: 'storeRegVerifyPhoneNum',
      desc: '',
      args: [],
    );
  }

  /// `전화번호를 입력하세요`
  String get storeRegEnterPhoneNum {
    return Intl.message(
      '전화번호를 입력하세요',
      name: 'storeRegEnterPhoneNum',
      desc: '',
      args: [],
    );
  }

  /// `인증번호를 입력하세요`
  String get storeRegEnterCertCode {
    return Intl.message(
      '인증번호를 입력하세요',
      name: 'storeRegEnterCertCode',
      desc: '',
      args: [],
    );
  }

  /// `관리자 이름`
  String get storeRegManagerName {
    return Intl.message(
      '관리자 이름',
      name: 'storeRegManagerName',
      desc: '',
      args: [],
    );
  }

  /// `관리자 전화번호`
  String get storeRegManagerPhone {
    return Intl.message(
      '관리자 전화번호',
      name: 'storeRegManagerPhone',
      desc: '',
      args: [],
    );
  }

  /// `홍길동`
  String get storeRegAnyName {
    return Intl.message(
      '홍길동',
      name: 'storeRegAnyName',
      desc: '',
      args: [],
    );
  }

  /// `이름을 정확히 입력해주세요`
  String get storeRegEnterNameCorrectly {
    return Intl.message(
      '이름을 정확히 입력해주세요',
      name: 'storeRegEnterNameCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `가게 정보 입력`
  String get storeRegEnterStoreInfo {
    return Intl.message(
      '가게 정보 입력',
      name: 'storeRegEnterStoreInfo',
      desc: '',
      args: [],
    );
  }

  /// `일반 가게`
  String get storeRegStoreFixed {
    return Intl.message(
      '일반 가게',
      name: 'storeRegStoreFixed',
      desc: '',
      args: [],
    );
  }

  /// `이동식 가게`
  String get storeRegStoreMoving {
    return Intl.message(
      '이동식 가게',
      name: 'storeRegStoreMoving',
      desc: '',
      args: [],
    );
  }

  /// `가게형태를 선택하세요`
  String get storeRegChooseStoreType {
    return Intl.message(
      '가게형태를 선택하세요',
      name: 'storeRegChooseStoreType',
      desc: '',
      args: [],
    );
  }

  /// `가게 카테고리`
  String get storeRegStoreCategory {
    return Intl.message(
      '가게 카테고리',
      name: 'storeRegStoreCategory',
      desc: '',
      args: [],
    );
  }

  /// `가게 이름을 정확히 입력해주세요`
  String get storeRegEnterStoreNameCorrectly {
    return Intl.message(
      '가게 이름을 정확히 입력해주세요',
      name: 'storeRegEnterStoreNameCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `가게 이름`
  String get storeRegStoreName {
    return Intl.message(
      '가게 이름',
      name: 'storeRegStoreName',
      desc: '',
      args: [],
    );
  }

  /// `사업자 등록 번호`
  String get storeRegStoreRegNo {
    return Intl.message(
      '사업자 등록 번호',
      name: 'storeRegStoreRegNo',
      desc: '',
      args: [],
    );
  }

  /// `가게 사업자 등록 번호를 정확히 입력해주세요`
  String get storeRegEnterStoreRegNoCorrectly {
    return Intl.message(
      '가게 사업자 등록 번호를 정확히 입력해주세요',
      name: 'storeRegEnterStoreRegNoCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `가게 전화번호를 정확히 입력해주세요`
  String get storeRegEnterStorePhoneCorrectly {
    return Intl.message(
      '가게 전화번호를 정확히 입력해주세요',
      name: 'storeRegEnterStorePhoneCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `가게 전화번호`
  String get storeRegStorePhoneNumber {
    return Intl.message(
      '가게 전화번호',
      name: 'storeRegStorePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `차량 번호`
  String get storeRegCarNumber {
    return Intl.message(
      '차량 번호',
      name: 'storeRegCarNumber',
      desc: '',
      args: [],
    );
  }

  /// `가게 주소`
  String get storeRegStoreAdr {
    return Intl.message(
      '가게 주소',
      name: 'storeRegStoreAdr',
      desc: '',
      args: [],
    );
  }

  /// `가게 상세 주소`
  String get storeRegStoreAdrDetail {
    return Intl.message(
      '가게 상세 주소',
      name: 'storeRegStoreAdrDetail',
      desc: '',
      args: [],
    );
  }

  /// `위치를 찾을 수 없습니다\n주소를 다시 한 번 확인해주세요`
  String get storeRegStoreLocationNotFound {
    return Intl.message(
      '위치를 찾을 수 없습니다\n주소를 다시 한 번 확인해주세요',
      name: 'storeRegStoreLocationNotFound',
      desc: '',
      args: [],
    );
  }

  /// `위치 확인`
  String get storeRegStoreLocationCheck {
    return Intl.message(
      '위치 확인',
      name: 'storeRegStoreLocationCheck',
      desc: '',
      args: [],
    );
  }

  /// `사용자가 지도상의 위치를 보고 가게를 확인합니다.지도상에 가게 위치를 확인하세요.지도를 클릭하면 가게의 위치변경이 가능합니다.`
  String get storeRegStoreLocationCheckDesc {
    return Intl.message(
      '사용자가 지도상의 위치를 보고 가게를 확인합니다.지도상에 가게 위치를 확인하세요.지도를 클릭하면 가게의 위치변경이 가능합니다.',
      name: 'storeRegStoreLocationCheckDesc',
      desc: '',
      args: [],
    );
  }

  /// `입력된 값에 문제가 있습니다\n 문제를 확인하시고 다시 진행하시기 바랍니다`
  String get storeRegResubmit {
    return Intl.message(
      '입력된 값에 문제가 있습니다\n 문제를 확인하시고 다시 진행하시기 바랍니다',
      name: 'storeRegResubmit',
      desc: '',
      args: [],
    );
  }

  /// `카테고리를 선택해주세요`
  String get storeRegSelectCategory {
    return Intl.message(
      '카테고리를 선택해주세요',
      name: 'storeRegSelectCategory',
      desc: '',
      args: [],
    );
  }

  /// `차량번호를 입력해주세요`
  String get storeRegEnterCarNum {
    return Intl.message(
      '차량번호를 입력해주세요',
      name: 'storeRegEnterCarNum',
      desc: '',
      args: [],
    );
  }

  /// `주소를 입력해주세요`
  String get storeRegEnterAddress {
    return Intl.message(
      '주소를 입력해주세요',
      name: 'storeRegEnterAddress',
      desc: '',
      args: [],
    );
  }

  /// `가게의 위치를 지도상에서 확인해주세요`
  String get storeRegCheckLocation {
    return Intl.message(
      '가게의 위치를 지도상에서 확인해주세요',
      name: 'storeRegCheckLocation',
      desc: '',
      args: [],
    );
  }

  /// `정상적으로 가게를 등록했습니다`
  String get storeRegRegSuccess {
    return Intl.message(
      '정상적으로 가게를 등록했습니다',
      name: 'storeRegRegSuccess',
      desc: '',
      args: [],
    );
  }

  /// `정상적으로 가게가 삭제되었습니다`
  String get storeRegUnRegStoreSuccess {
    return Intl.message(
      '정상적으로 가게가 삭제되었습니다',
      name: 'storeRegUnRegStoreSuccess',
      desc: '',
      args: [],
    );
  }

  /// `전화번호인증을 받으세요`
  String get storeRegGetPhoneVerification {
    return Intl.message(
      '전화번호인증을 받으세요',
      name: 'storeRegGetPhoneVerification',
      desc: '',
      args: [],
    );
  }

  /// `전화번호 인증페이지를 활성화하시겠습니까?`
  String get storeRegActivatePhoneVrf {
    return Intl.message(
      '전화번호 인증페이지를 활성화하시겠습니까?',
      name: 'storeRegActivatePhoneVrf',
      desc: '',
      args: [],
    );
  }

  /// `가게 위치가 현재 지원되지 않는 지역입니다`
  String get storeRegNotSupportedArea {
    return Intl.message(
      '가게 위치가 현재 지원되지 않는 지역입니다',
      name: 'storeRegNotSupportedArea',
      desc: '',
      args: [],
    );
  }

  /// `지원되는 지역은 지도화면-좌측상단(현재위치 혹은 지역명)-직접위치선택하시면 보실수 있습니다\n지원지역은 추후에 추가될 예정입니다.`
  String get storeRegNotSupportedAreaDesc {
    return Intl.message(
      '지원되는 지역은 지도화면-좌측상단(현재위치 혹은 지역명)-직접위치선택하시면 보실수 있습니다\n지원지역은 추후에 추가될 예정입니다.',
      name: 'storeRegNotSupportedAreaDesc',
      desc: '',
      args: [],
    );
  }

  /// `주소와 선택하신 위치의 차이가 많이 납니다\n주소를 다시 확인하세요`
  String get storeRegALotDifferenceAddressLocation {
    return Intl.message(
      '주소와 선택하신 위치의 차이가 많이 납니다\n주소를 다시 확인하세요',
      name: 'storeRegALotDifferenceAddressLocation',
      desc: '',
      args: [],
    );
  }

  /// `전화번호를 잘못 입력했습니다`
  String get storeRegWrongPhoneNumber {
    return Intl.message(
      '전화번호를 잘못 입력했습니다',
      name: 'storeRegWrongPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `가게 등록`
  String get storeRegStoreReg {
    return Intl.message(
      '가게 등록',
      name: 'storeRegStoreReg',
      desc: '',
      args: [],
    );
  }

  /// `가게등록`
  String get storeRegStoreReg2 {
    return Intl.message(
      '가게등록',
      name: 'storeRegStoreReg2',
      desc: '',
      args: [],
    );
  }

  /// `인증받은 전화번호가 아닙니다`
  String get storeRegNotVerifiedNumber {
    return Intl.message(
      '인증받은 전화번호가 아닙니다',
      name: 'storeRegNotVerifiedNumber',
      desc: '',
      args: [],
    );
  }

  /// `번호인증`
  String get storeRegPhoneVrf {
    return Intl.message(
      '번호인증',
      name: 'storeRegPhoneVrf',
      desc: '',
      args: [],
    );
  }

  /// `주소찾기`
  String get storeRegFindAddr {
    return Intl.message(
      '주소찾기',
      name: 'storeRegFindAddr',
      desc: '',
      args: [],
    );
  }

  /// `태그추가`
  String get storeRegAddTag {
    return Intl.message(
      '태그추가',
      name: 'storeRegAddTag',
      desc: '',
      args: [],
    );
  }

  /// `가게를 나타내는 검색어(최대{name}개)`
  String storeRegTagDescription(Object name) {
    return Intl.message(
      '가게를 나타내는 검색어(최대$name개)',
      name: 'storeRegTagDescription',
      desc: '',
      args: [name],
    );
  }

  /// `번호요청`
  String get storeRegReqCertNum {
    return Intl.message(
      '번호요청',
      name: 'storeRegReqCertNum',
      desc: '',
      args: [],
    );
  }

  /// `인증번호`
  String get storeRegCertNum {
    return Intl.message(
      '인증번호',
      name: 'storeRegCertNum',
      desc: '',
      args: [],
    );
  }

  /// `인증요청`
  String get storeRegVrfReq {
    return Intl.message(
      '인증요청',
      name: 'storeRegVrfReq',
      desc: '',
      args: [],
    );
  }

  /// `수정사항저장`
  String get storeRegSaveEdit {
    return Intl.message(
      '수정사항저장',
      name: 'storeRegSaveEdit',
      desc: '',
      args: [],
    );
  }

  /// `가게 삭제`
  String get storeRegDelStore {
    return Intl.message(
      '가게 삭제',
      name: 'storeRegDelStore',
      desc: '',
      args: [],
    );
  }

  /// `사업자등록증 이미지를 선택해주세요`
  String get storeRegSelectRegistrationImage {
    return Intl.message(
      '사업자등록증 이미지를 선택해주세요',
      name: 'storeRegSelectRegistrationImage',
      desc: '',
      args: [],
    );
  }

  /// `1. 가게 관리자 이름이나 별명을 입력해주세요\n2. 해당 정보는 사용자에게 공개되지 않습니다`
  String get storeRegManagerNameDesc {
    return Intl.message(
      '1. 가게 관리자 이름이나 별명을 입력해주세요\n2. 해당 정보는 사용자에게 공개되지 않습니다',
      name: 'storeRegManagerNameDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. '번호인증'을 눌러서 전화번호 인증을 받으세요\n2. 해당 정보는 사용자에게 공개되지 않습니다`
  String get storeRegManagerPhoneDesc {
    return Intl.message(
      '1. \'번호인증\'을 눌러서 전화번호 인증을 받으세요\n2. 해당 정보는 사용자에게 공개되지 않습니다',
      name: 'storeRegManagerPhoneDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. '카테고리'를 눌러서 가게에 가장 적합한 카테고리를 선택하세요\n2. 해당 정보는 사용자에게 공개됩니다`
  String get storeRegStoreCategoryDesc {
    return Intl.message(
      '1. \'카테고리\'를 눌러서 가게에 가장 적합한 카테고리를 선택하세요\n2. 해당 정보는 사용자에게 공개됩니다',
      name: 'storeRegStoreCategoryDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. 사용자가 확인할 수 있는 가게이름을 입력하세요(예를들어, 가게 간판이름 등)\n2. 해당 정보는 사용자에게 공개됩니다`
  String get storeRegStoreNameDesc {
    return Intl.message(
      '1. 사용자가 확인할 수 있는 가게이름을 입력하세요(예를들어, 가게 간판이름 등)\n2. 해당 정보는 사용자에게 공개됩니다',
      name: 'storeRegStoreNameDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. 가게 전화번호를 입력하세요\n2. 해당 정보는 사용자에게 공개됩니다`
  String get storeRegStorePhoneNumberDesc {
    return Intl.message(
      '1. 가게 전화번호를 입력하세요\n2. 해당 정보는 사용자에게 공개됩니다',
      name: 'storeRegStorePhoneNumberDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. 사업자 등록번호를 입력하세요\n2. 아직 사업자 등록 전이라면 '000-00-00000'을 입력하시면 됩니다\n3. 향 후, 서비스 개편 혹은 추가등에 따라 사업자 등록번호를 필수로 입력해야할 수 도 있습니다\n4. 해당 정보는 사용자에게 일부만 공개됩니다(예를 들어, 12*-4*-****0)`
  String get storeRegStoreRegNoDesc {
    return Intl.message(
      '1. 사업자 등록번호를 입력하세요\n2. 아직 사업자 등록 전이라면 \'000-00-00000\'을 입력하시면 됩니다\n3. 향 후, 서비스 개편 혹은 추가등에 따라 사업자 등록번호를 필수로 입력해야할 수 도 있습니다\n4. 해당 정보는 사용자에게 일부만 공개됩니다(예를 들어, 12*-4*-****0)',
      name: 'storeRegStoreRegNoDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. '주소찾기'를 눌러서 가게의 주소를 검색하고 선택하세요\n2. 가게주소와 상세주소는 사용자에게 공개됩니다`
  String get storeRegStoreAdrDesc {
    return Intl.message(
      '1. \'주소찾기\'를 눌러서 가게의 주소를 검색하고 선택하세요\n2. 가게주소와 상세주소는 사용자에게 공개됩니다',
      name: 'storeRegStoreAdrDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. 가게의 상세주소를 입력하세요\n2. 반드시 '위치확인'을 눌러서 지도상에 가게의 위치가 정확한지 확인하세요`
  String get storeRegStoreAdrDetailDesc {
    return Intl.message(
      '1. 가게의 상세주소를 입력하세요\n2. 반드시 \'위치확인\'을 눌러서 지도상에 가게의 위치가 정확한지 확인하세요',
      name: 'storeRegStoreAdrDetailDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. 해당 태그들은 사용자들이 검색을 할 때 사용되어집니다`
  String get storeRegTagDescriptionDesc {
    return Intl.message(
      '1. 해당 태그들은 사용자들이 검색을 할 때 사용되어집니다',
      name: 'storeRegTagDescriptionDesc',
      desc: '',
      args: [],
    );
  }

  /// `아직 등록된 상품이 없습니다`
  String get productMgmtNoRegProd {
    return Intl.message(
      '아직 등록된 상품이 없습니다',
      name: 'productMgmtNoRegProd',
      desc: '',
      args: [],
    );
  }

  /// `상품등록`
  String get productMgmtProdReg {
    return Intl.message(
      '상품등록',
      name: 'productMgmtProdReg',
      desc: '',
      args: [],
    );
  }

  /// `상품수정`
  String get productMgmtProdMod {
    return Intl.message(
      '상품수정',
      name: 'productMgmtProdMod',
      desc: '',
      args: [],
    );
  }

  /// `상품 상세정보`
  String get productMgmtProdDetail {
    return Intl.message(
      '상품 상세정보',
      name: 'productMgmtProdDetail',
      desc: '',
      args: [],
    );
  }

  /// `상품 이미지`
  String get productRegProductImage {
    return Intl.message(
      '상품 이미지',
      name: 'productRegProductImage',
      desc: '',
      args: [],
    );
  }

  /// `상품이름`
  String get productRegProductName {
    return Intl.message(
      '상품이름',
      name: 'productRegProductName',
      desc: '',
      args: [],
    );
  }

  /// `상품소개`
  String get productRegProductDesc {
    return Intl.message(
      '상품소개',
      name: 'productRegProductDesc',
      desc: '',
      args: [],
    );
  }

  /// `상품가격`
  String get productRegProductPrice {
    return Intl.message(
      '상품가격',
      name: 'productRegProductPrice',
      desc: '',
      args: [],
    );
  }

  /// `할인가격`
  String get productRegProductDPrice {
    return Intl.message(
      '할인가격',
      name: 'productRegProductDPrice',
      desc: '',
      args: [],
    );
  }

  /// `상품할인율`
  String get productRegProductDRate {
    return Intl.message(
      '상품할인율',
      name: 'productRegProductDRate',
      desc: '',
      args: [],
    );
  }

  /// `상품 정보`
  String get productRegProductInfo {
    return Intl.message(
      '상품 정보',
      name: 'productRegProductInfo',
      desc: '',
      args: [],
    );
  }

  /// `상품 정보 입력`
  String get productRegEnterProductInfo {
    return Intl.message(
      '상품 정보 입력',
      name: 'productRegEnterProductInfo',
      desc: '',
      args: [],
    );
  }

  /// `상품 정보 수정`
  String get productRegModifyProductInfo {
    return Intl.message(
      '상품 정보 수정',
      name: 'productRegModifyProductInfo',
      desc: '',
      args: [],
    );
  }

  /// `상품 이름을 정확히 입력해주세요`
  String get productRegEnterProductNameCorrectly {
    return Intl.message(
      '상품 이름을 정확히 입력해주세요',
      name: 'productRegEnterProductNameCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `상품 설명을 입력해주세요`
  String get productRegEnterProductDesc {
    return Intl.message(
      '상품 설명을 입력해주세요',
      name: 'productRegEnterProductDesc',
      desc: '',
      args: [],
    );
  }

  /// `상품 가격을 입력해주세요`
  String get productRegEnterProductPrice {
    return Intl.message(
      '상품 가격을 입력해주세요',
      name: 'productRegEnterProductPrice',
      desc: '',
      args: [],
    );
  }

  /// `상품 할인 가격을 입력해주세요`
  String get productRegEnterProductDPrice {
    return Intl.message(
      '상품 할인 가격을 입력해주세요',
      name: 'productRegEnterProductDPrice',
      desc: '',
      args: [],
    );
  }

  /// `할인 가격이 더 비쌉니다`
  String get productRegDProductExpensive {
    return Intl.message(
      '할인 가격이 더 비쌉니다',
      name: 'productRegDProductExpensive',
      desc: '',
      args: [],
    );
  }

  /// `상품 이미지를 선택해주세요`
  String get productRegSelectProductImage {
    return Intl.message(
      '상품 이미지를 선택해주세요',
      name: 'productRegSelectProductImage',
      desc: '',
      args: [],
    );
  }

  /// `가게에 최대 {name}개 상품을 등록할 수 있습니다`
  String productRegMaxProduct(Object name) {
    return Intl.message(
      '가게에 최대 $name개 상품을 등록할 수 있습니다',
      name: 'productRegMaxProduct',
      desc: '',
      args: [name],
    );
  }

  /// `사진 찍기`
  String get productRegTakePicture {
    return Intl.message(
      '사진 찍기',
      name: 'productRegTakePicture',
      desc: '',
      args: [],
    );
  }

  /// `앨범에서 선택`
  String get productRegSelFromAlbum {
    return Intl.message(
      '앨범에서 선택',
      name: 'productRegSelFromAlbum',
      desc: '',
      args: [],
    );
  }

  /// `동일한 상품 이름이 이미 등록되어 있습니다`
  String get productRegSameProdRegistered {
    return Intl.message(
      '동일한 상품 이름이 이미 등록되어 있습니다',
      name: 'productRegSameProdRegistered',
      desc: '',
      args: [],
    );
  }

  /// `1. 상품이름을 입력하세요\n2. 동일한 상품이름은 입력할 수 없습니다`
  String get productRegProductNameDesc {
    return Intl.message(
      '1. 상품이름을 입력하세요\n2. 동일한 상품이름은 입력할 수 없습니다',
      name: 'productRegProductNameDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. 할인 전 상품가격을 입력하세요`
  String get productRegProductPriceDesc {
    return Intl.message(
      '1. 할인 전 상품가격을 입력하세요',
      name: 'productRegProductPriceDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. 상품의 할인가격을 입력하세요\n2. 할인가격이 상품가격보다 클 수는 없습니다`
  String get productRegProductDPriceDesc {
    return Intl.message(
      '1. 상품의 할인가격을 입력하세요\n2. 할인가격이 상품가격보다 클 수는 없습니다',
      name: 'productRegProductDPriceDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. 상품을 소개하는 설명을 입력하세요`
  String get productRegProductDescDesc {
    return Intl.message(
      '1. 상품을 소개하는 설명을 입력하세요',
      name: 'productRegProductDescDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. 상품이미지를 사진으로 찍거나 앨범에서 선택해서 등록하세요`
  String get productRegProductImageDesc {
    return Intl.message(
      '1. 상품이미지를 사진으로 찍거나 앨범에서 선택해서 등록하세요',
      name: 'productRegProductImageDesc',
      desc: '',
      args: [],
    );
  }

  /// `사업자 등록증 입력`
  String get brcRegEnterBRCInfo {
    return Intl.message(
      '사업자 등록증 입력',
      name: 'brcRegEnterBRCInfo',
      desc: '',
      args: [],
    );
  }

  /// `사업자 등록증 이미지`
  String get brcRegBRCImage {
    return Intl.message(
      '사업자 등록증 이미지',
      name: 'brcRegBRCImage',
      desc: '',
      args: [],
    );
  }

  /// `사업자등록증`
  String get myStoreBusinessReg {
    return Intl.message(
      '사업자등록증',
      name: 'myStoreBusinessReg',
      desc: '',
      args: [],
    );
  }

  /// `등록 안됨`
  String get myStoreNotRegistered {
    return Intl.message(
      '등록 안됨',
      name: 'myStoreNotRegistered',
      desc: '',
      args: [],
    );
  }

  /// `상품을 삭제하시겠습니까?`
  String get myStoreDeleteProduct {
    return Intl.message(
      '상품을 삭제하시겠습니까?',
      name: 'myStoreDeleteProduct',
      desc: '',
      args: [],
    );
  }

  /// `사업자등록증을 삭제하시겠습니까?`
  String get myStoreDeleteBRC {
    return Intl.message(
      '사업자등록증을 삭제하시겠습니까?',
      name: 'myStoreDeleteBRC',
      desc: '',
      args: [],
    );
  }

  /// `가게를 삭제하시겠습니까?`
  String get myStoreDeleteStore {
    return Intl.message(
      '가게를 삭제하시겠습니까?',
      name: 'myStoreDeleteStore',
      desc: '',
      args: [],
    );
  }

  /// `게시를 중지하시겠습니까?`
  String get myStoreStopPosting {
    return Intl.message(
      '게시를 중지하시겠습니까?',
      name: 'myStoreStopPosting',
      desc: '',
      args: [],
    );
  }

  /// `가게가 게시 되지 않음`
  String get myStoreNotPosted {
    return Intl.message(
      '가게가 게시 되지 않음',
      name: 'myStoreNotPosted',
      desc: '',
      args: [],
    );
  }

  /// `가게 게시`
  String get myStorePosting {
    return Intl.message(
      '가게 게시',
      name: 'myStorePosting',
      desc: '',
      args: [],
    );
  }

  /// `등록된 상품이 없습니다`
  String get myStoreNoProduct {
    return Intl.message(
      '등록된 상품이 없습니다',
      name: 'myStoreNoProduct',
      desc: '',
      args: [],
    );
  }

  /// `상품을 등록하세요`
  String get myStoreRegisterProduct {
    return Intl.message(
      '상품을 등록하세요',
      name: 'myStoreRegisterProduct',
      desc: '',
      args: [],
    );
  }

  /// `나의 가게 게시 보기`
  String get myStoreViewMyPosting {
    return Intl.message(
      '나의 가게 게시 보기',
      name: 'myStoreViewMyPosting',
      desc: '',
      args: [],
    );
  }

  /// `나의 가게`
  String get myStoreMyStore {
    return Intl.message(
      '나의 가게',
      name: 'myStoreMyStore',
      desc: '',
      args: [],
    );
  }

  /// `사업자등록증을 선택하세요`
  String get myStoreSelectBRC {
    return Intl.message(
      '사업자등록증을 선택하세요',
      name: 'myStoreSelectBRC',
      desc: '',
      args: [],
    );
  }

  /// `가게가 잠겨진 상태로 게시가 불가능합니다`
  String get myStoreLocked {
    return Intl.message(
      '가게가 잠겨진 상태로 게시가 불가능합니다',
      name: 'myStoreLocked',
      desc: '',
      args: [],
    );
  }

  /// `가게가 잠겨진 상태로 변경되었습니다`
  String get myStoreToBeLocked {
    return Intl.message(
      '가게가 잠겨진 상태로 변경되었습니다',
      name: 'myStoreToBeLocked',
      desc: '',
      args: [],
    );
  }

  /// `상품 관리`
  String get storeMgmtProductMgmt {
    return Intl.message(
      '상품 관리',
      name: 'storeMgmtProductMgmt',
      desc: '',
      args: [],
    );
  }

  /// `상품관리`
  String get storeMgmtProductMgmt2 {
    return Intl.message(
      '상품관리',
      name: 'storeMgmtProductMgmt2',
      desc: '',
      args: [],
    );
  }

  /// `게시 관리`
  String get storeMgmtPostMgmt {
    return Intl.message(
      '게시 관리',
      name: 'storeMgmtPostMgmt',
      desc: '',
      args: [],
    );
  }

  /// `게시 확인`
  String get storeMgmtPostCheck {
    return Intl.message(
      '게시 확인',
      name: 'storeMgmtPostCheck',
      desc: '',
      args: [],
    );
  }

  /// `리뷰 관리`
  String get storeMgmtReviewMgmt {
    return Intl.message(
      '리뷰 관리',
      name: 'storeMgmtReviewMgmt',
      desc: '',
      args: [],
    );
  }

  /// `가게가 게시상태가 아닙니다`
  String get storeMgmtNotBeingPosted {
    return Intl.message(
      '가게가 게시상태가 아닙니다',
      name: 'storeMgmtNotBeingPosted',
      desc: '',
      args: [],
    );
  }

  /// `가게가 게시중입니다.`
  String get storeMgmtBeingPosted {
    return Intl.message(
      '가게가 게시중입니다.',
      name: 'storeMgmtBeingPosted',
      desc: '',
      args: [],
    );
  }

  /// `가게가 잠긴상태입니다.`
  String get storeMgmtBeingLocked {
    return Intl.message(
      '가게가 잠긴상태입니다.',
      name: 'storeMgmtBeingLocked',
      desc: '',
      args: [],
    );
  }

  /// `신고내역 보기`
  String get storeMgmtCheckReport {
    return Intl.message(
      '신고내역 보기',
      name: 'storeMgmtCheckReport',
      desc: '',
      args: [],
    );
  }

  /// `가게가 삭제된 상태입니다.`
  String get storeMgmtBeingDeleted {
    return Intl.message(
      '가게가 삭제된 상태입니다.',
      name: 'storeMgmtBeingDeleted',
      desc: '',
      args: [],
    );
  }

  /// `전체 상품`
  String get storeMgmtAllProduct {
    return Intl.message(
      '전체 상품',
      name: 'storeMgmtAllProduct',
      desc: '',
      args: [],
    );
  }

  /// `개`
  String get storeMgmtItemUnit {
    return Intl.message(
      '개',
      name: 'storeMgmtItemUnit',
      desc: '',
      args: [],
    );
  }

  /// `게시중인 상품`
  String get storeMgmtPostedProduct {
    return Intl.message(
      '게시중인 상품',
      name: 'storeMgmtPostedProduct',
      desc: '',
      args: [],
    );
  }

  /// `미답변 리뷰`
  String get storeMgmtUnAnsweredReview {
    return Intl.message(
      '미답변 리뷰',
      name: 'storeMgmtUnAnsweredReview',
      desc: '',
      args: [],
    );
  }

  /// `이관중인 가게는 삭제할 수 없습니다`
  String get storeMgmtTransferredNotDeleted {
    return Intl.message(
      '이관중인 가게는 삭제할 수 없습니다',
      name: 'storeMgmtTransferredNotDeleted',
      desc: '',
      args: [],
    );
  }

  /// `상품등록 후 이용가능합니다`
  String get storeMgmtAfterProdReg {
    return Intl.message(
      '상품등록 후 이용가능합니다',
      name: 'storeMgmtAfterProdReg',
      desc: '',
      args: [],
    );
  }

  /// `가게가 잠김상태에서는 게시할 수 없습니다`
  String get storeMgmtNotPostWhileLocked {
    return Intl.message(
      '가게가 잠김상태에서는 게시할 수 없습니다',
      name: 'storeMgmtNotPostWhileLocked',
      desc: '',
      args: [],
    );
  }

  /// `등록된 모든 데이타가 삭제됩니다`
  String get storeMgmtStoreDataDeleted {
    return Intl.message(
      '등록된 모든 데이타가 삭제됩니다',
      name: 'storeMgmtStoreDataDeleted',
      desc: '',
      args: [],
    );
  }

  /// `1. 사업자등록증을 사진으로 찍거나 앨범에서 선택해서 등록할 수 있습니다\n2. 현재는 사업자등록증을 등록하지 않아도 서비스 이용이 가능합니다\n3. 향 후, 서비스 개편 혹은 추가등에 따라 사업자등록증을 필수로 등록해야할 수 도 있습니다`
  String get myStoreBusinessRegDesc {
    return Intl.message(
      '1. 사업자등록증을 사진으로 찍거나 앨범에서 선택해서 등록할 수 있습니다\n2. 현재는 사업자등록증을 등록하지 않아도 서비스 이용이 가능합니다\n3. 향 후, 서비스 개편 혹은 추가등에 따라 사업자등록증을 필수로 등록해야할 수 도 있습니다',
      name: 'myStoreBusinessRegDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. 사용자가 가게의 할인 상품 정보를 볼 수 있는 상태입니다\n2. '게시확인' 메뉴를 눌러서 게시 내용을 확인하거나 게시를 중지할 수 있습니다`
  String get storeMgmtBeingPostedDesc {
    return Intl.message(
      '1. 사용자가 가게의 할인 상품 정보를 볼 수 있는 상태입니다\n2. \'게시확인\' 메뉴를 눌러서 게시 내용을 확인하거나 게시를 중지할 수 있습니다',
      name: 'storeMgmtBeingPostedDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. '게시시작' 메뉴를 눌러서 할인 상품의 게시를 시작하세요`
  String get storeMgmtNotBeingPostedDesc {
    return Intl.message(
      '1. \'게시시작\' 메뉴를 눌러서 할인 상품의 게시를 시작하세요',
      name: 'storeMgmtNotBeingPostedDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. 사용자들의 신고로 인해 가게가 잠김상태가 되었습니다\n2. '신고내역보기'를 눌러서 사용자들의 신고 내역을 확인할 수 있습니다\n3. 잠김상태에서는 가게를 게시할 수 없습니다\n4. 가게가 잠김상태가 되면 가게 게시내역과 신고 내용이 서버에 저장됩니다\n5. 잠김상태는 하루가 지나면 정상으로 변경되며 게시가 가능합니다`
  String get storeMgmtBeingLockedDesc {
    return Intl.message(
      '1. 사용자들의 신고로 인해 가게가 잠김상태가 되었습니다\n2. \'신고내역보기\'를 눌러서 사용자들의 신고 내역을 확인할 수 있습니다\n3. 잠김상태에서는 가게를 게시할 수 없습니다\n4. 가게가 잠김상태가 되면 가게 게시내역과 신고 내용이 서버에 저장됩니다\n5. 잠김상태는 하루가 지나면 정상으로 변경되며 게시가 가능합니다',
      name: 'storeMgmtBeingLockedDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. 삭제 상태에서는 가게를 게시할 수 없습니다`
  String get storeMgmtBeingDeletedDesc {
    return Intl.message(
      '1. 삭제 상태에서는 가게를 게시할 수 없습니다',
      name: 'storeMgmtBeingDeletedDesc',
      desc: '',
      args: [],
    );
  }

  /// `리뷰 관리`
  String get reviewMgmtReviewMgmt {
    return Intl.message(
      '리뷰 관리',
      name: 'reviewMgmtReviewMgmt',
      desc: '',
      args: [],
    );
  }

  /// `전체({name})`
  String reviewMgmtTotalReview(Object name) {
    return Intl.message(
      '전체($name)',
      name: 'reviewMgmtTotalReview',
      desc: '',
      args: [name],
    );
  }

  /// `미답변({name})`
  String reviewMgmtUnansweredReview(Object name) {
    return Intl.message(
      '미답변($name)',
      name: 'reviewMgmtUnansweredReview',
      desc: '',
      args: [name],
    );
  }

  /// `리뷰/평점사용이 활성화 되었습니다`
  String get reviewMgmtEnableReview {
    return Intl.message(
      '리뷰/평점사용이 활성화 되었습니다',
      name: 'reviewMgmtEnableReview',
      desc: '',
      args: [],
    );
  }

  /// `리뷰/평점사용이 비활성화 되었습니다`
  String get reviewMgmtDisableReview {
    return Intl.message(
      '리뷰/평점사용이 비활성화 되었습니다',
      name: 'reviewMgmtDisableReview',
      desc: '',
      args: [],
    );
  }

  /// `리뷰/평점 사용`
  String get reviewMgmtEnableReviewRating {
    return Intl.message(
      '리뷰/평점 사용',
      name: 'reviewMgmtEnableReviewRating',
      desc: '',
      args: [],
    );
  }

  /// `1. 리뷰/평점 사용이 비활성화되면 사용자들은 가게에 대한 리뷰와 평점을 작성할 수 없습니다\n2. 리뷰/평점 사용이 비활성화되면 가게의 리뷰와 평점이 비공개로 전환됩니다`
  String get reviewMgmtEnableReviewRatingDesc {
    return Intl.message(
      '1. 리뷰/평점 사용이 비활성화되면 사용자들은 가게에 대한 리뷰와 평점을 작성할 수 없습니다\n2. 리뷰/평점 사용이 비활성화되면 가게의 리뷰와 평점이 비공개로 전환됩니다',
      name: 'reviewMgmtEnableReviewRatingDesc',
      desc: '',
      args: [],
    );
  }

  /// `게시 정보`
  String get postRegPostInfo {
    return Intl.message(
      '게시 정보',
      name: 'postRegPostInfo',
      desc: '',
      args: [],
    );
  }

  /// `게시 정보 입력`
  String get postRegEnterPostInfo {
    return Intl.message(
      '게시 정보 입력',
      name: 'postRegEnterPostInfo',
      desc: '',
      args: [],
    );
  }

  /// `게시 정보 수정`
  String get postRegModifyPostInfo {
    return Intl.message(
      '게시 정보 수정',
      name: 'postRegModifyPostInfo',
      desc: '',
      args: [],
    );
  }

  /// `게시 위치를 선택하세요`
  String get postRegChoosePostLoc {
    return Intl.message(
      '게시 위치를 선택하세요',
      name: 'postRegChoosePostLoc',
      desc: '',
      args: [],
    );
  }

  /// `가게 주소에서 게시`
  String get postRegPostStoreAddr {
    return Intl.message(
      '가게 주소에서 게시',
      name: 'postRegPostStoreAddr',
      desc: '',
      args: [],
    );
  }

  /// `현재 위치에서 게시`
  String get postRegPostStoreCurrentLoc {
    return Intl.message(
      '현재 위치에서 게시',
      name: 'postRegPostStoreCurrentLoc',
      desc: '',
      args: [],
    );
  }

  /// `지도에서 선택한 위치에 게시`
  String get postRegPostStoreSelected {
    return Intl.message(
      '지도에서 선택한 위치에 게시',
      name: 'postRegPostStoreSelected',
      desc: '',
      args: [],
    );
  }

  /// `가게 게시 위치를 확인하세요`
  String get postRegCheckStorePostingLoc {
    return Intl.message(
      '가게 게시 위치를 확인하세요',
      name: 'postRegCheckStorePostingLoc',
      desc: '',
      args: [],
    );
  }

  /// `게시 시간 설정`
  String get postRegSetPostTime {
    return Intl.message(
      '게시 시간 설정',
      name: 'postRegSetPostTime',
      desc: '',
      args: [],
    );
  }

  /// `게시할 상품을 눌러서 선택하세요`
  String get postRegChooseProductPost {
    return Intl.message(
      '게시할 상품을 눌러서 선택하세요',
      name: 'postRegChooseProductPost',
      desc: '',
      args: [],
    );
  }

  /// `오른쪽 버튼을 클릭하셔서 게시할 위치를 지도상에서 확인해주세요`
  String get postRegCheckLocation {
    return Intl.message(
      '오른쪽 버튼을 클릭하셔서 게시할 위치를 지도상에서 확인해주세요',
      name: 'postRegCheckLocation',
      desc: '',
      args: [],
    );
  }

  /// `게시 시간을 선택하세요`
  String get postRegChoosePostTime {
    return Intl.message(
      '게시 시간을 선택하세요',
      name: 'postRegChoosePostTime',
      desc: '',
      args: [],
    );
  }

  /// `오른쪽 버튼을 클릭하셔서 게시 시간을 입력하세요`
  String get postRegEnterPostTime {
    return Intl.message(
      '오른쪽 버튼을 클릭하셔서 게시 시간을 입력하세요',
      name: 'postRegEnterPostTime',
      desc: '',
      args: [],
    );
  }

  /// `게시 시간은 최소 {name}분 이상입니다`
  String postRegPostMinTime(Object name) {
    return Intl.message(
      '게시 시간은 최소 $name분 이상입니다',
      name: 'postRegPostMinTime',
      desc: '',
      args: [name],
    );
  }

  /// `남아 있는 게시 시간이 없습니다`
  String get postRegNoPostingTime {
    return Intl.message(
      '남아 있는 게시 시간이 없습니다',
      name: 'postRegNoPostingTime',
      desc: '',
      args: [],
    );
  }

  /// `게시 가능한 시간이 아닙니다`
  String get postRegTimeNotPost {
    return Intl.message(
      '게시 가능한 시간이 아닙니다',
      name: 'postRegTimeNotPost',
      desc: '',
      args: [],
    );
  }

  /// `남아 있는 게시 시간`
  String get postRegRemainingPostingTime {
    return Intl.message(
      '남아 있는 게시 시간',
      name: 'postRegRemainingPostingTime',
      desc: '',
      args: [],
    );
  }

  /// `게시 가능한 시간`
  String get postRegAvailablePostingTime {
    return Intl.message(
      '게시 가능한 시간',
      name: 'postRegAvailablePostingTime',
      desc: '',
      args: [],
    );
  }

  /// `게시시작`
  String get postRegStartPost {
    return Intl.message(
      '게시시작',
      name: 'postRegStartPost',
      desc: '',
      args: [],
    );
  }

  /// `게시 상품`
  String get postRegPostProd {
    return Intl.message(
      '게시 상품',
      name: 'postRegPostProd',
      desc: '',
      args: [],
    );
  }

  /// `게시할 상품을 선택하세요`
  String get postRegSelectProdToPost {
    return Intl.message(
      '게시할 상품을 선택하세요',
      name: 'postRegSelectProdToPost',
      desc: '',
      args: [],
    );
  }

  /// `할인 시간`
  String get postRegDiscountTime {
    return Intl.message(
      '할인 시간',
      name: 'postRegDiscountTime',
      desc: '',
      args: [],
    );
  }

  /// `시간 설정`
  String get postRegTimeSetting {
    return Intl.message(
      '시간 설정',
      name: 'postRegTimeSetting',
      desc: '',
      args: [],
    );
  }

  /// `게시 시간`
  String get postRegPostingTime {
    return Intl.message(
      '게시 시간',
      name: 'postRegPostingTime',
      desc: '',
      args: [],
    );
  }

  /// `정상적으로 게시를 시작했습니다`
  String get postRegStartPostNormally {
    return Intl.message(
      '정상적으로 게시를 시작했습니다',
      name: 'postRegStartPostNormally',
      desc: '',
      args: [],
    );
  }

  /// `게시 위치`
  String get postRegPostLoc {
    return Intl.message(
      '게시 위치',
      name: 'postRegPostLoc',
      desc: '',
      args: [],
    );
  }

  /// `1. 등록된 상품에서 '게시'라는 항목을 눌러주세요\n2. 게시라고 선택된 상품만 사용자들이 볼 수 있습니다`
  String get postRegPostProdDesc {
    return Intl.message(
      '1. 등록된 상품에서 \'게시\'라는 항목을 눌러주세요\n2. 게시라고 선택된 상품만 사용자들이 볼 수 있습니다',
      name: 'postRegPostProdDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. '시간설정'을 눌러서 할인 상품을 게시할 시간을 선택하세요\n2. 최소 20분부터 최대 3시간까지 선택할 수 있습니다`
  String get postRegPostingTimeDesc {
    return Intl.message(
      '1. \'시간설정\'을 눌러서 할인 상품을 게시할 시간을 선택하세요\n2. 최소 20분부터 최대 3시간까지 선택할 수 있습니다',
      name: 'postRegPostingTimeDesc',
      desc: '',
      args: [],
    );
  }

  /// `1. '위치확인'을 눌러서 할인 상품을 게시할 위치를 확인하세요\n2. 현재는 등록된 가게주소에서만 게시할 수 있습니다\n3. 향 후에는 다양한 위치에서 할인 상품을 게시할 수 있도록 할 예정입니다`
  String get postRegPostLocDesc {
    return Intl.message(
      '1. \'위치확인\'을 눌러서 할인 상품을 게시할 위치를 확인하세요\n2. 현재는 등록된 가게주소에서만 게시할 수 있습니다\n3. 향 후에는 다양한 위치에서 할인 상품을 게시할 수 있도록 할 예정입니다',
      name: 'postRegPostLocDesc',
      desc: '',
      args: [],
    );
  }

  /// `가게 이관`
  String get storeTransferStoreTransfer {
    return Intl.message(
      '가게 이관',
      name: 'storeTransferStoreTransfer',
      desc: '',
      args: [],
    );
  }

  /// `가게 인수`
  String get storeTransferStoreTakeOver {
    return Intl.message(
      '가게 인수',
      name: 'storeTransferStoreTakeOver',
      desc: '',
      args: [],
    );
  }

  /// `정상적으로 가게를 이관받았습니다`
  String get storeTransferTransferSuccess {
    return Intl.message(
      '정상적으로 가게를 이관받았습니다',
      name: 'storeTransferTransferSuccess',
      desc: '',
      args: [],
    );
  }

  /// `이메일을 올바르게 입력해주세요`
  String get storeTransferEnterEmailCorrectly {
    return Intl.message(
      '이메일을 올바르게 입력해주세요',
      name: 'storeTransferEnterEmailCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `이관하기`
  String get storeTransferTransfer {
    return Intl.message(
      '이관하기',
      name: 'storeTransferTransfer',
      desc: '',
      args: [],
    );
  }

  /// `해당 가게의 관리자 권한을 받아오시겠습니까?`
  String get storeTransferObtainStore {
    return Intl.message(
      '해당 가게의 관리자 권한을 받아오시겠습니까?',
      name: 'storeTransferObtainStore',
      desc: '',
      args: [],
    );
  }

  /// `권한 받기`
  String get storeTransferGetPermission {
    return Intl.message(
      '권한 받기',
      name: 'storeTransferGetPermission',
      desc: '',
      args: [],
    );
  }

  /// `권한 거절`
  String get storeTransferDenyPermission {
    return Intl.message(
      '권한 거절',
      name: 'storeTransferDenyPermission',
      desc: '',
      args: [],
    );
  }

  /// `정상적으로 가게를 이관을 요청했습니다`
  String get storeTransferRequestTransfer {
    return Intl.message(
      '정상적으로 가게를 이관을 요청했습니다',
      name: 'storeTransferRequestTransfer',
      desc: '',
      args: [],
    );
  }

  /// `가게 권한 이전을 거부하시겠습니까?`
  String get storeTransferRejectTransfer {
    return Intl.message(
      '가게 권한 이전을 거부하시겠습니까?',
      name: 'storeTransferRejectTransfer',
      desc: '',
      args: [],
    );
  }

  /// `가게 권한 이전을 승인하시겠습니까?`
  String get storeTransferAcceptTransfer {
    return Intl.message(
      '가게 권한 이전을 승인하시겠습니까?',
      name: 'storeTransferAcceptTransfer',
      desc: '',
      args: [],
    );
  }

  /// `가게에 등록된 상품이 없습니다`
  String get productListNoProduct {
    return Intl.message(
      '가게에 등록된 상품이 없습니다',
      name: 'productListNoProduct',
      desc: '',
      args: [],
    );
  }

  /// `{name}의 할인 게시글을 신고하는 이유를 선택해주세요.`
  String reportSelectReason(Object name) {
    return Intl.message(
      '$name의 할인 게시글을 신고하는 이유를 선택해주세요.',
      name: 'reportSelectReason',
      desc: '',
      args: [name],
    );
  }

  /// `부적절한 이미지를 사용했어요`
  String get reportInappropriateProductImage {
    return Intl.message(
      '부적절한 이미지를 사용했어요',
      name: 'reportInappropriateProductImage',
      desc: '',
      args: [],
    );
  }

  /// `가격이 실제 판매 가격이 아니에요`
  String get reportInappropriatePrice {
    return Intl.message(
      '가격이 실제 판매 가격이 아니에요',
      name: 'reportInappropriatePrice',
      desc: '',
      args: [],
    );
  }

  /// `가게의 위치가 실제 위치와 달라요`
  String get reportInappropriateStoreLocation {
    return Intl.message(
      '가게의 위치가 실제 위치와 달라요',
      name: 'reportInappropriateStoreLocation',
      desc: '',
      args: [],
    );
  }

  /// `가게의 이름이 실제 이름과 달라요`
  String get reportInappropriateStoreName {
    return Intl.message(
      '가게의 이름이 실제 이름과 달라요',
      name: 'reportInappropriateStoreName',
      desc: '',
      args: [],
    );
  }

  /// `가게의 전화번화가 실제 전화번호와 달라요`
  String get reportInappropriatePhoneNumber {
    return Intl.message(
      '가게의 전화번화가 실제 전화번호와 달라요',
      name: 'reportInappropriatePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `가게의 주소가 실제 주소와 달라요`
  String get reportInappropriateAddress {
    return Intl.message(
      '가게의 주소가 실제 주소와 달라요',
      name: 'reportInappropriateAddress',
      desc: '',
      args: [],
    );
  }

  /// `가게의 사업자등록번호가 실제와 달라요`
  String get reportInappropriateBusinessRegId {
    return Intl.message(
      '가게의 사업자등록번호가 실제와 달라요',
      name: 'reportInappropriateBusinessRegId',
      desc: '',
      args: [],
    );
  }

  /// `00*-0*-****0은 사업자등록전이라 임시번호이며 정상입니다`
  String get reportInappropriateBusinessRegIdSub {
    return Intl.message(
      '00*-0*-****0은 사업자등록전이라 임시번호이며 정상입니다',
      name: 'reportInappropriateBusinessRegIdSub',
      desc: '',
      args: [],
    );
  }

  /// `기타 사유`
  String get reportETC {
    return Intl.message(
      '기타 사유',
      name: 'reportETC',
      desc: '',
      args: [],
    );
  }

  /// `신고하시겠습니까?`
  String get reportLikeToReport {
    return Intl.message(
      '신고하시겠습니까?',
      name: 'reportLikeToReport',
      desc: '',
      args: [],
    );
  }

  /// `신고되었습니다`
  String get reportBeReported {
    return Intl.message(
      '신고되었습니다',
      name: 'reportBeReported',
      desc: '',
      args: [],
    );
  }

  /// `신고내역`
  String get reportReportDetail {
    return Intl.message(
      '신고내역',
      name: 'reportReportDetail',
      desc: '',
      args: [],
    );
  }

  /// `사유 선택`
  String get reportChooseReason {
    return Intl.message(
      '사유 선택',
      name: 'reportChooseReason',
      desc: '',
      args: [],
    );
  }

  /// `여러 사유에 해당될 경우, 대표적인 사유 1개를 \n선택해주세요`
  String get reportSelectOneReason {
    return Intl.message(
      '여러 사유에 해당될 경우, 대표적인 사유 1개를 \n선택해주세요',
      name: 'reportSelectOneReason',
      desc: '',
      args: [],
    );
  }

  /// `내 근처`
  String get introNearMe {
    return Intl.message(
      '내 근처',
      name: 'introNearMe',
      desc: '',
      args: [],
    );
  }

  /// `할인중인 가게`
  String get introDiscountStore {
    return Intl.message(
      '할인중인 가게',
      name: 'introDiscountStore',
      desc: '',
      args: [],
    );
  }

  /// `찾기`
  String get introFind {
    return Intl.message(
      '찾기',
      name: 'introFind',
      desc: '',
      args: [],
    );
  }

  /// `현재 내 주변에서 할인을 진행하고 있는\n가게들을 만나보세요.`
  String get introMeetStore {
    return Intl.message(
      '현재 내 주변에서 할인을 진행하고 있는\n가게들을 만나보세요.',
      name: 'introMeetStore',
      desc: '',
      args: [],
    );
  }

  /// `다양한 업종`
  String get introVariousCategory {
    return Intl.message(
      '다양한 업종',
      name: 'introVariousCategory',
      desc: '',
      args: [],
    );
  }

  /// `살펴보기`
  String get introTakeLook {
    return Intl.message(
      '살펴보기',
      name: 'introTakeLook',
      desc: '',
      args: [],
    );
  }

  /// `음식부터 다양한 잡화까지\n필요한 서비스를 찾아보세요.`
  String get introFindService {
    return Intl.message(
      '음식부터 다양한 잡화까지\n필요한 서비스를 찾아보세요.',
      name: 'introFindService',
      desc: '',
      args: [],
    );
  }

  /// `쉽고 편하게`
  String get introEasyComfortable {
    return Intl.message(
      '쉽고 편하게',
      name: 'introEasyComfortable',
      desc: '',
      args: [],
    );
  }

  /// `사용하기`
  String get introUse {
    return Intl.message(
      '사용하기',
      name: 'introUse',
      desc: '',
      args: [],
    );
  }

  /// `손 쉽게 원하는 정보를 찾고\n바로 가게를 방문해보세요.`
  String get introVisitStore {
    return Intl.message(
      '손 쉽게 원하는 정보를 찾고\n바로 가게를 방문해보세요.',
      name: 'introVisitStore',
      desc: '',
      args: [],
    );
  }

  /// `주변 고객`
  String get introNearbyCustomer {
    return Intl.message(
      '주변 고객',
      name: 'introNearbyCustomer',
      desc: '',
      args: [],
    );
  }

  /// `에게`
  String get introTo {
    return Intl.message(
      '에게',
      name: 'introTo',
      desc: '',
      args: [],
    );
  }

  /// `내 가게 홍보하기`
  String get introPromote {
    return Intl.message(
      '내 가게 홍보하기',
      name: 'introPromote',
      desc: '',
      args: [],
    );
  }

  /// `근처에 있는 고객에게\n가게의 할인 소식을 알려보세요.`
  String get introNotifyDiscount {
    return Intl.message(
      '근처에 있는 고객에게\n가게의 할인 소식을 알려보세요.',
      name: 'introNotifyDiscount',
      desc: '',
      args: [],
    );
  }

  /// `매장 방문`
  String get introStoreVisit {
    return Intl.message(
      '매장 방문',
      name: 'introStoreVisit',
      desc: '',
      args: [],
    );
  }

  /// `은`
  String get introIs {
    return Intl.message(
      '은',
      name: 'introIs',
      desc: '',
      args: [],
    );
  }

  /// `곧 매출`
  String get introSales {
    return Intl.message(
      '곧 매출',
      name: 'introSales',
      desc: '',
      args: [],
    );
  }

  /// `매력적인 혜택으로\n고객 방문을 유도해보세요.`
  String get introEncourageCustomers {
    return Intl.message(
      '매력적인 혜택으로\n고객 방문을 유도해보세요.',
      name: 'introEncourageCustomers',
      desc: '',
      args: [],
    );
  }

  /// `영업중에도 쉽고 빠르게\n정보를 업로드할 수 있습니다.`
  String get introDuringBusiness {
    return Intl.message(
      '영업중에도 쉽고 빠르게\n정보를 업로드할 수 있습니다.',
      name: 'introDuringBusiness',
      desc: '',
      args: [],
    );
  }

  /// `두 글자 이상 입력하거나\n다른 키워드로 검색해 보세요`
  String get searchEnterDifferentKeyword {
    return Intl.message(
      '두 글자 이상 입력하거나\n다른 키워드로 검색해 보세요',
      name: 'searchEnterDifferentKeyword',
      desc: '',
      args: [],
    );
  }

  /// `검색어를 입력하세요`
  String get searchEnterSearchWord {
    return Intl.message(
      '검색어를 입력하세요',
      name: 'searchEnterSearchWord',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ko', countryCode: 'KR'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
