# TriplyForum

Application mobile Flutter développée dans le cadre d'un projet scolaire. TriplyForum est le forum de voyage communautaire de **Triply**, une application de planification de voyage avec assistance IA.

## 📱 À propos du projet

Ce projet propose une extension mobile sous forme de forum communautaire pour les voyageurs. L'objectif est de permettre aux utilisateurs de partager leurs expériences, poser des questions, échanger des conseils pratiques sur les voyages et bénéficier d'une assistance intelligente lors de leurs recherches.

## ✨ Fonctionnalités principales

### Forum de voyage
- **Catégories thématiques** : Destinations, Activités, Bon plans, Billets, Visas, Restaurants, Adresses, Hébergement, Conseils
- **Recherche intelligente** avec assistance IA contextuelle
- **Création de sujets** et participation aux discussions
- **Système de réponses** avec système de notation
- **Filtrage par catégories** et recherche textuelle

### Assistant IA
- **Suggestions intelligentes** lors des recherches
- **Informations contextuelles** basées sur les requêtes
- **Ressources externes** : liens vers forums spécialisés et guides de voyage
- **Conseils personnalisés** selon le type de recherche (destinations, visas, billets, etc.)
- **Suggestions de catégories** pertinentes

### Chat communautaire
- **Salons de discussion** organisés par catégorie
- **Messagerie instantanée** dans les salons
- **Création de nouveaux salons** thématiques
- **Historique des conversations**

### Messagerie privée
- **Conversations individuelles** entre membres
- **Historique des messages** complet
- **Indicateur de messages non lus**
- **Recherche d'utilisateurs**

### Foire aux Questions (FAQ)
- **Base de connaissances** sur les voyages
- **Recherche et filtrage** par catégorie
- **Compteur de vues** pour les questions populaires
- **Interface expansible** pour une lecture optimale

### Authentification
- **Inscription et connexion** sécurisées
- **Mode invité** pour consulter le forum sans compte
- **Gestion de session** persistante
- **Profil utilisateur** personnalisé

## 🛠️ Technologies utilisées

- **Flutter** - Framework de développement mobile cross-platform
- **Dart** - Langage de programmation
- **Provider** - Gestion d'état réactive
- **SharedPreferences** - Stockage local des données (sans base de données externe)
- **JSON** - Format de sérialisation pour la persistance

## 📦 Installation et exécution

### Prérequis
- Flutter SDK (version 3.10.0 ou supérieure)
- Dart SDK
- Un émulateur Android/iOS ou un appareil physique
- Android Studio / Xcode (pour les émulateurs)

### Étapes d'installation

1. **Cloner le repository** :
```bash
git clone https://github.com/RayaneTks/triplyapp.git
cd triplyapp
```

2. **Installer les dépendances** :
```bash
flutter pub get
```

3. **Lancer l'application** :
```bash
flutter run
```

### Compilation pour production

**Android** :
```bash
flutter build apk --release
```

**iOS** :
```bash
flutter build ios --release
```

## 🎨 Design et expérience utilisateur

L'application utilise une interface moderne et intuitive :

- **Palette de couleurs Triply** :
  - Vert primaire (#006241) pour les éléments principaux
  - Vert clair (#50D4AA) pour les accents
  - Design cohérent avec Material 3

- **Interface responsive** :
  - Adaptée à toutes les résolutions d'écran
  - Optimisée pour smartphones et tablettes
  - Gestion intelligente de l'espace disponible

- **Expérience utilisateur** :
  - Navigation intuitive avec barre de navigation en bas
  - Messages de guidage contextuels
  - Validation des formulaires avec retours utilisateur clairs
  - Feedback visuel pour toutes les actions

## 📂 Architecture du projet

```
lib/
├── models/          # Modèles de données (User, ForumPost, ChatMessage, etc.)
├── pages/           # Écrans de l'application
│   ├── forum_page.dart
│   ├── forum_detail_page.dart
│   ├── chat_channels_page.dart
│   ├── chat_page.dart
│   ├── messages_page.dart
│   ├── faq_page.dart
│   └── login_page.dart
├── services/        # Services métier
│   ├── auth_service.dart
│   ├── forum_service.dart
│   ├── chat_service.dart
│   ├── message_service.dart
│   ├── faq_service.dart
│   ├── ai_service.dart        # Service d'assistance IA
│   └── storage_service.dart   # Gestion du stockage local
├── providers/       # Gestion d'état avec Provider
│   └── auth_provider.dart
├── theme/           # Configuration du thème et couleurs
│   └── app_colors.dart
└── widgets/         # Widgets réutilisables
    └── triply_logo.dart
```

## 🔐 Sécurité et stockage

- **Stockage local uniquement** : Utilisation de SharedPreferences pour stocker toutes les données
- **Pas de base de données externe** : Toutes les données sont stockées localement sur l'appareil
- **Authentification simple** : Système d'authentification léger adapté au contexte scolaire

## 💡 Fonctionnalités techniques

### Assistant IA
L'assistant IA analyse les requêtes de recherche et fournit :
- Des conseils contextuels selon le type de recherche
- Des suggestions de catégories pertinentes
- Des liens vers des ressources externes (forums de voyage, guides)
- Des informations complémentaires quand aucun résultat n'est trouvé dans le forum

### Responsive Design
- Adaptation automatique à toutes les résolutions
- Gestion des débordements avec scrollables appropriés
- Optimisation pour petits et grands écrans
- Support des différentes orientations

## 📝 Notes de développement

Ce projet a été développé dans le cadre d'un projet scolaire. Il démontre :
- La maîtrise de Flutter et du développement mobile
- L'implémentation d'une architecture modulaire
- La création d'une interface utilisateur moderne et responsive
- L'intégration de fonctionnalités intelligentes (IA)

## 👥 Équipe

Projet développé dans le cadre d'un projet scolaire, extension mobile du concept **Triply**.

## 📄 Licence

Ce projet est développé à des fins éducatives.

---

**TriplyForum** - Forum de voyage communautaire avec assistance IA pour Triply
