# Test Project

This project uses Flutter version 3.13.5 and Dart version 3.1.2. Please make sure to upgrade your Flutter version, or you can use [FVM](https://fvm.app/) for version management.

To get started, create a `.env` file in the root directory and fill in the values for the variables (you can find examples in the `.env.example` file).

Execute the following commands to generate necessary files in this project:

```bash
flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
```

Or, if you are using FVM:

```bash
fvm flutter clean && fvm flutter pub get && fvm flutter pub run build_runner build --delete-conflicting-outputs
```

To improve performance in Flutter web, please use HTML as the rendering engine. Execute the following command:

```bash
flutter run -d chrome --web-renderer html
```

Or, with FVM:

```bash
fvm flutter run -d chrome --web-renderer html
```

Enjoy working on your Flutter project! If you encounter any issues or have questions, feel free to reach out for assistance.