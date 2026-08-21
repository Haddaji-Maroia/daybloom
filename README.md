# 🌱 Daybloom
*Capturez vos pensées, un jour à la fois.*

---

# Présentation du projet

## 1. Résumé

**Daybloom** est une application mobile de journal personnel développée avec Flutter. Elle permet à l'utilisateur d'écrire des entrées quotidiennes, d'y associer des photos et de suivre sa régularité grâce à un système de streak et de badges. L'application s'adresse à toute personne souhaitant développer une habitude d'écriture dans un espace simple, privé et motivant.

---

## 2. Organisation du projet

### 2.1. Racine du dépôt

```
daybloom/
├── Code/
│   ├── daybloom/              → Application Flutter principale
│   ├── dto/                   → Modèles de données (AppUser, JournalEntry)
│   └── push_data_firestore/   → Initialisation des données Firebase
├── maquette/                  → Maquettes et wireframes
├── ressources/                → Assets et inspirations visuelles
└── README.md
```

### 2.2. Organisation du dossier `lib`

```
lib/
├── constants/         → Couleurs, polices et tailles (zéro magic number)
├── routes.dart        → Navigation nommée centralisée
├── screens/
│   ├── welcome/       → Écran de bienvenue
│   ├── onboarding/    → Introduction à l'application (3 slides)
│   ├── login/         → Connexion
│   ├── register/      → Inscription
│   ├── home/          → Accueil avec entrées récentes
│   │   └── widgets/   → HomeHeader, RecentEntries, StreakCard
│   ├── entry/         → Ajout, modification et détail d'une entrée
│   │   └── widgets/   → EntryAppBar, EntryContent, EntryFormHeader
│   ├── entries/       → Liste complète des entrées
│   │   └── widgets/   → EntriesList, EntryCard
│   └── profile/       → Profil utilisateur et statistiques
│       └── widgets/   → ProfileInfo, ProfileStats, ProfileBadges, NotificationToggle
├── services/          → Logique métier (StreakService, NotificationService)
├── utils/             → Utilitaires (formatage de dates)
└── widgets/           → Composants UI réutilisables
    └── form/          → Champs de formulaire réutilisables
```

---

## 3. Problématique & besoin identifié

Beaucoup de personnes souhaitent tenir un journal personnel mais abandonnent rapidement, faute de motivation ou d'outil adapté. Les applications existantes sont souvent trop complexes, trop chères ou trop génériques pour encourager une pratique quotidienne.

**Daybloom** répond à ce besoin en proposant une expérience d'écriture simple et engageante, avec une gamification légère qui récompense la régularité sans contraindre l'utilisateur.

---

## 4. Étude de l'existant

| Application | Points forts | Points faibles |
|---|---|---|
| **Day One** | Interface soignée, rappels, synchronisation multi-appareils | Fonctionnalités principales réservées à l'abonnement payant |
| **Penzu** | Simple, chiffrement des entrées | Design daté, peu d'engagement utilisateur |
| **Reflectly** | Gamification, accompagnement par IA | Liberté d'expression limitée, trop guidé |
| **Notion** | Très flexible et personnalisable | Trop complexe pour un usage de journal quotidien |

📌 **Daybloom** se positionne comme une alternative moderne, gratuite et accessible, centrée sur l'habitude d'écriture avec une gamification simple mais efficace.

---

## 5. Public cible

- Les jeunes adultes (16–30 ans) souhaitant un espace intime pour écrire
- Les personnes qui ont tenté de tenir un journal mais ont abandonné par manque de motivation
- Ceux qui cherchent à développer une habitude d'écriture quotidienne sans contrainte

---

## 6. User Stories

> **En tant que** nouvel utilisateur,  
> **je veux** découvrir l'application en quelques slides illustrés,  
> **afin de** comprendre rapidement ce que Daybloom peut m'apporter avant de m'inscrire.

---

> **En tant qu'** utilisateur,  
> **je veux** créer un compte et me connecter avec mon adresse e-mail,  
> **afin d'** accéder à mon journal personnel de manière sécurisée.

---

> **En tant qu'** utilisateur connecté,  
> **je veux** écrire une entrée avec un titre, un contenu et une photo,  
> **afin de** conserver un souvenir complet de ma journée.

---

> **En tant qu'** utilisateur,  
> **je veux** consulter, modifier et supprimer mes entrées passées,  
> **afin de** garder mon journal à jour et organisé.

