enum EPharmacyCriteria {
  all(
    koName: "전체",
    enName: "all",
  ),
  starScore(
    koName: "별점순",
    enName: "starScore",
  ),
  reviewCount(
    koName: "리뷰순",
    enName: "reviewCount",
  ),
  counseling(
    koName: "상담약국",
    enName: "counseling",
  ),
  ;

  final String koName;
  final String enName;

  const EPharmacyCriteria({
    required this.koName,
    required this.enName,
  });
}
