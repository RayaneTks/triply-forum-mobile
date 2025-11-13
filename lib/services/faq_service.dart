import '../models/faq.dart';
import 'storage_service.dart';

class FAQService {
  final StorageService _storage = StorageService();

  Future<List<FAQ>> getAllFAQs() async {
    final faqsData = await _storage.getFAQs();
    return faqsData.map((data) => FAQ.fromJson(data)).toList();
  }

  Future<List<FAQ>> getFAQsByCategory(String category) async {
    final allFAQs = await getAllFAQs();
    return allFAQs.where((faq) => faq.category == category).toList();
  }

  Future<List<FAQ>> searchFAQs(String query) async {
    final allFAQs = await getAllFAQs();
    final lowerQuery = query.toLowerCase();
    return allFAQs
        .where((faq) => 
            faq.question.toLowerCase().contains(lowerQuery) ||
            faq.answer.toLowerCase().contains(lowerQuery))
        .toList();
  }

  Future<void> incrementViews(String faqId) async {
    final faqsData = await _storage.getFAQs();
    final index = faqsData.indexWhere((f) => f['id'] == faqId);
    if (index != -1) {
      faqsData[index]['views'] = (faqsData[index]['views'] ?? 0) + 1;
      await _storage.saveFAQs(faqsData);
    }
  }

  Future<void> initializeDefaultFAQs() async {
    final existingFAQs = await _storage.getFAQs();
    if (existingFAQs.isNotEmpty) return;
    
    final defaultFAQs = [
      FAQ(
        id: '1',
        question: 'Comment trouver les meilleures destinations de voyage ?',
        answer: 'Utilisez la catégorie "Destinations" du forum pour découvrir des recommandations de la communauté. Vous pouvez aussi utiliser la recherche pour trouver des discussions sur des destinations spécifiques.',
        category: 'Destinations',
        createdAt: DateTime.now(),
      ),
      FAQ(
        id: '2',
        question: 'Comment obtenir des conseils pour les visas ?',
        answer: 'Consultez la catégorie "Visas" du forum où vous trouverez des discussions sur les procédures de visa pour différents pays. Les membres partagent leurs expériences et conseils pratiques. N\'hésitez pas à poser vos questions spécifiques !',
        category: 'Visas',
        createdAt: DateTime.now(),
      ),
      FAQ(
        id: '3',
        question: 'Où trouver les meilleurs prix de billets d\'avion ?',
        answer: 'La catégorie "Billets" contient des discussions sur les meilleures périodes pour voyager, les comparateurs de prix, et les astuces pour trouver des billets pas chers. Les membres partagent régulièrement des bonnes affaires qu\'ils découvrent.',
        category: 'Billets',
        createdAt: DateTime.now(),
      ),
      FAQ(
        id: '4',
        question: 'Comment partager une bonne adresse ou un restaurant ?',
        answer: 'Créez un nouveau post dans la catégorie "Restaurants" ou "Adresses" pour partager vos découvertes culinaires et vos adresses favorites. N\'oubliez pas d\'inclure l\'adresse, le type de cuisine, et vos impressions !',
        category: 'Restaurants',
        createdAt: DateTime.now(),
      ),
      FAQ(
        id: '6',
        question: 'Comment trouver des activités à faire lors de mon voyage ?',
        answer: 'Explorez la catégorie "Activités" où vous trouverez des suggestions d\'activités, d\'excursions, et d\'expériences partagées par la communauté. Vous pouvez aussi utiliser la recherche pour trouver des activités dans une destination spécifique.',
        category: 'Activités',
        createdAt: DateTime.now(),
      ),
    ];
    
    await _storage.saveFAQs(
      defaultFAQs.map((faq) => faq.toJson()).toList(),
    );
  }
}

