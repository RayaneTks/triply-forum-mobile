# TriplyForum

Application mobile Flutter développée dans le cadre d'un projet scolaire. TriplyForum est le forum de voyage communautaire de **Triply**, une application de planification de voyage avec assistance IA.

## 📱 À propos du projet

TriplyForum est une application mobile complète qui permet aux voyageurs de partager leurs expériences, poser des questions, échanger des conseils pratiques et bénéficier d'une assistance intelligente lors de leurs recherches. Conçue avec Flutter, l'application offre une expérience utilisateur moderne et intuitive, combinant les avantages d'un forum communautaire avec les capacités d'une assistance IA contextuelle.

## ✨ Fonctionnalités détaillées

### 🗺️ Forum de voyage

Le forum est le cœur de l'application, permettant aux utilisateurs de créer et participer à des discussions sur tous les aspects du voyage.

#### Catégories thématiques
L'application propose **9 catégories spécialisées** pour organiser les discussions :
- **Destinations** : Partage d'expériences sur des pays, villes et régions
- **Activités** : Suggestions d'activités, excursions et expériences à vivre
- **Bon plans** : Partage de bonnes affaires, promotions et astuces économiques
- **Billets** : Discussions sur les transports, réservations et comparateurs
- **Visas** : Conseils sur les formalités administratives et documents nécessaires
- **Restaurants** : Recommandations culinaires et adresses gastronomiques
- **Adresses** : Partage de lieux d'intérêt et bonnes adresses
- **Hébergement** : Conseils sur les hôtels, auberges et logements
- **Conseils** : Astuces générales et recommandations de voyage

#### Système de recherche avancée
- **Recherche textuelle** : Recherche instantanée dans les titres et descriptions des posts
- **Filtrage par catégorie** : Navigation rapide avec filtres horizontaux
- **Recherche intelligente** : Activation automatique de l'assistant IA lors de la saisie
- **Affichage dynamique** : Résultats mis à jour en temps réel pendant la saisie

#### Création et gestion des posts
- **Création de sujets** : Formulaire intuitif avec titre, description et sélection de catégorie
- **Validation des données** : Messages d'erreur clairs pour guider l'utilisateur
- **Affichage des posts** : Cartes visuelles avec icônes de catégorie, statistiques (vues, réponses)
- **Statut résolu** : Badge visuel pour les questions ayant reçu une réponse validée
- **Tri chronologique** : Affichage des posts les plus récents en premier

#### Système de réponses
- **Réponses aux posts** : Commentaires avec affichage de l'auteur et de la date
- **Système de notation** : Likes et dislikes pour évaluer la pertinence des réponses
- **Compteur de réponses** : Suivi automatique du nombre de contributions par post
- **Interface conversationnelle** : Design clair avec avatars et formatage des messages

### 🤖 Assistant IA

L'assistant IA offre une expérience de recherche enrichie, similaire à un moteur de recherche intelligent.

#### Fonctionnement de l'IA
L'assistant analyse les requêtes de recherche en temps réel et fournit :

1. **Extraction de mots-clés intelligente**
   - Filtrage des mots vides (articles, prépositions)
   - Identification des termes pertinents dans la requête
   - Normalisation du texte (minuscules, accents)

2. **Suggestions de catégories contextuelles**
   - Analyse sémantique de la requête
   - Système de scoring pour classer les catégories pertinentes
   - Affichage des 3 catégories les plus pertinentes avec badges visuels

3. **Conseils contextuels personnalisés**
   - Détection automatique du type de recherche (destination, visa, billets, restaurants, etc.)
   - Génération de conseils pratiques selon le contexte
   - Adaptation du message selon la présence ou l'absence de résultats

4. **Informations externes (quand aucun résultat)**
   - Détection intelligente du type de recherche (destination, visa, hébergement, etc.)
   - Génération de liens vers des ressources externes pertinentes :
     - Forums de voyage (Routard, TripAdvisor)
     - Guides officiels (Lonely Planet)
     - Sites spécialisés (Skyscanner, Booking.com, etc.)
   - Conseils pratiques complémentaires
   - Encourager la création de nouveaux posts

#### Exemples d'utilisation

**Recherche "allemagne"** :
- Conseils sur le voyage en Allemagne
- Liens vers guides et forums spécialisés
- Suggestions de catégories "Destinations" et "Conseils"

**Recherche "visa japon"** :
- Conseils sur les démarches de visa
- Liens vers sites officiels (ambassades, services publics)
- Informations sur les délais et documents nécessaires

