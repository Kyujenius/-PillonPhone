import 'package:get/get.dart';
import 'package:pill_on_phone/entity/buy_record/buy_record_detail_article_state.dart';
import 'package:pill_on_phone/entity/buy_record/buy_record_detail_information_state.dart';
import 'package:pill_on_phone/type/e_buy.dart';

class BuyRecordDetailViewModel extends GetxController {
  late final int _id;

  late final Rx<BuyRecordDetailInformationState> _information;
  late final RxList<BuyRecordDetailArticleState> _articles;

  BuyRecordDetailInformationState get information => _information.value;
  List<BuyRecordDetailArticleState> get articles => _articles;

  @override
  void onInit() {
    super.onInit();

    _id = Get.arguments['id'];

    _information = BuyRecordDetailInformationState.initial().obs;
    _articles = <BuyRecordDetailArticleState>[].obs;

    _fetchInformation();
    _fetchArticles();
  }

  void _fetchInformation() {
    _information.value = BuyRecordDetailInformationState(
      id: _id,
      status: EBuy.visitWaiting,
      orderNumber: '2023101211111111',
      orderName: '김철수',
      totalPrice: 100200,
      createdAt: DateTime.now(),
    );
  }

  void _fetchArticles() {
    _articles.addAll(
      [
        const BuyRecordDetailArticleState(
          id: 1,
          itemId: 1,
          itemName: '아스피린',
          itemManufacturer: '아스피린 제조사',
          itemImageUrl:
              'https://assets2.cre.ma/p/manfidence-cafe24-com/reviews/00/00/04/37/55/image1/portrait_816a4747de9c4bbf.jpg',
          itemPrice: 10000,
        ),
        const BuyRecordDetailArticleState(
          id: 2,
          itemId: 2,
          itemName: '타이레놀',
          itemManufacturer: '타이레놀 제조사',
          itemImageUrl:
              'https://assets2.cre.ma/p/manfidence-cafe24-com/reviews/00/00/04/37/55/image1/portrait_816a4747de9c4bbf.jpg',
          itemPrice: 20000,
        ),
        const BuyRecordDetailArticleState(
          id: 2,
          itemId: 2,
          itemName: '타이레놀',
          itemManufacturer: '타이레놀 제조사',
          itemImageUrl:
              'https://assets2.cre.ma/p/manfidence-cafe24-com/reviews/00/00/04/37/55/image1/portrait_816a4747de9c4bbf.jpg',
          itemPrice: 20000,
        ),
        const BuyRecordDetailArticleState(
          id: 2,
          itemId: 2,
          itemName: '타이레놀',
          itemManufacturer: '타이레놀 제조사',
          itemImageUrl:
              'https://assets2.cre.ma/p/manfidence-cafe24-com/reviews/00/00/04/37/55/image1/portrait_816a4747de9c4bbf.jpg',
          itemPrice: 20000,
        ),
        const BuyRecordDetailArticleState(
          id: 2,
          itemId: 2,
          itemName: '타이레놀',
          itemManufacturer: '타이레놀 제조사',
          itemImageUrl:
              'https://assets2.cre.ma/p/manfidence-cafe24-com/reviews/00/00/04/37/55/image1/portrait_816a4747de9c4bbf.jpg',
          itemPrice: 20000,
        ),
        const BuyRecordDetailArticleState(
          id: 2,
          itemId: 2,
          itemName: '타이레놀',
          itemManufacturer: '타이레놀 제조사',
          itemImageUrl:
              'https://assets2.cre.ma/p/manfidence-cafe24-com/reviews/00/00/04/37/55/image1/portrait_816a4747de9c4bbf.jpg',
          itemPrice: 20000,
        ),
      ],
    );
  }
}
