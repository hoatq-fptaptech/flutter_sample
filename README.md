# Getting Started

- Flutter version using : 3.16.7 (stable at 12/01/2024)
- Platform android : 34, Build-tools : 32.1.0-rc1
- Java version OpenJDK 11.0.12
- Gradle version 7.4
- Build:gradle 7.2.2
- Xcode: 14.3
- CocoaPods version 1.12.1

# Project structure

- This project follow **Clean architecture** approach. For more reference, please read
  about [clean architecture layers](./Project-structure.md)
- We want to separate what type of database that we use for storage (might want to change it later
  on)
- Also, to adhere SOLID principles since we are using OOP for this project.
- We need to ensure that UI layers don't know what is going on at data layer at all.
- By following this approach, each layers will be separated into different packages for easier
  management, easier maintenance.

# How to generate a folder template following project structure

- Run script: `sh .gen_clean.sh {feature_name}`, it will generate for you a set of folders
  like [this](./Project-structure.md#clean-architect-feature-template)
- For example: `sh .gen_clean.sh signin`

# Before run app

- Install [Lefthook](https://github.com/evilmartians/lefthook) and run `lefthook install` at project
  root. (one time only)
- Install [Flutter plugin](https://docs.flutter.dev/get-started/editor).
- Run `sh .setup_app.sh` at project root.

# Configure running environment

- **ANDROID STUDIO**

**Step 1 :** Open " Run => Edit Configuration in Android Studio"

**Step 2 :** Create new Configuration with build flavor value is :

+ Dev Environment : ***dev***
+ Staging Environment : ***staging***
+ Production Environment : ***production***

- **VS Code**

**Step 1 :** Open " Run => Open Configuration in VS Code"

**Step 2 :** Create new Configuration with build flavor value is :

+ Dev Environment : ***dev***
+ Staging Environment : ***staging***
+ Production Environment : ***production***
+ If you want run on ***release*** mode, please add `"flutterMode": "release"` into config object
+ For example with ***dev*** environment:

```
{
  "name": "dev",
  "request": "launch",
  "type": "dart",
  "args": [
    "--flavor",
    "dev"
  ]
}
```

# Linter check

- Run `sh ./.code_analyze.sh` before commit.
- Read these for more references [flutter_lint](https://pub.dev/packages/flutter_lints/install)
  , [dart_code_metrics](https://pub.dev/packages/dart_code_metrics).

# Build APK

- `flutter build apk --flavor {flavor_name}`
- For example: `flutter build apk --flavor dev`

# Build IPA without archive on Xcode

- `flutter build ipa --flavor {flavor_name} --export-options-plist=ios/Runner/ExportOptions.plist`
- For
  example: `flutter build ipa --flavor dev --export-options-plist=ios/Runner/ExportOptions.plist`

# Build release with connect usb

- `flutter run --release --flavor "your_flavor" -t lib/"your_main_file_name".dart`
- Example: `flutter run --release --flavor dev -t lib/main.dart`

# Localization

We are using [Easy Localization](https://pub.dev/packages/easy_localization) to handle
multi-languages.
Using [Google Sheet Generator](https://github.com/Hoang-Nguyenn/easy_localization_generator) on
cloud will take less effort for change and update key and value. Only need update in google sheet
file.

### How to set-up google sheet :

- 1 : Create a CSV Google Sheet form like this
  https://docs.google.com/spreadsheets/d/19Q0FdGhHlLVIMUWt7cTDMIz2BiiqTPeNeJBrA4rFQ6M/edit#gid=1013756643

- 2 : Enable share for anyone have this link
- 3 : On *lib/utils/multi-languages/locale_keys.dart* change `docId` in `@SheetLocalization`
  annotation
  with your google sheet docid

  Example of DocID is :
  "https://docs.google.com/spreadsheets/d/1SpiJWFRfJaIRnzpEc0mJ2WaaI9JYlz8jKBPduAPzdXE (it's docId)
  /edit#gid=1013756643"
- 4 : Run `flutter pub run build_runner build` to generate .g.dart localization file
- 5 : When update new value on google sheet should update plus one version on SheetLocalization at
  *locale_keys.dart* and run `flutter packages pub run build_runner build` again to get new file csv

### Convention for naming locale key on google sheet :

- For the text that will be **reused** across our app, the locale key should be `common_{text name}`
  . For example: `common_male`, `common_female` for gender.

- For the text in some specific **screen**, the locale key should be `{screen name}_{text name}`.
  For example: `dashboard_title`, `dashboard_subtitle` or `dashboard_description` for a text
  in `DashboardScreen`.

- The locale key for text that is displayed in **TextField** should follow some naming conventions
  like in this example for `LoginScreen`:
    - TextField label: `login_password_labelText`
    - TextField hintText: `login_password_hintText`
    - TextField errorText: `login_password_exceedLength_errorText`
      , `login_password_required_errorText`, ...

- The locale key for text that is displayed in **SnackBar** should follow some naming conventions
  like in this example for `LoginScreen`: `login_success_message`, `login_password_required_message`
  , `login_biometric_failure_message`, ...

### How to use multi-languages in code :

- Import `multi_languages_utils.dart`

- Using : `LocaleKeys.keyDefine.tr()`  (`tr()` is used to change languages with current languages
  setup, we must have it)

Link library : https://pub.dev/packages/easy_localization

Link plugin generate csv from google
sheet : https://github.com/Hoang-Nguyenn/easy_localization_generator

# How to change version number and version code :

- Go to `pubspec.yaml` => line version to change :
- Example : 1.0.10+3 => Version name : 1.0.10, Version code : 3

# How to change package name

- We using library [change_app_package_name](https://pub.dev/packages/change_app_package_name) for
  easy and fast to change all package name on android and IOS
- Run `flutter pub run change_app_package_name:main {new_package_name}`
- For example : `flutter pub run change_app_package_name:main com.domain.newApp`

# How to use Fastlane

- Require JAVAHOME (JDK 11 https://www.oracle.com/java/technologies/downloads/#java11-mac)
- Install Ruby (https://docs.fastlane.tools/)
- run `script scripts/.setup_fastlane.sh` (First time only)
- `bundle exec fastlane android buildAndroid --env dev` (Dev environment)
- `bundle exec fastlane android distribute --env dev` (Dev environment Distribute)
- `bundle exec fastlane ios buildIOS --env dev` (Dev environment)
- `bundle exec fastlane ios getProvision --env dev` (Get provision dev environment)

# How to initialize Firebase configuration with Flutter flavors
- Install Firebase CLI with npm : `npm install -g firebase-tools`
- Login to firebase account : `firebase login`
- Install FlutterFire CLI with this command : `dart pub global activate flutterfire_cli`
- Initializing Firebase apps with this command: `flutterfire configure -i {package_name} -a {package_name} -o lib/firebase/firebase_options_{flavor}.dart` for each **flavor**.
- For example with **dev** flavor: `flutterfire configure -i com.vmo.c3FlutterTemp.dev -a com.vmo.c3FlutterTemp.dev -o lib/firebase/firebase_options_dev.dart`
# How to notice Tester for new build can be tested

- Increase 1 version (both version name and version code. Ex: 0.0.2+2 => 0.0.3+3) before deliver to
  tester
- Push on release-note.txt file ticket that developer finish on Jira. For example:
    - SangDX: HDM-110,HDM-111
    - TungDX: HDM-213,HDM-211
    - DucPN: HDM-509,HDM-555,HDM-147,HDM-148,HDM-151,HDM-152,
- Note: Update ticket on release note whenever you create PR to finish it, and remove it when it
  move to done on next PR or next sprint.
