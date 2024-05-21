import 'package:get/get.dart';
import 'package:pill_on_phone/config/app_routes.dart';
import 'package:pill_on_phone/view/root/root_screen.dart';
import 'package:pill_on_phone/view_model/chatting/chatting_binding.dart';
import 'package:pill_on_phone/view_model/pharmacy/pharmacy_binding.dart';
import 'package:pill_on_phone/view_model/root/root_binding.dart';
import 'package:pill_on_phone/view_model/see_more/see_more_binding.dart';

abstract class AppPages {
  static List<GetPage> data = [
    GetPage(
      name: AppRoutes.ROOT,
      page: () => const RootScreen(),
      bindings: [
        RootBinding(),
        PharmacyBinding(),
        ChattingBinding(),
        SeeMoreBinding(),
      ],
    ),
  ];
}
