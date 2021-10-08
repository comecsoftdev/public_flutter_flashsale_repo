import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioHelper {
  static Dio? dio;
  static DioCacheManager? dioCacheManager;
  static final baseUrl = env['FS_BASE_URL'];

  static Dio? getDio() {
    if (null == dio) {
      dio = Dio(BaseOptions(
        baseUrl: baseUrl!,
        contentType: "application/x-www-form-urlencoded; charset=utf-8"))
      //..httpClientAdapter = _getHttpClientAdapter()
      ..interceptors.add(getCacheManager()!.interceptor);
    }
    return dio;
  }

  static DioCacheManager? getCacheManager() {
    if (null == dioCacheManager) {
      dioCacheManager =
          DioCacheManager(CacheConfig(baseUrl: baseUrl));
    }
    return dioCacheManager;
  }

  static DefaultHttpClientAdapter _getHttpClientAdapter() {
    DefaultHttpClientAdapter httpClientAdapter;
    httpClientAdapter = DefaultHttpClientAdapter();
    httpClientAdapter.onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
    return httpClientAdapter;
  }
}