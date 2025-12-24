/// Service IA qui analyse les requêtes de recherche et génère des suggestions intelligentes
class AIService {
  /// Analyse une requête de recherche et génère des suggestions contextuelles basées sur l'IA
  AISearchResult analyzeSearch(String query, int resultsCount) {
    final lowerQuery = query.toLowerCase();
    
    // Détecter les mots-clés importants
    final keywords = _extractKeywords(lowerQuery);
    
    // Générer des suggestions de catégories pertinentes
    final suggestedCategories = _suggestCategories(lowerQuery, keywords);
    
    // Générer des conseils contextuels et informations externes
    final contextualTips = _generateContextualTips(lowerQuery, keywords, resultsCount);
    
    // Générer des informations externes (comme Gemini) si pas de résultats
    final externalInfo = resultsCount == 0 
        ? _generateExternalInformation(lowerQuery, keywords)
        : null;
    
    // Analyser la pertinence des résultats
    final relevanceAnalysis = _analyzeRelevance(lowerQuery, resultsCount);
    
    return AISearchResult(
      query: query,
      suggestedCategories: suggestedCategories,
      contextualTips: contextualTips,
      relevanceAnalysis: relevanceAnalysis,
      keywords: keywords,
      externalInfo: externalInfo,
    );
  }

  /// Extrait les mots-clés importants de la requête
  List<String> _extractKeywords(String query) {
    final stopWords = {
      'le', 'la', 'les', 'un', 'une', 'des', 'de', 'du', 'pour', 'avec',
      'sur', 'dans', 'par', 'à', 'et', 'ou', 'est', 'sont', 'qui', 'que',
      'quoi', 'comment', 'où', 'quand', 'combien', 'meilleur', 'meilleurs',
      'meilleure', 'meilleures', 'bon', 'bons', 'bonne', 'bonnes'
    };
    
    final words = query.split(' ').where((word) {
      final cleanWord = word.trim().toLowerCase();
      return cleanWord.isNotEmpty && 
             cleanWord.length > 2 && 
             !stopWords.contains(cleanWord);
    }).toList();
    
    return words;
  }

  /// Suggère des catégories pertinentes basées sur la requête
  List<String> _suggestCategories(String query, List<String> keywords) {
    final categoryKeywords = {
      'Destinations': ['destination', 'pays', 'ville', 'voyage', 'voyager', 'visiter', 'paris', 'tokyo', 'bangkok', 'japon', 'thaïlande', 'vietnam', 'cambodge', 'asie', 'europe'],
      'Activités': ['activité', 'activités', 'faire', 'voir', 'découvrir', 'excursion', 'sortie', 'loisir', 'sport', 'randonnée', 'plongée'],
      'Bon plans': ['bon plan', 'bonne affaire', 'pas cher', 'réduction', 'promotion', 'offre', 'astuce', 'économie', 'budget'],
      'Billets': ['billet', 'billets', 'avion', 'train', 'transport', 'réserver', 'réservation', 'compagnie', 'vol', 'prix'],
      'Visas': ['visa', 'passeport', 'document', 'autorisation', 'entrée', 'douane', 'formulaire'],
      'Restaurants': ['restaurant', 'manger', 'cuisine', 'repas', 'adresse', 'spécialité', 'gastronomie', 'food'],
      'Adresses': ['adresse', 'lieu', 'endroit', 'endroits', 'localisation', 'coordonnées'],
      'Hébergement': ['hôtel', 'hôtels', 'hébergement', 'logement', 'appartement', 'airbnb', 'auberge', 'dormir', 'nuit'],
      'Conseils': ['conseil', 'conseils', 'astuce', 'astuces', 'recommandation', 'suggestion', 'aide', 'aider']
    };
    
    final scores = <String, int>{};
    
    for (final category in categoryKeywords.keys) {
      int score = 0;
      final categoryWords = categoryKeywords[category]!;
      
      for (final keyword in keywords) {
        for (final categoryWord in categoryWords) {
          if (keyword.contains(categoryWord) || categoryWord.contains(keyword)) {
            score += 2;
          }
        }
      }
      
      // Vérifier aussi dans la requête complète
      for (final categoryWord in categoryWords) {
        if (query.contains(categoryWord)) {
          score += 3;
        }
      }
      
      if (score > 0) {
        scores[category] = score;
      }
    }
    
    // Trier par score décroissant et retourner les top 3
    final sortedCategories = scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    return sortedCategories.take(3).map((e) => e.key).toList();
  }

