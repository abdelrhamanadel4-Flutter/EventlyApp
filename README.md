# Evently — Event Planner 📅

A Flutter event management app where users sign in, create events, and organize them by category — built on Firebase and localized in Arabic and English.

> This repository contains the client-side event management application backed by Firebase Auth and Cloud Firestore.

## ✨ Overview

**Evently** lets users create an account (email/password or Google), add events, and browse them in real time. Events are stored per user, filterable by category, and markable as favorites. The app supports Arabic/English localization and light/dark themes.

## 🚀 Features

- 🔐 Authentication: email/password sign in & sign up, forgot password, and Google Sign-In
- ⚡ Real-time events stored in Firestore, scoped per user
- 🗂️ Category filtering: Sport, Birthday, Meeting, Gaming, Workshop, Book Club, Exhibition, Holiday, Eating
- ➕ Create events with title, date, time, category, description, and image
- ❤️ Favorite toggle + dedicated favorites (Likes) tab
- 🔀 Bottom tabs: Home, Likes, Map, Profile
- 📖 Onboarding flow with a location step
- 🌍 Arabic and English localization (Flutter gen-l10n), selectable in-app
- 🌓 Light and dark themes with an animated theme switch
- 💾 Preferences persisted with `shared_preferences`

## 🛠️ Tech Stack

### Framework & Language

- Flutter
- Dart

### Backend Services

- `firebase_core`, `firebase_auth`, `cloud_firestore` — Firebase
- `google_sign_in` — Google authentication

### State Management

- `provider` — language, theme, events, and user state

### Localization & Device Services

- `flutter_localizations` + `intl` — Arabic/English localization
- `shared_preferences` — local persistence

### UI & Design

- `liquid_swipe` + `smooth_page_indicator` — onboarding UI
- `animated_toggle_switch` — settings toggles
- `fluttertoast` — notifications
- `flutter_native_splash` — splash screen
- `google_fonts` — typography

## 🏗️ Project Structure

```
lib/
├── l10n/                # Arabic/English ARB files + generated classes
├── model/               # Event and User models
├── providers/           # language, theme, event, user providers
├── ui/
│   ├── Authentication/  # sign in, sign up, forgot password
│   ├── events/          # add event + event card
│   ├── Home/            # home screen shell
│   ├── onboradingscrean/# onboarding + location
│   └── taps/            # Home, Likes, Map, Profile tabs
└── untiless/            # routes, colors, styles, theme, assets
```

## 📱 Application Version

Current project version: **1.0.0+1**

## 📸 Screenshots

Add screenshots here to showcase onboarding, authentication, the events feed, add-event, favorites, and settings screens.

## ▶️ Getting Started

This project uses Firebase. Configure your own Firebase project before running:

```bash
git clone https://github.com/abdelrhamanadel4-Flutter/EventlyApp.git
cd EventlyApp
flutter pub get
flutterfire configure
flutter run
```

## 📄 Note

Firebase configuration is expected in `lib/firebase_options.dart`. Regenerate it for your own Firebase project with `flutterfire configure`; environment and service-account credentials should not be committed to a public repository.