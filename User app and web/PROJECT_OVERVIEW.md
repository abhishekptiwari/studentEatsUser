# StackFood Multivendor – Project Overview

## Project Snapshot
- **Platform targets:** Android, iOS, Web (Flutter 3.35.2; Dart SDK \>= 3.2.0)
- **App focus:** Consumer-facing food ordering experience for a multivendor marketplace powered by the StackFood backend (`https://stackfood-admin.6amtech.com`).
- **State management / DI:** GetX (`GetMaterialApp`, controllers, dependency graph built in `lib/helper/get_di.dart`).
- **Feature coverage:** Discovery, cart, checkout, dine-in, loyalty, wallet, chat, notifications, referral, multilingual UI, and account management.
- **UI assets:** Distributed under `assets/image`, localization packs in `assets/language`, and shared themes in `lib/theme`.

## Architecture & Code Layout
- **Entry point:** `lib/main.dart` bootstraps Firebase, GetX navigation, theming, deep links, and notification setup. Web builds auto-login guests and preload config.
- **Layering pattern:** Each domain feature follows `controllers → services → repositories → data source` separation. Repositories abstract API access (REST via `lib/api/api_client.dart`), services encapsulate business rules, controllers expose observable state to the UI.
- **Networking:** REST endpoints defined centrally in `lib/util/app_constants.dart`. `MyHttpOverrides` allows self-signed certificates for mobile development; remove or guard in production.
- **Local data:** Uses `shared_preferences` for lightweight persistence and `drift` for structured local storage. Ensure migrations are maintained when schema changes.
- **Routing & UI:** `lib/helper/route_helper.dart` enumerates named routes consumed by `GetMaterialApp`. Feature-specific screens live in `lib/features/<feature>/presentation`.
- **Responsive design:** `ResponsiveHelper` differentiates web, desktop, tablet, and phone layouts; `CookiesViewWidget` handles GDPR banner for web.

## External Services & SDKs
- **Firebase:** `firebase_core`, `firebase_messaging`, `firebase_auth`, optional Crashlytics (commented). Configure `google-services.json`, `GoogleService-Info.plist`, and `firebase_options.dart` (FlutterFire CLI) per environment.
- **Push notifications:** FCM + `flutter_local_notifications`. Background handling wired through `NotificationHelper`.
- **Maps & location:** `google_maps_flutter`, `google_maps_flutter_web`, `geolocator`, `location`, `permission_handler`, `custom_map_markers`. Requires Google Maps API keys and location permissions configuration on each platform.
- **Social auth:** Google, Facebook, Apple sign-in packages. Populate platform-specific client IDs and entitlements before enabling.
- **Media & interactivity:** `image_picker`, `chewie`/`video_player`, `photo_view`, `file_picker`, `flutter_widget_from_html_core`.
- **Web deployment:** Sample Nginx config in `default.conf`; adjust root path and caching headers for production hosting.

## Environment & Tooling Requirements
- Install Flutter SDK 3.35.2 and matching Dart SDK.
- Android: Android Studio (latest command-line tools), an Android 14 (API 34) SDK image, and a configured emulator or device with USB debugging.
- iOS: Xcode 15+, CocoaPods, and an Apple Developer account for provisioning.
- Web: Chrome or Chromium for dev, Node optional (only for hosting). Configure CORS on backend for web origin.
- Backend: Access to a StackFood Admin instance; update base URLs in `AppConstants` when pointing to custom environments.

## Setup Steps
1. **Clone & install packages**
   ```bash
   flutter pub get
   ```
2. **Configure Firebase**
   ```bash
   flutterfire configure --project <your-firebase-project>
   ```
   - Place the generated files in `android/app`, `ios/Runner`, and `lib/firebase_options.dart`.
3. **Set Google Maps keys**
   - Android: add `meta-data` entries in `android/app/src/main/AndroidManifest.xml`.
   - iOS: update `ios/Runner/AppDelegate.swift` and `Info.plist`.
   - Web: add `<script src="https://maps.googleapis.com/maps/api/js?...">` with API key in `web/index.html`.
4. **Configure social login**
   - Google: update reversed client ID in iOS `Info.plist` and `android/app/google-services.json`.
   - Facebook: set `appId` and `clientToken` in native manifests and `.plist`. Ensure `FacebookAuth.instance.webAndDesktopInitialize` values match.
   - Apple: enable Sign in with Apple capability for iOS/macOS targets.
5. **App settings**
   - Review `lib/util/app_constants.dart` for API endpoints, versioning, and feature toggles (`payInWebView`, `webHostedUrl`, `default language`).
   - Populate `assets/language` if adding locales; adjust `AppConstants.languages`.

## Running the Project
- **Android**
  ```bash
  flutter run -d android
  ```
  Ensure an emulator/device is attached and Google Play Services are available for Maps.
- **iOS**
  ```bash
  flutter run -d ios
  ```
  Run `cd ios && pod install` after dependency updates. Use an actual device for Apple/Google sign-in.
- **Web**
  ```bash
  flutter run -d chrome
  ```
  For production builds, run `flutter build web` and deploy using the provided Nginx template or your hosting solution.

## Testing & Quality
- Execute the Flutter test suite:
  ```bash
  flutter test
  ```
- Recommended additions:
  - Unit tests covering controllers/services (GetX logic, API parsing).
  - Integration tests for authentication and checkout flows (consider `integration_test` package).
  - Golden tests for critical widgets to stabilize UI across updates.
- CI suggestions: GitHub Actions or Bitrise workflows that run `flutter format`, `flutter analyze`, `flutter test`, and platform builds.

## Brainstorm & Next Steps
- Harden configuration management (per-environment `AppConstants`, secrets via `.env` or build-time injection).
- Enable Firebase Crashlytics and Analytics for monitoring, along with performance tracing on API-heavy screens.
- Implement offline fallbacks leveraging `drift` for frequently accessed entities (menus, cart).
- Review certificate override (`MyHttpOverrides`) and gate it behind debug flags to avoid bypassing TLS checks in production.
- Expand localization coverage by validating `assets/language` JSONs and adding RTL testing.
- Create UX flows for guest-to-auth user upgrades, wallet recharge, and loyalty reward redemption; script regression tests.
- Automate release pipelines (Play Console, App Store Connect, web hosting) with version bumping tied to `AppConstants.appVersion`.
- Document backend prerequisites (StackFood Admin version, required seeds) for new developers or deployment environments.