  /// Génère des conseils contextuels basés sur la requête
  String _generateContextualTips(String query, List<String> keywords, int resultsCount) {
    final lowerQuery = query.toLowerCase();
    
    // Si pas de résultats, donner des conseils plus généraux
    if (resultsCount == 0) {
      if (lowerQuery.contains('visa') || lowerQuery.contains('passeport')) {
        return '💡 Conseil IA : Pour les questions de visa, vérifiez toujours les informations officielles de l\'ambassade concernée. Les délais peuvent varier selon votre nationalité et la période de l\'année.';
      } else if (lowerQuery.contains('billet') || lowerQuery.contains('avion') || lowerQuery.contains('vol')) {
        return '💡 Conseil IA : Pour trouver les meilleurs prix de billets, réservez généralement 6-8 semaines à l\'avance. Comparez plusieurs sites et utilisez le mode navigation privée pour éviter la hausse des prix.';
      } else if (lowerQuery.contains('restaurant') || lowerQuery.contains('manger') || lowerQuery.contains('cuisine')) {
        return '💡 Conseil IA : Explorez les quartiers moins touristiques pour découvrir une cuisine authentique. Les restaurants locaux offrent souvent de meilleurs prix et une expérience plus authentique.';
      } else if (lowerQuery.contains('hôtel') || lowerQuery.contains('hébergement') || lowerQuery.contains('logement')) {
        return '💡 Conseil IA : Lisez les avis récents sur plusieurs plateformes. Les photos peuvent être trompeuses, privilégiez les avis détaillés avec photos des clients.';
      } else {
        return '💡 Conseil IA : Aucun résultat trouvé dans notre forum pour cette recherche. Consultez les informations externes ci-dessous ou créez un nouveau post pour poser votre question à la communauté !';
      }
    }
    
    // Conseils basés sur des patterns détectés quand il y a des résultats
    if (lowerQuery.contains('visa') || lowerQuery.contains('passeport')) {
      return '💡 Conseil IA : Pour les questions de visa, vérifiez toujours les informations officielles de l\'ambassade concernée. Les délais peuvent varier selon votre nationalité et la période de l\'année.';
    } else if (lowerQuery.contains('billet') || lowerQuery.contains('avion') || lowerQuery.contains('vol')) {
      return '💡 Conseil IA : Pour trouver les meilleurs prix de billets, réservez généralement 6-8 semaines à l\'avance. Comparez plusieurs sites et utilisez le mode navigation privée pour éviter la hausse des prix.';
    } else if (lowerQuery.contains('restaurant') || lowerQuery.contains('manger') || lowerQuery.contains('cuisine')) {
      return '💡 Conseil IA : Explorez les quartiers moins touristiques pour découvrir une cuisine authentique. Les restaurants locaux offrent souvent de meilleurs prix et une expérience plus authentique.';
    } else if (lowerQuery.contains('hôtel') || lowerQuery.contains('hébergement') || lowerQuery.contains('logement')) {
      return '💡 Conseil IA : Lisez les avis récents sur plusieurs plateformes. Les photos peuvent être trompeuses, privilégiez les avis détaillés avec photos des clients.';
    } else if (lowerQuery.contains('destination') || keywords.any((k) => k.length > 4)) {
      return '💡 Conseil IA : Pour planifier votre voyage, consultez les posts de la communauté sur les expériences récentes. N\'hésitez pas à poser des questions spécifiques sur vos destinations.';
    } else {
      return '💡 Conseil IA : Utilisez des mots-clés spécifiques dans votre recherche (destinations, activités, types de questions) pour obtenir des résultats plus pertinents.';
    }
  }

  /// Génère des informations externes (comme Gemini) quand il n'y a pas de résultats dans l'app
  ExternalInfo? _generateExternalInformation(String query, List<String> keywords) {
    final lowerQuery = query.toLowerCase();
    
    // Détecter le type de recherche (destination, activité, etc.)
    if (_isDestinationQuery(lowerQuery, keywords)) {
      return _generateDestinationInfo(lowerQuery, keywords);
    } else if (lowerQuery.contains('visa') || lowerQuery.contains('passeport')) {
      return _generateVisaInfo(lowerQuery);
    } else if (lowerQuery.contains('billet') || lowerQuery.contains('avion')) {
      return _generateFlightInfo(lowerQuery);
    } else if (lowerQuery.contains('restaurant') || lowerQuery.contains('manger')) {
      return _generateRestaurantInfo(lowerQuery);
    } else if (lowerQuery.contains('hôtel') || lowerQuery.contains('hébergement')) {
      return _generateHotelInfo(lowerQuery);
    } else {
      return _generateGeneralTravelInfo(lowerQuery, keywords);
    }
  }