**Recherche "billets pas cher"** :
- Conseils pour trouver les meilleurs prix
- Liens vers comparateurs de vols
- Astuces pour économiser sur les billets

### 💬 Chat communautaire

Système de chat par salons permettant les discussions en groupe sur des thèmes spécifiques.

#### Gestion des salons
- **Salons par catégorie** : Organisation thématique (Général, Destinations, Restaurants, Activités, etc.)
- **Affichage des statistiques** : Nombre de membres par salon
- **Création de nouveaux salons** : Possibilité pour les utilisateurs de créer leurs propres salons
- **Formulaire de création** : Nom, description et sélection de catégorie

#### Messagerie dans les salons
- **Interface de chat** : Design moderne avec bulles de messages
- **Affichage des messages** : Nom de l'expéditeur, contenu et horodatage
- **Défilement automatique** : Navigation fluide vers les nouveaux messages
- **Zone de saisie** : Input avec bouton d'envoi intégré
- **Validation** : Messages d'erreur si le message est vide

### 📨 Messagerie privée

Système de messagerie individuelle pour les échanges privés entre membres.

#### Gestion des conversations
- **Liste des conversations** : Affichage des interlocuteurs avec aperçu du dernier message
- **Recherche d'utilisateurs** : Recherche textuelle pour trouver des membres
- **Création de nouvelles conversations** : Dialogue modal avec liste des utilisateurs disponibles
- **Séparation visuelle** : Distinction entre conversations actives et autres utilisateurs

#### Fonctionnalités de messagerie
- **Interface conversationnelle** : Bulles différenciées pour l'expéditeur et le destinataire
- **Historique complet** : Affichage de tous les messages échangés
- **Indicateur de messages non lus** : Badge numérique sur les conversations avec nouveaux messages
- **Horodatage intelligent** : Format adaptatif ("À l'instant", "Il y a X min", dates complètes)

#### Expérience utilisateur
- **Gestion des états** : Affichage différencié pour utilisateurs connectés/invités
- **Messages de guidage** : Instructions claires pour se connecter si nécessaire
- **Feedback utilisateur** : Messages de succès/erreur lors de l'envoi

### ❓ Foire aux Questions (FAQ)

Base de connaissances organisée pour répondre aux questions fréquentes.

#### Organisation des FAQs
- **Catégories thématiques** : Organisation par domaines (Destinations, Visas, Billets, Restaurants, Activités, Conseils)
- **Questions pré-définies** : FAQ initiale avec questions communes sur les voyages
- **Interface expansible** : Cartes cliquables qui s'ouvrent pour révéler la réponse complète

#### Fonctionnalités de recherche
- **Recherche textuelle** : Recherche dans les questions et réponses
- **Filtrage par catégorie** : Navigation rapide avec filtres horizontaux
- **Compteur de vues** : Suivi de la popularité de chaque question
- **Affichage adaptatif** : Messages contextuels selon les résultats de recherche

#### Expérience de lecture
- **Design épuré** : Cartes avec icônes de catégorie et informations structurées
- **Contenu structuré** : Questions en titre, réponses détaillées dans le contenu expansé
- **Statistiques visuelles** : Affichage du nombre de vues pour identifier les questions populaires

### 🔐 Authentification et gestion des utilisateurs

Système d'authentification complet permettant la gestion des comptes utilisateurs.

#### Inscription et connexion
- **Formulaire d'inscription** : Nom d'utilisateur, email et mot de passe
- **Formulaire de connexion** : Email et mot de passe
- **Validation des données** :
  - Vérification de la présence des champs obligatoires
  - Validation du format email
  - Contrôle de la longueur minimale des mots de passe
  - Vérification de la longueur minimale des noms d'utilisateur
- **Messages d'erreur** : Feedback clair en cas d'échec (email inexistant, mot de passe incorrect, email déjà utilisé)

#### Gestion de session
- **Session persistante** : Mémorisation de la connexion entre les sessions
- **Reconnexion automatique** : Vérification de la session au démarrage de l'application
- **Menu utilisateur** : Accès rapide au profil et à la déconnexion depuis l'en-tête
- **Mode invité** : Possibilité de naviguer dans l'application sans compte (lecture seule)

#### Interface utilisateur
- **Design moderne** : Écran de connexion avec logo Triply et fond sombre élégant
- **Navigation intuitive** : Basculement facile entre connexion et inscription
- **État de chargement** : Indicateurs visuels pendant les opérations d'authentification
- **Avatar personnalisé** : Initiale du nom d'utilisateur dans un cercle coloré

