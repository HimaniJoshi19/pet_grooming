import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:pet_grooming/utils/utility.dart';
import 'package:pet_grooming/data/network/interceptors/app_version_interceptor.dart';
import 'package:pet_grooming/data/network/interceptors/os_type_interceptor.dart';

class DioFactory {
  static const Duration _defaultMaxAge = Duration(hours: 1);
  static const Duration _defaultMaxStale = Duration(days: 1);

  /// create
  static Dio create() {
    final BaseOptions options = BaseOptions(
      contentType: 'application/json',
      //headers: Map<String, dynamic>.from(Config.httpHeaders),
    );
    final Dio dio = Dio(options);

    final CacheConfig cacheConfig = CacheConfig(
      defaultMaxAge: _defaultMaxAge,
      defaultMaxStale: _defaultMaxStale,
      skipDiskCache: true,
    );

    final DioCacheManager dioCacheManager = DioCacheManager(cacheConfig);
    dio.interceptors.add(dioCacheManager.interceptor as Interceptor);
    dio.interceptors.add(AppVersionInterceptor());
    dio.interceptors.add(OSTypeInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (Object obj) => Utility.showLog('$obj'),
      ),
    );
    return dio;
  }
}
