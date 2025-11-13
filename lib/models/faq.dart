class FAQ {
  final String id;
  final String question;
  final String answer;
  final String category;
  final int views;
  final DateTime createdAt;

  FAQ({
    required this.id,
    required this.question,
    required this.answer,
    required this.category,
    this.views = 0,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'category': category,
      'views': views,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
      category: json['category'],
      views: json['views'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

