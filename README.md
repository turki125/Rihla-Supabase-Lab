# RIHLA - Tourist Places App

RIHLA is a Flutter app that helps users discover remarkable tourist destinations
across Saudi Arabia. It presents each place with an image, location, rating, and
short description, then opens a details screen for a richer view.

## Features

- Four Saudi destinations stored in a `List<Map<String, dynamic>>`
- Responsive destination cards using `MediaQuery.`
- Local image assets that work without an internet connection
- Details screen with description, best visiting time, and ideal visit duration
- Navigation between screens using `Navigator.`
- Bookmark places and view them in the Saved tab

## Screenshots

### Home screen

![RIHLA home screen](<img width="300" alt="Simulator Screenshot - iPhone 16 Pro Max - 2026-08-29 at 23 46 52" src="https://github.com/user-attachments/assets/975ebe24-10c5-429d-ac56-e9f80a5fb5c9" />
)

### Destination details

![Hegra details screen](<img width="300" alt="Simulator Screenshot - iPhone 16 Pro Max - 2026-08-29 at 23 47 01" src="https://github.com/user-attachments/assets/7cc4b566-88c7-4992-9a4a-3eb339902565" />
)

## Widgets Used

`AppBar`, `Column`, `ListView`, `Container`, `SizedBox`, `Image`, `Text`,
`MediaQuery`, `Navigator`, `FilledButton`, and `NavigationBar`.

## Run the Project

1. Run `flutter pub get`.
2. Run `flutter run`.
