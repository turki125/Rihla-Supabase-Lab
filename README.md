# RIHLA - Tourist Places App

RIHLA is a Flutter app that helps users discover remarkable tourist destinations
across Saudi Arabia. It presents each place with an image, location, rating, and
short description, then opens a details screen for a richer view.

## Features

- Four Saudi destinations stored in a `List<Map<String, dynamic>>`
- Responsive destination cards using `MediaQuery`
- Local image assets that work without an internet connection
- Details screen with description, best visiting time, and ideal visit duration
- Navigation between screens using `Navigator`
- Bookmark places and view them in the Saved tab

## Screenshots

### Home screen

![RIHLA home screen](screenshots/home.png)

### Destination details

![Hegra details screen](screenshots/details.png)

## Widgets Used

`AppBar`, `Column`, `ListView`, `Container`, `SizedBox`, `Image`, `Text`,
`MediaQuery`, `Navigator`, `FilledButton`, and `NavigationBar`.

## Run the Project

1. Run `flutter pub get`.
2. Run `flutter run`.
