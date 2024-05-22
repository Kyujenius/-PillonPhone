import 'package:dio/dio.dart';
import 'package:pill_on_phone/utility/log_util.dart';
import '../Base/http_util.dart';

class ChattingProvider {
  static final Dio dio = HttpUtil().dio;

  Future<List<dynamic>> getChatListByUserId(int userId) async {
    try {
      final response = await dio.get(
        "/chatList",
        //바뀔 수 있음
        queryParameters: {
          "userId" : userId
        },
      );

      if (response.statusCode == 200) {
        return response.data["data"];
      } else {
        return throw Exception(
            "API 요청이 실패했습니다. - ${response.data["error"]["code"]} ${response.data["error"]["message"]}");
      }
    } catch (e) {
      LogUtil.error("오류 발생: $e");
      rethrow; // 현재 예외를 다시 던져서 상위 호출자에게 전달
    }
  }

}








//------------------------------------------
