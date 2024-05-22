import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect/connect.dart';

import '../../utility/log_util.dart';

abstract class BaseConnect extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient
      ..baseUrl = dotenv.env['REST_API_HOST']
      ..defaultContentType = "application/json"
      ..timeout = const Duration(seconds: 30)
      ..addRequestModifier<dynamic>((request) {
        LogUtil.info("🛫 [${request.method}] ${request.url} | START");
        return request;
      })
      ..addResponseModifier((request, Response response) {
        if (response.status.hasError) {
          LogUtil.error(
            "🚨 [${request.method}] ${request.url} | FAILED (${response.statusCode})",
          );
        } else {
          LogUtil.info(
            "🛬 [${request.method}] ${request.url} | SUCCESS (${response.statusCode})",
          );
            LogUtil.info(
            "🛬 [${request.method}] ${request.url} | BODY ${response.body}",
          );
        }
        return response;
      });
  }
}
