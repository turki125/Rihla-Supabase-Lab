# 📱 RIHLA - Discover Saudia App

> A Flutter travel guide for discovering remarkable destinations across Saudi
> Arabia.

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Platform-iOS%20%7C%20Android-lightgrey?style=for-the-badge" alt="Platform">
</p>

---

## 📖 Overview

RIHLA presents four memorable Saudi destinations: Hegra, the Edge of the
World, Al-Balad, and Rijal Almaa. Each destination has a local image, location,
rating, and short story. Users can explore a richer details screen and bookmark
places for a future trip.

## ✨ Features

- 🗺️ Four destinations stored in a `List<Map<String, dynamic>>`
- 🖼️ Local image assets that work without an internet connection
- 📱 Responsive image sizing with `MediaQuery`
- 🔍 Search destinations by name or region with a `TextField`
- 🔎 Destination details with story, best visiting time, and ideal duration
- ➡️ Navigation between screens with `Navigator`
- 🔖 Bookmark places and view them in the Saved tab

## 📸 Screenshots

<p align="center">
  <img src="screenshots/home.png" alt="RIHLA Discover screen" width="260">
  <img src="screenshots/details.png" alt="RIHLA place details screen" width="260">
  <img src="screenshots/saved.png" alt="RIHLA saved journeys screen" width="260">
  <img src="https://github.com/user-attachments/assets/fa539922-b3f8-4651-a6f8-83ad03f1898a" alt="RIHLA saved places screen" width="260">
</p>

<p align="center"><em>Discover, destination details, and Saved screens</em></p>

## 🧩 Widgets Used

`AppBar`, `Column`, `ListView`, `Container`, `SizedBox`, `Image`, `Text`,
`MediaQuery`, `Navigator`, `FilledButton`, `TextField`, and `NavigationBar`.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed and configured
- An iOS simulator, Android emulator, or physical device

### Run the project

```bash
flutter pub get
flutter run
```

## 🗂️ Project Structure

```text
turki_mohammed_project1/
├── assets/
│   └── images/             # Local destination photos
├── lib/
│   ├── main.dart           # App theme and entry point
│   └── screens/
│       ├── home.dart       # Destination cards and Saved tab
│       └── place_details.dart
├── screenshots/            # README screenshots
├── pubspec.yaml            # Dependencies and asset registration
└── README.md
```

## 🧠 What I Practiced

- Building responsive Flutter layouts with core widgets
- Organizing reusable destination data
- Passing data between screens
- Managing simple saved-place state

---

<p align="center">Made by Turki Mohammed for Flutter Bootcamp Project 1.</p>
