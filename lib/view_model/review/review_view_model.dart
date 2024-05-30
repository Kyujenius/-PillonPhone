import 'package:get/get.dart';
import 'package:pill_on_phone/entity/review/review_information_state.dart';
import 'package:pill_on_phone/entity/review/review_state.dart';

class ReviewViewModel extends GetxController {
  late final Rx<ReviewInformationState> _information;
  late final RxList<ReviewState> _reviews;

  ReviewInformationState get information => _information.value;
  List<ReviewState> get reviews => _reviews;

  @override
  void onInit() {
    super.onInit();

    _information = ReviewInformationState.initial().obs;
    _reviews = <ReviewState>[].obs;

    _fetchInformation();
    _fetchReviews();
  }

  void _fetchInformation() {
    _information.value = ReviewInformationState(
      fiveCount: 3,
      fourCount: 2,
      threeCount: 1,
      twoCount: 5,
      oneCount: 8,
    );
  }

  void _fetchReviews() {
    _reviews.addAll(
      [
        ReviewState(
          id: 1,
          score: 3,
          createdBy: '약알약알',
          createdAt: '2024-12-12',
          content: '정말 친절했어요! 구매도 추천 잘 해주시고 완전 대박!!',
        ),
        ReviewState(
          id: 2,
          score: 4,
          createdBy: '약알약알',
          createdAt: '2024-12-12',
          content: '정말 친절했어요! 구매도 추천 잘 해주시고 완전 대박!!',
        ),
        ReviewState(
          id: 3,
          score: 5,
          createdBy: '약알약알',
          createdAt: '2024-12-12',
          content: '정말 친절했어요! 구매도 추천 잘 해주시고 완전 대박!!',
        ),
        ReviewState(
          id: 4,
          score: 2,
          createdBy: '약알약알',
          createdAt: '2024-12-12',
          content: '정말 친절했어요! 구매도 추천 잘 해주시고 완전 대박!!',
        ),
        ReviewState(
          id: 5,
          score: 1,
          createdBy: '약알약알',
          createdAt: '2024-12-12',
          content: '정말 친절했어요! 구매도 추천 잘 해주시고 완전 대박!!',
        ),
        ReviewState(
          id: 6,
          score: 3,
          createdBy: '약알약알',
          createdAt: '2024-12-12',
          content: '정말 친절했어요! 구매도 추천 잘 해주시고 완전 대박!!',
        ),
        ReviewState(
          id: 7,
          score: 4,
          createdBy: '약알약알',
          createdAt: '2024-12-12',
          content: '정말 친절했어요! 구매도 추천 잘 해주시고 완전 대박!!',
        ),
        ReviewState(
          id: 8,
          score: 5,
          createdBy: '약알약알',
          createdAt: '2024-12-12',
          content: '정말 친절했어요! 구매도 추천 잘 해주시고 완전 대박!!',
        ),
        ReviewState(
          id: 9,
          score: 2,
          createdBy: '약알약알',
          createdAt: '2024-12-12',
          content: '정말 친절했어요! 구매도 추천 잘 해주시고 완전 대박!!',
        ),
        ReviewState(
          id: 10,
          score: 1,
          createdBy: '약알약알',
          createdAt: '2024-12-12',
          content: '정말 친절했어요! 구매도 추천 잘 해주시고 완전 대박!!',
        ),
      ],
    );
  }
}
