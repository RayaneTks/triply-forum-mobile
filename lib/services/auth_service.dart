import '../models/user.dart';
import 'storage_service.dart';

class AuthService {
  final StorageService _storage = StorageService();

  Future<User?> login(String email, String password) async {
    final users = await _storage.getUsers();
    
    for (var userData in users) {
      if (userData['email'] == email) {
        // Vérifier le mot de passe
        final storedPassword = userData['password'] as String?;
        if (storedPassword == password) {
          final user = User.fromJson(userData);
          await _storage.setCurrentUserId(user.id);
          return user;
        } else {
          // Mot de passe incorrect
          return null;
        }
      }
    }
    
    return null;
  }

  Future<User?> register(String username, String email, String password) async {
    final users = await _storage.getUsers();
    
    if (users.any((user) => user['email'] == email)) {
      return null;
    }
    
    final newUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      username: username,
      email: email,
      createdAt: DateTime.now(),
    );
    
    // Ajouter le mot de passe aux données utilisateur (mais pas dans le modèle User)
    final userData = newUser.toJson();
    userData['password'] = password;
    
    users.add(userData);
    await _storage.saveUsers(users);
    await _storage.setCurrentUserId(newUser.id);
    
    return newUser;
  }

  Future<void> logout() async {
    await _storage.clearCurrentUser();
  }

  Future<User?> getCurrentUser() async {
    final userId = await _storage.getCurrentUserId();
    if (userId == null) return null;
    
    final users = await _storage.getUsers();
    final userData = users.firstWhere(
      (user) => user['id'] == userId,
      orElse: () => {},
    );
    
    if (userData.isEmpty) return null;
    return User.fromJson(userData);
  }

  Future<bool> isLoggedIn() async {
    final userId = await _storage.getCurrentUserId();
    return userId != null;
  }
}

