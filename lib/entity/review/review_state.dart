class ReviewState {
  final int id;
  final int score;
  final String createdBy;
  final String createdAt;
  final String content;

  ReviewState({
    required this.id,
    required this.score,
    required this.createdBy,
    required this.createdAt,
    required this.content,
  });

  ReviewState copyWith({
    int? id,
    int? score,
    String? createdBy,
    String? createdAt,
    String? content,
  }) {
    return ReviewState(
      id: id ?? this.id,
      score: score ?? this.score,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      content: content ?? this.content,
    );
  }

  factory ReviewState.fromJson(Map<String, dynamic> map) {
    return ReviewState(
      id: map['id'] as int,
      score: map['score'] as int,
      createdBy: map['createdBy'] as String,
      createdAt: map['createdAt'] as String,
      content: map['content'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'score': score,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'content': content,
    };
  }
}