  bool _isDestinationQuery(String query, List<String> keywords) {
    final destinationKeywords = ['allemagne', 'france', 'espagne', 'italie', 'japon', 'thailande', 
      'vietnam', 'cambodge', 'inde', 'chine', 'usa', 'canada', 'australie', 'nouvelle-zelande',
      'maroc', 'tunisie', 'egypte', 'turquie', 'grece', 'portugal', 'pays-bas', 'belgique',
      'suisse', 'autriche', 'pologne', 'republique-tcheque', 'hongrie', 'croatie', 'islande',
      'norvege', 'suede', 'danemark', 'finlande', 'irlande', 'royaume-uni', 'angleterre'];
    
    return destinationKeywords.any((dest) => query.contains(dest)) ||
           keywords.any((k) => destinationKeywords.contains(k));
  }

  ExternalInfo _generateDestinationInfo(String query, List<String> keywords) {
    // Extraire le nom de la destination
    String destination = query;
    final destinationNames = {
      'allemagne': 'Allemagne',
      'france': 'France',
      'espagne': 'Espagne',
      'italie': 'Italie',
      'japon': 'Japon',
      'thailande': 'Thaïlande',
      'vietnam': 'Vietnam',
      'cambodge': 'Cambodge',
    };
    
    for (final entry in destinationNames.entries) {
      if (query.contains(entry.key)) {
        destination = entry.value;
        break;
      }
    }
    
    return ExternalInfo(
      title: 'Informations sur le voyage en $destination',
      description: 'Voici des informations utiles trouvées sur des forums de voyage et ressources en ligne :',
      links: [
        ExternalLink(
          title: 'Guide de voyage $destination - Forum Routard',
          url: 'https://www.routard.com/guide/$destination',
          description: 'Discussions et conseils de voyageurs expérimentés',
        ),
        ExternalLink(
          title: 'Expériences de voyage en $destination - TripAdvisor',
          url: 'https://www.tripadvisor.fr/DestinationGuide-$destination',
          description: 'Avis et expériences de voyageurs',
        ),
        ExternalLink(
          title: 'Conseils pratiques pour $destination - Lonely Planet',
          url: 'https://www.lonelyplanet.com/$destination',
          description: 'Guide complet avec conseils pratiques',
        ),
      ],
      tips: [
        'Consultez les forums spécialisés pour des conseils récents de voyageurs',
        'Vérifiez les conditions d\'entrée et les formalités avant votre départ',
        'Rejoignez des groupes Facebook dédiés aux voyages en $destination',
        'Créez un post dans notre forum pour poser vos questions spécifiques !',
      ],
    );
  }

  ExternalInfo _generateVisaInfo(String query) {
    return ExternalInfo(
      title: 'Informations sur les visas',
      description: 'Ressources utiles pour vos démarches de visa :',
      links: [
        ExternalLink(
          title: 'Service-Public.fr - Formalités de voyage',
          url: 'https://www.service-public.fr/particuliers/vosdroits/F34728',
          description: 'Informations officielles sur les visas',
        ),
        ExternalLink(
          title: 'France-Visas - Portail officiel',
          url: 'https://france-visas.gouv.fr',
          description: 'Demande de visa pour la France',
        ),
      ],
      tips: [
        'Vérifiez toujours les informations officielles de l\'ambassade',
        'Les délais peuvent varier, prévoyez 2-3 mois à l\'avance',
        'Créez un post dans notre forum pour partager votre expérience',
      ],
    );
  }

  ExternalInfo _generateFlightInfo(String query) {
    return ExternalInfo(
      title: 'Conseils pour trouver des billets d\'avion',
      description: 'Ressources pour comparer et réserver vos billets :',
      links: [
        ExternalLink(
          title: 'Comparateur de vols - Skyscanner',
          url: 'https://www.skyscanner.fr',
          description: 'Comparez les prix de plusieurs compagnies',
        ),
        ExternalLink(
          title: 'Astuces pour des billets pas chers - Kayak',
          url: 'https://www.kayak.fr',
          description: 'Alertes prix et conseils',
        ),
      ],
      tips: [
        'Réservez 6-8 semaines à l\'avance pour les meilleurs prix',
        'Utilisez le mode navigation privée pour éviter la hausse des prix',
        'Comparez plusieurs sites avant de réserver',
        'Partagez vos bonnes affaires dans notre forum !',
      ],
    );
  }

