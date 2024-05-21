import 'package:get/get.dart';
import 'package:pill_on_phone/config/app_routes.dart';
import 'package:pill_on_phone/view/root/root_screen.dart';
import 'package:pill_on_phone/view_model/root/root_binding.dart';

abstract class AppPages {
  static List<GetPage> data = [
    GetPage(
      name: AppRoutes.ROOT,
      page: () => const RootScreen(),
      bindings: [
        RootBinding(),
      ],
    ),
  ];
}
