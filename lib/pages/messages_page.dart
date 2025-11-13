import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../models/user.dart';
import '../models/message.dart';
import '../services/message_service.dart';
import '../services/storage_service.dart';
import 'conversation_page.dart';
import 'login_page.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final MessageService _messageService = MessageService();
  final StorageService _storageService = StorageService();
  List<User> _conversationPartners = [];
  List<User> _allUsers = [];
  bool _isLoading = true;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadConversations();
  }

  Future<void> _loadConversations() async {
    setState(() => _isLoading = true);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    
    if (authProvider.isLoggedIn) {
      final userId = authProvider.currentUser!.id;
      final partners = await _messageService.getConversationPartners(userId);
      final allUsersData = await _storageService.getUsers();
      final allUsers = allUsersData
          .map((data) => User.fromJson(data))
          .where((user) => user.id != userId)
          .toList();
      
      setState(() {
        _conversationPartners = partners;
        _allUsers = allUsers;
        _isLoading = false;
      });
    } else {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _startNewConversation(User user) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (!authProvider.isLoggedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vous devez être connecté pour envoyer des messages'),
        ),
      );
      return;
    }

    if (mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ConversationPage(
            otherUser: user,
            currentUserId: authProvider.currentUser!.id,
          ),
        ),
      ).then((_) => _loadConversations());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          if (!authProvider.isLoggedIn) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.message_outlined,
                    size: 64,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Connectez-vous pour accéder aux messages',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                    child: const Text('Se connecter'),
                  ),
                ],
              ),
            );
          }

          if (_isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final filteredPartners = _conversationPartners.where((partner) {
            return _searchQuery.isEmpty ||
                partner.username.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                partner.email.toLowerCase().contains(_searchQuery.toLowerCase());
          }).toList();

          final filteredAllUsers = _allUsers.where((user) {
            final isNotPartner = !_conversationPartners.any((p) => p.id == user.id);
            return isNotPartner &&
                (_searchQuery.isEmpty ||
                    user.username.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                    user.email.toLowerCase().contains(_searchQuery.toLowerCase()));
          }).toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Rechercher un utilisateur...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    if (filteredPartners.isNotEmpty) ...[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Conversations',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...filteredPartners.map((partner) => _ConversationTile(
                            user: partner,
                            currentUserId: authProvider.currentUser!.id,
                            messageService: _messageService,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ConversationPage(
                                    otherUser: partner,
                                    currentUserId: authProvider.currentUser!.id,
                                  ),
                                ),
                              ).then((_) => _loadConversations());
                            },
                          )),
                    ],
                    if (filteredAllUsers.isNotEmpty) ...[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Autres utilisateurs',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...filteredAllUsers.map((user) => _UserTile(
                            user: user,
                            onTap: () => _startNewConversation(user),
                          )),
                    ],
                    if (filteredPartners.isEmpty && filteredAllUsers.isEmpty)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 64,
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Aucun utilisateur trouvé',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          if (!authProvider.isLoggedIn) return const SizedBox.shrink();
          return FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => _NewMessageDialog(
                  allUsers: _allUsers,
                  onUserSelected: _startNewConversation,
                ),
              );
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}

class _ConversationTile extends StatefulWidget {
  final User user;
  final String currentUserId;
  final MessageService messageService;
  final VoidCallback onTap;

  const _ConversationTile({
    required this.user,
    required this.currentUserId,
    required this.messageService,
    required this.onTap,
  });

  @override
  State<_ConversationTile> createState() => _ConversationTileState();
}

class _ConversationTileState extends State<_ConversationTile> {
  Message? _lastMessage;
  int _unreadCount = 0;

  @override
  void initState() {
    super.initState();
    _loadLastMessage();
  }

  Future<void> _loadLastMessage() async {
    final messages = await widget.messageService.getConversation(
      widget.currentUserId,
      widget.user.id,
    );
    final unread = await widget.messageService.getUnreadCount(widget.currentUserId);
    
    if (mounted) {
      setState(() {
        _lastMessage = messages.isNotEmpty ? messages.last : null;
        _unreadCount = unread;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(widget.user.username[0].toUpperCase()),
      ),
      title: Text(
        widget.user.username,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _lastMessage != null
          ? Text(
              _lastMessage!.content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : const Text('Aucun message'),
      trailing: _unreadCount > 0
          ? CircleAvatar(
              radius: 12,
              backgroundColor: Colors.deepPurple,
              child: Text(
                '$_unreadCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            )
          : null,
      onTap: widget.onTap,
    );
  }
}

class _UserTile extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const _UserTile({
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(user.username[0].toUpperCase()),
      ),
      title: Text(user.username),
      subtitle: Text(user.email),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class _NewMessageDialog extends StatelessWidget {
  final List<User> allUsers;
  final Function(User) onUserSelected;

  const _NewMessageDialog({
    required this.allUsers,
    required this.onUserSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nouveau message'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: allUsers.length,
          itemBuilder: (context, index) {
            final user = allUsers[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(user.username[0].toUpperCase()),
              ),
              title: Text(user.username),
              subtitle: Text(user.email),
              onTap: () {
                Navigator.of(context).pop();
                onUserSelected(user);
              },
            );
          },
        ),
      ),
    );
  }
}