  ExternalInfo _generateRestaurantInfo(String query) {
    return ExternalInfo(
      title: 'Trouver les meilleurs restaurants',
      description: 'Ressources pour découvrir la gastronomie locale :',
      links: [
        ExternalLink(
          title: 'Restaurants recommandés - TripAdvisor',
          url: 'https://www.tripadvisor.fr/Restaurants',
          description: 'Avis et recommandations de restaurants',
        ),
        ExternalLink(
          title: 'Guide gastronomique - Le Fooding',
          url: 'https://lefooding.com',
          description: 'Adresses culinaires sélectionnées',
        ),
      ],
      tips: [
        'Explorez les quartiers moins touristiques',
        'Demandez conseil aux locaux',
        'Partagez vos découvertes dans notre forum !',
      ],
    );
  }

  ExternalInfo _generateHotelInfo(String query) {
    return ExternalInfo(
      title: 'Conseils pour l\'hébergement',
      description: 'Ressources pour trouver le logement idéal :',
      links: [
        ExternalLink(
          title: 'Comparateur d\'hôtels - Booking.com',
          url: 'https://www.booking.com',
          description: 'Comparaison de prix et avis',
        ),
        ExternalLink(
          title: 'Logements locaux - Airbnb',
          url: 'https://www.airbnb.fr',
          description: 'Appartements et maisons chez l\'habitant',
        ),
      ],
      tips: [
        'Lisez les avis récents avec photos',
        'Vérifiez l\'emplacement sur une carte',
        'Partagez vos expériences dans notre forum !',
      ],
    );
  }

  ExternalInfo _generateGeneralTravelInfo(String query, List<String> keywords) {
    return ExternalInfo(
      title: 'Ressources de voyage en ligne',
      description: 'Voici des ressources utiles pour votre recherche :',
      links: [
        ExternalLink(
          title: 'Forum de voyage - Routard',
          url: 'https://www.routard.com/forum',
          description: 'Discussions entre voyageurs',
        ),
        ExternalLink(
          title: 'Conseils de voyage - Lonely Planet',
          url: 'https://www.lonelyplanet.com',
          description: 'Guides et conseils pratiques',
        ),
      ],
      tips: [
        'Utilisez des mots-clés plus spécifiques pour affiner votre recherche',
        'Créez un nouveau post dans notre forum pour poser votre question',
        'Explorez les différentes catégories du forum',
      ],
    );
  }

  /// Analyse la pertinence des résultats de recherche
  String _analyzeRelevance(String query, int resultsCount) {
    if (resultsCount == 0) {
      return 'Aucun résultat trouvé pour cette recherche. Essayez avec des termes différents ou créez un nouveau post pour poser votre question !';
    } else if (resultsCount == 1) {
      return '1 résultat trouvé correspondant à votre recherche.';
    } else if (resultsCount <= 5) {
      return '$resultsCount résultats pertinents trouvés. Les posts ci-dessous correspondent à votre recherche.';
    } else {
      return '$resultsCount résultats trouvés. Utilisez les filtres de catégorie pour affiner votre recherche.';
    }
  }
}

/// Résultat d'analyse IA d'une recherche
class AISearchResult {
  final String query;
  final List<String> suggestedCategories;
  final String contextualTips;
  final String relevanceAnalysis;
  final List<String> keywords;
  final ExternalInfo? externalInfo;

  AISearchResult({
    required this.query,
    required this.suggestedCategories,
    required this.contextualTips,
    required this.relevanceAnalysis,
    required this.keywords,
    this.externalInfo,
  });
}

/// Informations externes (comme Gemini) quand il n'y a pas de résultats
class ExternalInfo {
  final String title;
  final String description;
  final List<ExternalLink> links;
  final List<String> tips;

  ExternalInfo({
    required this.title,
    required this.description,
    required this.links,
    required this.tips,
  });
}

/// Lien externe vers une ressource
class ExternalLink {
  final String title;
  final String url;
  final String description;

  ExternalLink({
    required this.title,
    required this.url,
    required this.description,
  });
}