---

> **En tant qu'** utilisateur régulier,  
> **je veux** voir mon streak augmenter chaque jour que j'écris,  
> **afin d'** être motivé à maintenir une habitude d'écriture quotidienne.

---

> **En tant qu'** utilisateur,  
> **je veux** débloquer des badges selon mes actions dans l'application,  
> **afin d'** être récompensé pour mon engagement et ma progression.

---

> **En tant qu'** utilisateur,  
> **je veux** activer un rappel quotidien,  
> **afin de** ne pas oublier d'écrire dans mon journal.

---

## 7. Fonctionnalités

| Fonctionnalité | Statut |
|---|---|
| Écran de bienvenue | ✅ Terminé |
| Onboarding (3 slides) | ✅ Terminé |
| Inscription avec Firebase Auth | ✅ Terminé |
| Connexion avec Firebase Auth | ✅ Terminé |
| Accueil avec entrées récentes (StreamBuilder) | ✅ Terminé |
| Écrire une entrée avec photo | ✅ Terminé |
| Détail d'une entrée (StreamBuilder) | ✅ Terminé |
| Modifier une entrée | ✅ Terminé |
| Supprimer une entrée | ✅ Terminé |
| Liste de toutes les entrées | ✅ Terminé |
| Notification quotidienne (toggle) | ✅ Terminé |
| Streak journalier | ✅ Terminé |
| Système de badges (First Bloom, Week Streak, Photographer) | ✅ Terminé |
| Écran profil avec statistiques | ✅ Terminé |
| Gestion des erreurs et états de chargement | ✅ Terminé |
| Seeder de données (push_data_firestore) | ✅ Terminé |

---

## 8. Fonctionnalités à venir

- 📅 **Calendrier des entrées** — visualiser les jours d'écriture sur un mois
- 🏷️ **Tags** — organiser les entrées par thème ou émotion
- 🔍 **Recherche** — retrouver une entrée par mot-clé
- 📊 **Statistiques avancées** — fréquence d'écriture, évolution du streak

---

# Documentation développeur

### ⚙️ Installation

1. Cloner le dépôt

```bash
git clone https://github.com/trans-dam-2025-2026/examen-2526-haddaji-maroia.git
cd examen-2526-haddaji-maroia/Code/daybloom
```

2. Installer les dépendances

```bash
flutter pub get
```

3. Générer les fichiers DTO

```bash
cd ../dto
dart run build_runner build --delete-conflicting-outputs
cd ../daybloom
```

4. Configurer Firebase
    - Créer un projet sur [console.firebase.google.com](https://console.firebase.google.com)
    - Activer **Authentication** → Email/Mot de passe
    - Activer **Firestore Database** (mode test)
    - Exécuter `flutterfire configure` dans le dossier `daybloom`
    - Vérifier la présence du fichier `lib/firebase_options.dart`

5. Lancer l'application

```bash
flutter run
```

### Initialiser les données de test

```bash
cd ../push_data_firestore
flutter run
# Appuyer sur "Generate data" dans l'application
```

---

### 📦 Dépendances principales

| Package | Version | Usage |
|---|---|---|
| `firebase_core` | ^3.6.0 | Initialisation Firebase |
| `firebase_auth` | ^5.3.0 | Authentification utilisateur |
| `cloud_firestore` | ^5.4.0 | Base de données en temps réel |
| `firestore_odm` | ^3.0.2 | Mapping objet-document typé |
| `freezed` | ^3.0.0 | Modèles de données immuables |
| `image_picker` | ^1.1.2 | Sélection d'images depuis la galerie |
| `flutter_local_notifications` | ^18.0.1 | Notifications locales |
| `shared_preferences` | ^2.3.2 | Stockage local des préférences |

---

### ⚠️ Problèmes connus

- **Photos non persistantes après rebuild** : les photos sont sauvegardées avec le chemin local du simulateur. Après un rebuild ou une réinstallation, les chemins deviennent invalides. Une intégration Firebase Storage résoudrait ce problème (plan Blaze requis).

- **Image non préchargée à l'édition** : lors de la modification d'une entrée, l'image existante n'est pas préchargée dans le formulaire. L'utilisateur doit la resélectionner s'il souhaite la conserver ou la modifier.

---

## 👩‍💻 Auteure

**Maroia Haddaji** — HEPL 2025–2026  
Cours : Développement d'Applications Mobiles