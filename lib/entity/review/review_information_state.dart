class ReviewInformationState {
  final int fiveCount;
  final int fourCount;
  final int threeCount;
  final int twoCount;
  final int oneCount;

  double get score {
    int cnt = fiveCount + fourCount + threeCount + twoCount + oneCount;

    return (fiveCount * 5 +
            fourCount * 4 +
            threeCount * 3 +
            twoCount * 2 +
            oneCount) /
        cnt;
  }

  int get totalCount {
    return fiveCount + fourCount + threeCount + twoCount + oneCount;
  }

  double get fiveProgress {
    final max = [fiveCount, fourCount, threeCount, twoCount, oneCount]
        .reduce((value, element) => value > element ? value : element);

    if (max == 0) {
      return 0;
    }

    return fiveCount / max;
  }

  double get fourProgress {
    final max = [fiveCount, fourCount, threeCount, twoCount, oneCount]
        .reduce((value, element) => value > element ? value : element);

    if (max == 0) {
      return 0;
    }

    return fourCount / max;
  }

  double get threeProgress {
    final max = [fiveCount, fourCount, threeCount, twoCount, oneCount]
        .reduce((value, element) => value > element ? value : element);

    if (max == 0) {
      return 0;
    }

    return threeCount / max;
  }

  double get twoProgress {
    final max = [fiveCount, fourCount, threeCount, twoCount, oneCount]
        .reduce((value, element) => value > element ? value : element);

    if (max == 0) {
      return 0;
    }

    return twoCount / max;
  }

  double get oneProgress {
    final max = [fiveCount, fourCount, threeCount, twoCount, oneCount]
        .reduce((value, element) => value > element ? value : element);

    if (max == 0) {
      return 0;
    }

    return oneCount / max;
  }

  ReviewInformationState({
    required this.fiveCount,
    required this.fourCount,
    required this.threeCount,
    required this.twoCount,
    required this.oneCount,
  });

  ReviewInformationState copyWith({
    int? fiveCount,
    int? fourCount,
    int? threeCount,
    int? twoCount,
    int? oneCount,
  }) {
    return ReviewInformationState(
      fiveCount: fiveCount ?? this.fiveCount,
      fourCount: fourCount ?? this.fourCount,
      threeCount: threeCount ?? this.threeCount,
      twoCount: twoCount ?? this.twoCount,
      oneCount: oneCount ?? this.oneCount,
    );
  }

  factory ReviewInformationState.initial() {
    return ReviewInformationState(
      fiveCount: 0,
      fourCount: 0,
      threeCount: 0,
      twoCount: 0,
      oneCount: 0,
    );
  }

  factory ReviewInformationState.fromJson(Map<String, dynamic> map) {
    return ReviewInformationState(
      fiveCount: map['fiveCount'] as int,
      fourCount: map['fourCount'] as int,
      threeCount: map['threeCount'] as int,
      twoCount: map['twoCount'] as int,
      oneCount: map['oneCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fiveCount': fiveCount,
      'fourCount': fourCount,
      'threeCount': threeCount,
      'twoCount': twoCount,
      'oneCount': oneCount,
    };
  }
}
