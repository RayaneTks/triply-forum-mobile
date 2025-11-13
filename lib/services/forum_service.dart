import '../models/forum_post.dart';
import '../models/forum_response.dart';
import 'storage_service.dart';

class ForumService {
  final StorageService _storage = StorageService();

  Future<List<ForumPost>> getAllPosts() async {
    final postsData = await _storage.getForumPosts();
    final posts = postsData.map((data) => ForumPost.fromJson(data)).toList();
    posts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return posts;
  }

  Future<List<ForumPost>> getPostsByCategory(String category) async {
    final allPosts = await getAllPosts();
    return allPosts.where((post) => post.category == category).toList();
  }

  Future<List<ForumPost>> searchPosts(String query) async {
    final allPosts = await getAllPosts();
    final lowerQuery = query.toLowerCase();
    return allPosts
        .where((post) => 
            post.title.toLowerCase().contains(lowerQuery) ||
            post.description.toLowerCase().contains(lowerQuery))
        .toList();
  }

  Future<ForumPost?> getPostById(String postId) async {
    final postsData = await _storage.getForumPosts();
    final postData = postsData.firstWhere(
      (p) => p['id'] == postId,
      orElse: () => {},
    );
    if (postData.isEmpty) return null;
    return ForumPost.fromJson(postData);
  }

  Future<List<ForumResponse>> getResponsesForPost(String postId) async {
    final responsesData = await _storage.getForumResponses();
    final responses = responsesData
        .map((data) => ForumResponse.fromJson(data))
        .where((response) => response.postId == postId)
        .toList();
    responses.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return responses;
  }

  Future<ForumPost> createPost({
    required String title,
    required String description,
    required String authorId,
    required String authorName,
    required String category,
  }) async {
    final postsData = await _storage.getForumPosts();
    
    final newPost = ForumPost(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      authorId: authorId,
      authorName: authorName,
      category: category,
      createdAt: DateTime.now(),
    );
    
    postsData.add(newPost.toJson());
    await _storage.saveForumPosts(postsData);
    
    return newPost;
  }

  Future<ForumResponse> addResponse({
    required String postId,
    required String authorId,
    required String authorName,
    required String content,
  }) async {
    final responsesData = await _storage.getForumResponses();
    final postsData = await _storage.getForumPosts();
    
    final newResponse = ForumResponse(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      postId: postId,
      authorId: authorId,
      authorName: authorName,
      content: content,
      createdAt: DateTime.now(),
    );
    
    responsesData.add(newResponse.toJson());
    await _storage.saveForumResponses(responsesData);
    
    // Incrémenter le nombre de réponses
    final postIndex = postsData.indexWhere((p) => p['id'] == postId);
    if (postIndex != -1) {
      postsData[postIndex]['responses'] = 
          (postsData[postIndex]['responses'] ?? 0) + 1;
      await _storage.saveForumPosts(postsData);
    }
    
    return newResponse;
  }

  Future<void> incrementViews(String postId) async {
    final postsData = await _storage.getForumPosts();
    final index = postsData.indexWhere((p) => p['id'] == postId);
    if (index != -1) {
      postsData[index]['views'] = (postsData[index]['views'] ?? 0) + 1;
      await _storage.saveForumPosts(postsData);
    }
  }

  Future<void> initializeDefaultPosts() async {
    final existingPosts = await _storage.getForumPosts();
    if (existingPosts.isNotEmpty) return;
    
    final defaultPosts = [
      ForumPost(
        id: '1',
        title: 'Meilleures destinations pour un voyage en Asie du Sud-Est ?',
        description: 'Je planifie un voyage de 3 semaines en Asie du Sud-Est. Quelles sont les destinations incontournables ? Je cherche des conseils sur la Thaïlande, le Vietnam, et le Cambodge.',
        authorId: 'user1',
        authorName: 'Voyageur123',
        category: 'Destinations',
        views: 87,
        responses: 5,
        answered: true,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      ForumPost(
        id: '2',
        title: 'Visa pour le Japon : délais et procédures',
        description: 'Je prévois de voyager au Japon dans 2 mois. Quelqu\'un peut me renseigner sur les délais pour obtenir un visa touristique et les documents nécessaires ?',
        authorId: 'user2',
        authorName: 'SakuraTravel',
        category: 'Visas',
        views: 124,
        responses: 8,
        answered: true,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      ForumPost(
        id: '3',
        title: 'Bon plan : Billets Paris-Bangkok à moins de 500€',
        description: 'J\'ai trouvé des billets aller-retour Paris-Bangkok à 450€ avec Qatar Airways pour mars 2024. Dates flexibles. Partagez vos astuces pour trouver des billets pas chers !',
        authorId: 'user3',
        authorName: 'BudgetTravel',
        category: 'Bon plans',
        views: 203,
        responses: 12,
        answered: false,
        createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      ),
      ForumPost(
        id: '4',
        title: 'Restaurants à ne pas manquer à Tokyo',
        description: 'Je vais à Tokyo la semaine prochaine. Quels sont vos restaurants favoris ? Je cherche des adresses authentiques, pas trop touristiques. Budget moyen.',
        authorId: 'user4',
        authorName: 'FoodieTravel',
        category: 'Restaurants',
        views: 56,
        responses: 4,
        answered: false,
        createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      ),
    ];
    
    await _storage.saveForumPosts(
      defaultPosts.map((post) => post.toJson()).toList(),
    );
  }
}

