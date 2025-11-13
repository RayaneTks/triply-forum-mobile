import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'services/faq_service.dart';
import 'services/forum_service.dart';
import 'services/chat_service.dart';
import 'theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final faqService = FAQService();
  final forumService = ForumService();
  final chatService = ChatService();
  await faqService.initializeDefaultFAQs();
  await forumService.initializeDefaultPosts();
  await chatService.initializeDefaultChannels();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider()..initialize(),
      child: MaterialApp(
        title: 'TriplyForum',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryGreen,
          useMaterial3: true,
          colorScheme: ColorScheme.light(
            primary: AppColors.primaryGreen,
            secondary: AppColors.lightGreen,
            surface: AppColors.backgroundWhite,
            background: AppColors.backgroundLight,
            error: AppColors.error,
            onPrimary: AppColors.textLight,
            onSecondary: AppColors.textDark,
            onSurface: AppColors.textDark,
            onBackground: AppColors.textDark,
            onError: AppColors.textLight,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: AppColors.textLight,
            elevation: 0,
          ),
          cardTheme: CardThemeData(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: AppColors.backgroundWhite,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: AppColors.backgroundWhite,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: AppColors.textLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColors.lightGreen,
            foregroundColor: AppColors.textDark,
          ),
        ),
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            if (authProvider.isLoading) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            return authProvider.isLoggedIn
                ? const HomePage()
                : const LoginPage();
          },
        ),
      ),
    );
  }
}
