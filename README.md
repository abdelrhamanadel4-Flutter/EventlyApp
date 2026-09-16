# Evently

A Flutter event management app where users can sign in, create events, and organize them by category. Built with Firebase Auth and Cloud Firestore, with bilingual (Arabic/English) support.

## Features

- **Authentication**: email/password sign in and sign up, forgot password, and Google Sign-In
- **Events (Firestore)**: per-user event collections with real-time updates
- **Categories**: filter events by Sport, Birthday, Meeting, Gaming, Workshop, Book Club, Exhibition, Holiday, and Eating
- **Create events**: add event title, date, time, category, description, and image
- **Favorites**: toggle favorite events and browse them in a dedicated tab
- **Tabs**: Home (events), Likes (favorites), Map, and Profile
- **Onboarding** with a location step
- **Localization**: Arabic and English via Flutter gen-l10n, selectable in-app
- **Theming**: light and dark themes with an animated theme switch
- Preferences (onboarding flags, language, theme) persisted with `shared_preferences`

## Tech Stack

- Flutter / Dart
- `firebase_core`, `firebase_auth`, `cloud_firestore` — Firebase backend
- `google_sign_in` — Google authentication
- `provider` — state management
- `flutter_localizations` + `intl` — localization
- `shared_preferences` — local persistence
- `liquid_swipe` + `smooth_page_indicator` — onboarding UI
- `flutter_native_splash` — splash screen
- `fluttertoast`, `animated_toggle_switch`, `google_fonts`

## Project Structure

```
lib/
├── l10n/            # AR/EN localization (ARB files + generated classes)
├── model/           # Event and User models
├── providers/       # language, theme, event, and user providers
├── ui/
│   ├── Authentication/  # sign in, sign up, forgot password
│   ├── events/          # add event + event card
│   ├── Home/            # home screen shell
│   ├── onboradingscrean/  # onboarding + location
│   └── taps/            # Home, Likes, Map, Profile tabs
└── untiless/         # routes, colors, styles, theme, assets
```

## Getting Started

This project uses Firebase. Set up the Firebase CLI and configure your project before running.

```bash
git clone https://github.com/abdelrhamanadel4-Flutter/EventlyApp.git
cd EventlyApp
flutter pub get
flutterfire configure
flutter run
```

> `lib/firebase_options.dart` holds the Firebase options for the current platform; regenerate it for your own Firebase project with `flutterfire configure`.