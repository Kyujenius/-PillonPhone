import 'package:get/get.dart';
import 'package:pill_on_phone/view_model/search_health_functional_food/search_health_functional_food_view_model.dart';

class SearchHealthFunctionalFoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchHealthFunctionalFoodViewModel>(
        () => SearchHealthFunctionalFoodViewModel());
  }
}
