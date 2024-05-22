import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pill_on_phone/utility/log_util.dart';

class HttpUtil {

  late Dio dio;
  late Dio authDio;

  factory HttpUtil() => _instance;


  static final _baseOption = BaseOptions(
    baseUrl: '${dotenv.env['REST_API_HOST']}',
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 30000),
    contentType: 'application/json; charset=utf-8',
    responseType: ResponseType.json,
    headers: <String, dynamic>{},
  );

  static final HttpUtil _instance = HttpUtil._configDio();

  late Dio _reRequestDio;

  HttpUtil._default();

  factory HttpUtil._configDio() {
    final httpUtil = HttpUtil._default();

    httpUtil.dio = Dio(_baseOption);
    httpUtil.dio.interceptors
      ..clear()
      ..add(
        InterceptorsWrapper(
          onRequest: httpUtil._onRequest,
          onResponse: httpUtil._onResponse,
          onError: httpUtil._onError,
        ),
      );

    httpUtil._reRequestDio = Dio(_baseOption);
    httpUtil._reRequestDio.interceptors
      ..clear()
      ..add(
        InterceptorsWrapper(
          onRequest: httpUtil._onRequest,
          onResponse: httpUtil._onResponse,
          onError: httpUtil._onError,
        ),
      );
    return httpUtil;
  }


  void _onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    LogUtil.info("🛫 [${options.method}] ${options.path} | START");
    return handler.next(options);
  }


  void _onResponse(
      Response<dynamic> response,
      ResponseInterceptorHandler handler,
      ) async {
    LogUtil.info(
      "🛬 [${response.requestOptions.method}] ${response.requestOptions.path} | SUCCESS (${response.statusCode})",
    );

    return handler.next(response);
  }

  void _onError(
      DioException error,
      ErrorInterceptorHandler handler,
      ) {
    LogUtil.error(
      "🚨 [${error.requestOptions.method}] ${error.requestOptions.path} | ERROR : ${error.response!.data != null ? error.response!.data["error"]["message"] : error.message}",
    );

    return handler.next(error);
  }



}
