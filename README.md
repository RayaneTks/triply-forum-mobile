# Triply Forum — Forum de voyage mobile

Prototype mobile Flutter réalisé dans un cadre scolaire, en complément du projet Triply. Il explore les échanges entre voyageurs à travers un forum, des salons de discussion, une messagerie et une FAQ.

## Fonctionnalités

- Forum organisé par catégories : destinations, activités, hébergements et conseils.
- Création de sujets, réponses et réactions.
- Salons de discussion et messagerie entre profils.
- FAQ avec recherche et filtrage.
- Écrans de connexion, profils et mode invité.

## Technologies

Flutter · Dart · Provider · SharedPreferences · path_provider · Stockage JSON.

## État du projet

Les données sont conservées localement, notamment dans un fichier `shared_data.json`. Le mécanisme de synchronisation relit ce fichier ; il ne constitue pas une synchronisation réseau entre plusieurs appareils.

La connexion et la messagerie relèvent du prototype local. Une authentification serveur, un backend partagé, les notifications push et une intégration IA complète restent des évolutions à développer. Les dossiers de plateformes présents ne garantissent pas que chacune soit validée.

## Installation

Prérequis : Flutter et Dart compatibles avec la contrainte `sdk` de [`pubspec.yaml`](pubspec.yaml), actuellement `^3.10.0-290.4.beta`, ainsi qu’un appareil ou un émulateur pris en charge.

```bash
git clone https://github.com/RayaneTks/triply-forum-mobile.git
cd triply-forum-mobile
flutter pub get
flutter run
```

La contrainte Dart du projet doit guider le choix du SDK Flutter ; l’ancienne indication « Flutter 3.10 » ne correspond pas à cette contrainte.

## Commandes

```bash
flutter analyze  # Analyser le code Dart
flutter test     # Exécuter les tests présents
```

## Organisation

| Chemin | Rôle |
|---|---|
| `lib/models/` | Modèles du forum, des messages et des profils. |
| `lib/pages/` | Écrans de l’application. |
| `lib/providers/` | Gestion d’état. |
| `lib/services/` | Stockage et services du prototype. |
| `lib/theme/` | Palette et thème. |
| `lib/widgets/` | Composants partagés. |

## Documentation

Le projet web associé est [`Triply`](https://github.com/RayaneTks/triply). Ce prototype mobile est développé à des fins pédagogiques.
