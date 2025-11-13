class ForumPost {
  final String id;
  final String title;
  final String description;
  final String authorId;
  final String authorName;
  final String category;
  final int views;
  final int responses;
  final bool answered;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ForumPost({
    required this.id,
    required this.title,
    required this.description,
    required this.authorId,
    required this.authorName,
    required this.category,
    this.views = 0,
    this.responses = 0,
    this.answered = false,
    required this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'authorId': authorId,
      'authorName': authorName,
      'category': category,
      'views': views,
      'responses': responses,
      'answered': answered,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory ForumPost.fromJson(Map<String, dynamic> json) {
    return ForumPost(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      authorId: json['authorId'],
      authorName: json['authorName'],
      category: json['category'],
      views: json['views'] ?? 0,
      responses: json['responses'] ?? 0,
      answered: json['answered'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}

