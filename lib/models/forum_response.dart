class ForumResponse {
  final String id;
  final String postId;
  final String authorId;
  final String authorName;
  final String content;
  final int likes;
  final int dislikes;
  final DateTime createdAt;

  ForumResponse({
    required this.id,
    required this.postId,
    required this.authorId,
    required this.authorName,
    required this.content,
    this.likes = 0,
    this.dislikes = 0,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'postId': postId,
      'authorId': authorId,
      'authorName': authorName,
      'content': content,
      'likes': likes,
      'dislikes': dislikes,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory ForumResponse.fromJson(Map<String, dynamic> json) {
    return ForumResponse(
      id: json['id'],
      postId: json['postId'],
      authorId: json['authorId'],
      authorName: json['authorName'],
      content: json['content'],
      likes: json['likes'] ?? 0,
      dislikes: json['dislikes'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