## 🛠️ Technologies utilisées

### Framework et langage
- **Flutter** : Framework de développement mobile cross-platform permettant de cibler Android et iOS avec un code unique
- **Dart** : Langage de programmation orienté objet utilisé par Flutter

### Gestion d'état
- **Provider** : Pattern de gestion d'état réactive pour la synchronisation des données entre les composants
- **ChangeNotifier** : Mécanisme de notification des changements d'état

### Stockage de données
- **SharedPreferences** : Système de stockage local persistant pour les données utilisateur
- **JSON** : Format de sérialisation pour la persistance des structures de données complexes
- **Stockage local uniquement** : Toutes les données sont stockées sur l'appareil, sans dépendance à une base de données externe

### Interface utilisateur
- **Material 3** : Design system moderne de Google pour des interfaces cohérentes
- **Widgets personnalisés** : Composants réutilisables pour maintenir la cohérence visuelle
- **Responsive Design** : Adaptation automatique à toutes les résolutions d'écran

## 📦 Installation et exécution

### Prérequis

- **Flutter SDK** : Version 3.10.0 ou supérieure ([Télécharger Flutter](https://flutter.dev/docs/get-started/install))
- **Dart SDK** : Inclus avec Flutter
- **Émulateur ou appareil physique** :
  - Android : Android Studio avec émulateur Android
  - iOS : Xcode avec simulateur iOS (macOS uniquement)
- **Éditeur de code** : VS Code ou Android Studio avec extensions Flutter recommandées

### Étapes d'installation

1. **Cloner le repository** :
```bash
git clone https://github.com/RayaneTks/triplyapp.git
cd triplyapp
```

2. **Vérifier l'installation de Flutter** :
```bash
flutter doctor
```
Assurez-vous que tous les composants nécessaires sont installés et configurés.

3. **Installer les dépendances** :
```bash
flutter pub get
```
Cette commande télécharge et installe tous les packages nécessaires définis dans `pubspec.yaml`.

4. **Lancer l'application** :
```bash
flutter run
```
L'application se lance sur l'émulateur ou l'appareil connecté. Utilisez `r` pour recharger à chaud, `R` pour recharger complet.

### Compilation pour production

#### Android
```bash
flutter build apk --release
```
Le fichier APK sera généré dans `build/app/outputs/flutter-apk/app-release.apk`

Pour un App Bundle (pour Google Play) :
```bash
flutter build appbundle --release
```

#### iOS
```bash
flutter build ios --release
```
Ouvrez ensuite le projet Xcode dans `ios/Runner.xcworkspace` pour finaliser la signature et l'archivage.

## 🎨 Design et expérience utilisateur

### Identité visuelle

L'application utilise une palette de couleurs cohérente avec la marque Triply :

- **Vert primaire** (#006241) : Couleur principale pour les éléments importants (boutons, en-têtes, icônes)
- **Vert clair** (#50D4AA) : Couleur d'accent pour les éléments secondaires et les badges
- **Vert accent** (#35C497) : Couleur pour les indicateurs et informations importantes
- **Beige clair** (#FAF2E9) : Fond des cartes pour un contraste doux
- **Fond sombre** (#002A1C) : En-tête principal pour un contraste élégant

### Interface responsive

L'application s'adapte automatiquement à toutes les résolutions d'écran :

- **Petits écrans** (iPhone SE, petits Android) : Mise en page optimisée avec padding adaptatif
- **Écrans moyens** (iPhone standard, Android standard) : Affichage équilibré
- **Grands écrans** (iPhone Pro Max, tablettes) : Utilisation optimale de l'espace disponible
- **Gestion des débordements** : Scrollables appropriés et contraintes de hauteur pour éviter les erreurs d'affichage

### Expérience utilisateur

- **Navigation intuitive** : Barre de navigation en bas avec 4 sections principales (Forum, FAQ, Chat, Messages)
- **Feedback visuel** : 
  - Indicateurs de chargement pour les opérations asynchrones
  - Messages de succès (vert) et d'erreur (rouge/orange)
  - Animations fluides pour les transitions
- **Messages de guidage** : 
  - Validation des formulaires avec messages explicites
  - Instructions pour les actions nécessitant une connexion
  - Conseils contextuels dans l'assistant IA
- **Accessibilité** : 
  - Contrastes de couleurs appropriés
  - Tailles de police lisibles
  - Zones de tap suffisamment grandes

## 📂 Architecture du projet

### Structure des répertoires

```
lib/
├── models/              # Modèles de données
│   ├── user.dart
│   ├── forum_post.dart
│   ├── forum_response.dart
│   ├── chat_channel.dart
│   ├── chat_message.dart
│   ├── message.dart
│   └── faq.dart
│
├── pages/               # Écrans de l'application
│   ├── home_page.dart           # Page principale avec navigation
│   ├── login_page.dart          # Authentification
│   ├── forum_page.dart          # Liste des posts du forum
│   ├── forum_detail_page.dart   # Détail d'un post avec réponses
│   ├── chat_channels_page.dart  # Liste des salons de chat
│   ├── chat_page.dart           # Interface de chat dans un salon
│   ├── messages_page.dart       # Liste des conversations privées
│   ├── conversation_page.dart   # Conversation privée individuelle
│   └── faq_page.dart            # Foire aux questions
│
├── services/            # Services métier et logique applicative
│   ├── auth_service.dart        # Gestion de l'authentification
│   ├── forum_service.dart       # CRUD des posts et réponses
│   ├── chat_service.dart        # Gestion des salons et messages de chat
│   ├── message_service.dart     # Messagerie privée
│   ├── faq_service.dart         # Gestion des FAQs
│   ├── ai_service.dart          # Logique de l'assistant IA
│   └── storage_service.dart     # Abstraction du stockage local
│
├── providers/           # Gestion d'état globale
│   └── auth_provider.dart       # État de l'authentification
│
├── theme/               # Configuration visuelle
│   └── app_colors.dart          # Définition de la palette de couleurs
│
└── widgets/             # Composants réutilisables
    └── triply_logo.dart         # Logo de l'application
```

### Principes d'architecture

- **Séparation des responsabilités** : Chaque service gère un domaine fonctionnel spécifique
- **Modularité** : Les modèles, services et pages sont indépendants et réutilisables
- **Gestion d'état centralisée** : Provider pour l'authentification, state local pour les autres données
- **Abstraction du stockage** : StorageService centralise toutes les opérations de persistance

## 🔐 Sécurité et stockage

### Stockage local

L'application utilise exclusivement le stockage local pour toutes les données :

- **SharedPreferences** : Stockage clé-valeur pour les données utilisateur, posts, messages, etc.
- **Format JSON** : Sérialisation des structures complexes en JSON pour la persistance
- **Pas de base de données externe** : Toutes les données restent sur l'appareil de l'utilisateur
- **Avantages** :
  - Fonctionnement hors ligne complet
  - Pas de dépendance à un serveur
  - Confidentialité des données (stockage local uniquement)
  - Simplicité d'implémentation pour un projet scolaire

### Authentification

- **Système léger** : Authentification simple adaptée au contexte d'un projet scolaire
- **Stockage des mots de passe** : Stockage local avec vérification lors de la connexion
- **Session persistante** : Mémorisation de l'utilisateur connecté entre les sessions
- **Mode invité** : Accès en lecture seule sans authentification

**Note** : Pour une application de production, il serait recommandé d'utiliser un système d'authentification plus robuste avec hachage des mots de passe et authentification sécurisée via un backend.

## 💡 Fonctionnalités techniques avancées

### Assistant IA - Détails techniques

#### Algorithme d'analyse
1. **Préprocessing** : Normalisation du texte (minuscules, suppression accents)
2. **Extraction de mots-clés** : Filtrage des stop words et identification des termes pertinents
3. **Matching sémantique** : Comparaison avec dictionnaires de mots-clés par catégorie
4. **Scoring** : Calcul de pertinence avec pondération (correspondance exacte vs partielle)
5. **Génération contextuelle** : Production de conseils adaptés au type de recherche détecté

#### Types de recherches supportées
- **Recherches de destinations** : Détection de noms de pays/villes avec génération de liens vers guides
- **Recherches administratives** : Visas, passeports avec liens vers sites officiels
- **Recherches pratiques** : Billets, hébergement, restaurants avec conseils et comparateurs
- **Recherches générales** : Fallback avec ressources généralistes de voyage

#### Extensibilité
Le système est conçu pour être facilement extensible :
- Ajout de nouveaux patterns de détection dans les dictionnaires
- Ajout de nouvelles catégories de suggestions
- Extension des ressources externes avec nouveaux liens

### Responsive Design - Implémentation

#### Utilisation de MediaQuery
- **Dimensions adaptatives** : Padding et marges calculés en pourcentage de la largeur/hauteur d'écran
- **Hauteurs maximales** : Contraintes dynamiques pour éviter les débordements
- **Tailles de police** : Utilisation de tailles relatives pour une meilleure lisibilité

#### Gestion des débordements
- **SingleChildScrollView** : Pour les contenus pouvant dépasser (dialogs, widgets AI)
- **ConstrainedBox** : Limitation des hauteurs maximales
- **Expanded/Flexible** : Distribution intelligente de l'espace disponible
- **Overflow handling** : Gestion appropriée des textes longs (ellipsis, wrapping)

## 📱 Captures d'écran conceptuelles

### Navigation principale
L'application propose 4 sections principales accessibles via une barre de navigation en bas :
- **Forum** : Accès principal aux discussions
- **FAQ** : Base de connaissances
- **Chat** : Salons de discussion communautaires
- **Messages** : Messagerie privée

### Workflow typique

1. **Recherche dans le forum** :
   - L'utilisateur tape une requête dans la barre de recherche
   - L'assistant IA s'active automatiquement
   - Suggestions de catégories et conseils apparaissent
   - Si aucun résultat : informations externes et liens utiles

2. **Création d'un post** :
   - Clic sur le bouton "+" (nécessite connexion)
   - Formulaire avec validation en temps réel
   - Sélection de catégorie
   - Message de succès et rafraîchissement de la liste

3. **Participation à une discussion** :
   - Consultation d'un post en détail
   - Ajout de réponse avec validation
   - Affichage des réponses avec système de notation

## 🚀 Utilisation de l'application

### Premier lancement

1. **Écran de connexion** : Au démarrage, l'utilisateur voit l'écran de connexion
2. **Mode invité** : Possibilité de cliquer sur "Continuer en tant qu'invité" pour explorer
3. **Création de compte** : Bouton "S'inscrire" pour créer un nouveau compte
4. **Connexion** : Utilisation d'un compte existant pour se connecter

### Navigation

- **Barre de navigation** : 4 icônes en bas pour naviguer entre les sections
- **En-tête** : Logo Triply avec menu utilisateur (profil/déconnexion) ou bouton connexion
- **Boutons flottants** : Actions rapides (créer un post, nouveau message, etc.)

### Fonctionnalités principales

- **Rechercher** : Barre de recherche toujours accessible dans le forum
- **Créer du contenu** : Boutons flottants pour créer posts, salons, messages
- **Consulter** : Navigation fluide entre listes et détails
- **Participer** : Répondre, liker, commenter selon le contexte

## 📝 Notes de développement

Ce projet démontre :

- **Maîtrise de Flutter** : Utilisation complète du framework pour une application mobile complète
- **Architecture modulaire** : Organisation claire du code avec séparation des responsabilités
- **Interface utilisateur moderne** : Design cohérent et responsive
- **Fonctionnalités intelligentes** : Implémentation d'un système d'assistance IA
- **Gestion d'état** : Utilisation appropriée de Provider pour l'état global
- **Expérience utilisateur** : Messages de guidage, validation, feedback visuel
- **Stockage local** : Implémentation complète de la persistance sans base de données externe

### Points techniques remarquables

- **Algorithmes de traitement de langage naturel** : Extraction de mots-clés, scoring sémantique
- **Design responsive** : Adaptation à toutes les résolutions avec MediaQuery
- **Gestion des erreurs** : Validation complète des formulaires avec messages explicites
- **Performance** : Optimisation des listes avec ListView.builder
- **Code maintenable** : Structure claire, services réutilisables, widgets modulaires

## 🔄 Améliorations futures possibles

- **Intégration API réelle** : Connexion à un backend pour synchronisation multi-appareils
- **Notifications push** : Alertes pour nouveaux messages et réponses
- **Géolocalisation** : Suggestions basées sur la position de l'utilisateur
- **Recherche avancée** : Filtres multiples, recherche par date, par auteur
- **Système de favoris** : Sauvegarde des posts intéressants
- **Partage social** : Partage de posts sur réseaux sociaux
- **Upload d'images** : Ajout de photos aux posts et messages
- **IA améliorée** : Intégration d'une API IA réelle (OpenAI, Gemini) pour des réponses plus sophistiquées

## 👥 Équipe

Projet développé dans le cadre d'un projet scolaire, extension mobile du concept **Triply**.

## 📄 Licence

Ce projet est développé à des fins éducatives.

---

**TriplyForum** - Forum de voyage communautaire avec assistance IA pour Triply

*Application développée avec Flutter - Architecture modulaire - Design responsive - Assistance IA intégrée*
