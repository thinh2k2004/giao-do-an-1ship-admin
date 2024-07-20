# Flutter Starter Kit

An example of a getx project.

## Feature

- Get Pattern by [Get](https://pub.dev/packages/get)
- Navigate pages by [Get](https://pub.dev/packages/get)
- Dependencies by [Get](https://pub.dev/packages/get)
- Local cache by using [Floor](https://pub.dev/packages/floor)
- Restful api call by using [Dio](https://github.com/flutterchina/dio)
- Localization by using [GetX](https://pub.dev/packages/get)
- Environment Variable & Project Config (Like App Name, Bundle Id) based on different
  project [flavour](https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b) (
  Development, Staging & Production)
- Build pojo by using [json_serializable](https://pub.dev/packages/json_serializable)

## Install

1. Follow flutter [official setup guide](https://flutter.io/docs/get-started/install) to set up
   flutter environment
2. Download [flutter version](https://flutter.dev/docs/development/tools/sdk/releases)

## Run Config

1. Run: flutter create .
2. Click 'Edit Configuration'
3. Point to specs main in lib/app_config folder

## Useful Command

For development:

```
flutter run -t lib/app_config/main_development.dart
```

For production:

```
flutter run --flavor production -t lib/config/main_production.dart
```

### Generate assets

- By [flutter_gen](https://pub.dev/packages/flutter_gen)

(need "dart pub global activate flutter_gen" for the first time)

```
fluttergen -c pubspec.yaml
```

or

```
sh scripts/gen_assets.sh
```

### Generate locales

- By [get_cli](https://pub.dev/packages/get_cli)

(need "flutter pub global activate get_cli" for the first time)

```
get generate locales assets/locales on lib/presenters/generated
```

or

```
sh scripts/gen_locales.sh
```

### Generate json serialize and deserialize functions

- By [json_serializable](https://pub.dev/packages/json_serializable)

```
dart run build_runner build --delete-conflicting-outputs
```

or

```
sh scripts/gen_model.sh
```

### Generate Page template

```
sh scripts/gen_page_template.sh <page name>
```

example

```
sh scripts/gen_page_template.sh Home
```

### Build Apk file

```
sh scripts/build_release_apk.sh <flavor_name>
```

example

```
sh scripts/build_release_apk.sh dev
```