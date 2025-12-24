# TriplyForum

Application mobile Flutter développée dans le cadre d'un projet scolaire. TriplyForum est le forum de voyage communautaire de **Triply**, une application IA de planification de voyage avancée.

## 📱 À propos du projet

Ce projet reprend le sujet de notre projet **TechGame Triply** et propose une extension mobile sous forme de forum communautaire. L'objectif est de permettre aux voyageurs de partager leurs expériences, poser des questions et échanger des conseils pratiques sur les voyages.

## ✨ Fonctionnalités

### Forum de voyage
- **Catégories thématiques** : Destinations, Activités, Bon plans, Billets, Visas, Restaurants, Adresses, Hébergement, Conseils
- **Recherche avancée** avec suggestions contextuelles
- **Création de sujets** et participation aux discussions
- **Système de réponses** avec likes/dislikes

### Chat en temps réel
- **Salons de discussion** par catégorie
- **Messagerie instantanée** entre utilisateurs
- **Création de nouveaux salons** thématiques

### Messagerie privée
- **Conversations individuelles** entre membres
- **Historique des messages**
- **Indicateur de messages non lus**

### Foire aux Questions (FAQ)
- **Base de connaissances** sur les voyages
- **Recherche et filtrage** par catégorie
- **Compteur de vues** pour les questions populaires

### Authentification
- **Inscription et connexion** des utilisateurs
- **Mode invité** pour consulter le forum
- **Gestion de profil** utilisateur

### Assistant IA 
- **Bulle contextuelle** lors des recherches
- **Intégration future** : recherche web, liens pertinents, suggestions de topics
- **Réponses enrichies** basées sur l'IA

## 🛠️ Technologies utilisées

- **Flutter** - Framework de développement mobile
- **Dart** - Langage de programmation
- **Provider** - Gestion d'état
- **SharedPreferences** - Stockage local des données
- **JSON** - Format de données pour la persistance

## 📦 Installation

### Prérequis
- Flutter SDK (version 3.10.0 ou supérieure)
- Dart SDK
- Un émulateur ou un appareil physique

### Étapes d'installation

1. Cloner le repository :
```bash
git clone https://github.com/RayaneTks/triplyapp.git
cd triplyapp
```

2. Installer les dépendances :
```bash
flutter pub get
```

3. Lancer l'application :
```bash
flutter run
```

## 🎨 Design

L'application utilise la palette de couleurs de **Triply** :
- Vert primaire pour les éléments principaux
- Vert clair pour les accents
- Design moderne avec Material 3
- Interface épurée et intuitive

## 📂 Structure du projet

```
lib/
├── models/          # Modèles de données
├── pages/           # Pages de l'application
├── services/        # Services de gestion des données
├── providers/       # Gestion d'état avec Provider
├── theme/           # Configuration du thème
└── widgets/         # Widgets réutilisables
```

## 🚀 Fonctionnalités à venir

- **Intégration IA complète** : recherche web, génération de contenu contextuel
- **Synchronisation en temps réel** : partage de données entre utilisateurs
- **Notifications push** : alertes pour nouveaux messages et réponses
- **Géolocalisation** : suggestions basées sur la position
- **Partage social** : partage de posts et destinations

## 👥 Équipe

Projet développé dans le cadre d'un projet scolaire, extension mobile de **Triply**.

## 📄 Licence

Ce projet est développé à des fins éducatives.

---

**TriplyForum** - Forum de voyage communautaire pour Triply
