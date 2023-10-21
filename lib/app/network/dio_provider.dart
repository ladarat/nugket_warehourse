import 'package:dio/dio.dart';
import '/app/network/request_headers.dart';
import '/flavors/build_config.dart';

class DioProvider {
  static final String baseUrl = BuildConfig.instance.config.baseUrl;

  static Dio? _instance;

  static const int _maxLineWidth = 90;

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: Duration(microseconds: 6000),
    receiveTimeout: Duration(microseconds: 6000),
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);

      return _instance!;
    } else {
      _instance!.interceptors.clear();

      return _instance!;
    }
  }

  ///returns a Dio client with Access token in header
  static Dio get tokenClient {
    _addInterceptors();

    return _instance!;
  }

  ///returns a Dio client with Access token in header
  ///Also adds a token refresh interceptor which retry the request when it's unauthorized
  static Dio get dioWithHeaderToken {
    _addInterceptors();

    return _instance!;
  }

  static _addInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(RequestHeaderInterceptor());
  }

  DioProvider.setContentTypeApplicationJson() {
    _instance?.options.contentType = "application/json";
  }
}
