import 'package:get/get.dart';
import 'package:pill_on_phone/config/app_routes.dart';
import 'package:pill_on_phone/view/buy_record/buy_record_screen.dart';
import 'package:pill_on_phone/view/consultation/consultation_screen.dart';
import 'package:pill_on_phone/view/pharmacy_detail/pharmacy_detail_screen.dart';
import 'package:pill_on_phone/view/review/review_screen.dart';
import 'package:pill_on_phone/view/root/root_screen.dart';
import 'package:pill_on_phone/view/search_health_functional_food/search_health_functional_food_screen.dart';
import 'package:pill_on_phone/view_model/buy_record_screen/buy_record_binding.dart';
import 'package:pill_on_phone/view_model/chatting/chatting_binding.dart';
import 'package:pill_on_phone/view_model/consultation/consultation_binding.dart';
import 'package:pill_on_phone/view_model/pharmacy/pharmacy_binding.dart';
import 'package:pill_on_phone/view_model/pharmacy_detail/pharmacy_detail_binding.dart';
import 'package:pill_on_phone/view_model/review/review_binding.dart';
import 'package:pill_on_phone/view_model/root/root_binding.dart';
import 'package:pill_on_phone/view_model/search_health_functional_food/search_health_functional_food_binding.dart';
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
    GetPage(
      name: AppRoutes.PHARMACY_DETAIL,
      page: () => const PharmacyDetailScreen(),
      binding: PharmacyDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.REVIEW,
      page: () => const ReviewScreen(),
      binding: ReviewBinding(),
    ),
    GetPage(
      name: AppRoutes.CONSULTATION,
      page: () => const ConsultationScreen(),
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: AppRoutes.SEARCH_HEALTH_FUNCTION_FOOD,
      page: () => const SearchHealthFunctionalFoodScreen(),
      binding: SearchHealthFunctionalFoodBinding(),
    ),
    GetPage(
      name: AppRoutes.BUY_RECORD,
      page: () => const BuyRecordScreen(),
      binding: BuyRecordBinding(),
    ),
  ];
}
