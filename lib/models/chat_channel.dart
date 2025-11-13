class ChatChannel {
  final String id;
  final String name;
  final String description;
  final String category;
  final int memberCount;
  final DateTime createdAt;
  final String? icon;

  ChatChannel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    this.memberCount = 0,
    required this.createdAt,
    this.icon,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'memberCount': memberCount,
      'createdAt': createdAt.toIso8601String(),
      'icon': icon,
    };
  }

  factory ChatChannel.fromJson(Map<String, dynamic> json) {
    return ChatChannel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      memberCount: json['memberCount'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
      icon: json['icon'],
    );
  }
}

