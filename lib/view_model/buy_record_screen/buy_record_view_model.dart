import 'package:get/get.dart';
import 'package:pill_on_phone/entity/buy_record/buy_record_brief_state.dart';
import 'package:pill_on_phone/type/e_buy.dart';

class BuyRecordViewModel extends GetxController {
  late final RxList<BuyRecordBriefState> _briefs;

  List<BuyRecordBriefState> get briefs => _briefs;

  @override
  void onInit() {
    super.onInit();

    _briefs = <BuyRecordBriefState>[].obs;

    _fetchBriefs();
  }

  void _fetchBriefs() {
    _briefs.addAll(
      [
        BuyRecordBriefState(
          id: 5,
          status: EBuy.buyComplete,
          isCompletedReview: false,
          pharmacyName: '약알 약국',
          totalPrice: 100000,
          createdAt: DateTime.now(),
        ),
        BuyRecordBriefState(
          id: 4,
          status: EBuy.manufacturing,
          pharmacyName: '약알 약국',
          isCompletedReview: false,
          totalPrice: 90000,
          createdAt: DateTime.now(),
        ),
        BuyRecordBriefState(
          id: 3,
          status: EBuy.visitWaiting,
          isCompletedReview: false,
          pharmacyName: '약알 약국',
          totalPrice: 110000,
          createdAt: DateTime.now(),
        ),
        BuyRecordBriefState(
          id: 2,
          status: EBuy.visitComplete,
          isCompletedReview: false,
          pharmacyName: '약알 약국',
          totalPrice: 120000,
          createdAt: DateTime.now(),
        ),
        BuyRecordBriefState(
          id: 1,
          status: EBuy.visitComplete,
          isCompletedReview: true,
          pharmacyName: '약알 약국',
          totalPrice: 180000,
          createdAt: DateTime.now(),
        ),
      ],
    );
  }
}
