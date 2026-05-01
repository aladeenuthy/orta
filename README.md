# Orta Shift Manager

Flutter worker app for Orta Shift Manager. It covers the worker-facing assessment flow: authentication, OTP verification, profile setup, dashboard, assigned and ongoing shifts, shift details, clock in/out, availability, unavailability, marketplace, and reset-password deep links.

## Demo Video

View the app flow recording here:

https://drive.google.com/file/d/17mNS0NApjt0ybzATXLYmh5QlllX9eDjT/view?usp=share_link

## Tech Stack

- Flutter 3.32.x / Dart 3.8.x
- Feature-based Clean Architecture
- `flutter_bloc` for Cubit/Bloc state management
- `freezed` and `json_serializable` for immutable models and states
- `get_it` for service location
- `dio` for networking
- `flutter_secure_storage` for JWT storage
- `flutter_dotenv` for environment config
- `app_links` for reset-password deep links
- `geolocator` for device GPS access
- `pin_code_fields` for OTP input
- Poppins app font

## Clone And Install

```bash
git clone <repo-url>
cd orta
flutter pub get
```

If generated files are stale after pulling, regenerate them:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Run checks:

```bash
flutter analyze
flutter test
```

## Environment Variables

Create a `.env` file in the project root:

```env
API_BASE_URL=http://localhost:8000/api
API_BASE_URL_ANDROID=http://10.0.2.2:8000/api
GOOGLE_MAPS_API_KEY=<your-google-static-maps-key>
```

Variable notes:

| Variable | Purpose |
| --- | --- |
| `API_BASE_URL` | Base API URL for iOS simulator and local desktop-style access. |
| `API_BASE_URL_ANDROID` | Base API URL for Android emulator. Android emulators use `10.0.2.2` to reach your machine's `localhost`. |
| `GOOGLE_MAPS_API_KEY` | Required to view the Google Maps preview on the shift detail screen. Add a valid Google Maps API key with Static Maps API enabled. |

`.env` is registered as an asset in `pubspec.yaml`, so run `flutter pub get` after adding or changing it.

For a physical device, replace both API URLs with your machine LAN IP:

```env
API_BASE_URL=http://192.168.1.50:8000/api
API_BASE_URL_ANDROID=http://192.168.1.50:8000/api
```

## Backend Assumptions

The app assumes the backend is running on port `8000` and that the base URL ends with `/api`.

Expected behavior:

- Auth endpoints return a JWT token and user object where applicable.
- The JWT is stored in secure storage.
- Dio injects `Authorization: Bearer <token>` on authenticated requests.
- A `401` response clears the local token and redirects to Login.
- Profile completion and email verification are checked from the authenticated dashboard flow.
- Shift `startTime` and `finishTime` should use the backend formatted `HH:mm` fields when available to avoid timezone shifts from reparsing raw ISO dates.
- Reset-password links use the app scheme: `orta://app/reset-password`.

## Run The App

Start the backend first, then run the Flutter app.

iOS simulator:

```bash
flutter run -d ios
```

Android emulator:

```bash
flutter run -d android
```

After native config changes, such as Android manifest or iOS plist updates, do a clean reinstall:

```bash
flutter clean
flutter pub get
flutter run
```

## Android Setup Notes

This project uses the following Android config in `android/app/build.gradle.kts`:

```kotlin
android {
    // Any installed NDK version >= 27 should work.
    ndkVersion = "30.0.14904198"

    defaultConfig {
        minSdk = 24
    }
}
```

Why this matters:

- `minSdk = 24` keeps the Android dependency set compatible.
- The plugins need an Android NDK version `>= 27`.
- `30.0.14904198` is the version currently set in this repo, but it is not a strict requirement. If you already have another NDK version `27` or newer installed, you can use that version instead.

If Gradle reports that the NDK is missing:

1. Open Android Studio.
2. Go to `Settings > Languages & Frameworks > Android SDK > SDK Tools`.
3. Enable `NDK (Side by side)`.
4. Install any NDK version `27` or newer.
5. Set `ndkVersion` in `android/app/build.gradle.kts` to the installed version.
6. Run `flutter clean`, then `flutter pub get`.

Android reset-password deep link:

```text
orta://app/reset-password?uid=<user-id>&token=<reset-token>
```

Test with:

```bash
adb shell 'am start -W -a android.intent.action.VIEW -d "orta://app/reset-password?uid=<user-id>&token=<reset-token>"'
```

The single quotes matter. Without them, the shell can treat `&token=...` as a separate command and the app will receive only the partial URL.

## iOS Setup Notes

iOS custom URL scheme is configured in `ios/Runner/Info.plist`.

Test on a booted simulator:

```bash
xcrun simctl openurl booted "orta://app/reset-password?uid=<user-id>&token=<reset-token>"
```

The app uses `app_links`, and Flutter's built-in deep linking is disabled in native config to avoid duplicate handling.

If pods are stale:

```bash
cd ios
pod install
cd ..
```

## Reset Password Flow

Expected flow:

1. User receives a reset link from the backend email flow.
2. Link opens the app through `orta://app/reset-password?...`.
3. The app routes to `ResetPasswordScreen`.
4. On successful reset, any cached auth session is cleared.
5. User is redirected to Login.

This is intentional even if the user was already authenticated, because password reset should invalidate the local session.

## Project Architecture

The app follows feature-based Clean Architecture:

```text
lib/
  core/
  features/
    auth/
    home/
    profile/
    shifts/
```

Feature structure:

```text
data/
domain/
presentation/
```

Project rules:

- Presentation calls Cubits/Blocs.
- Cubits/Blocs call domain services.
- Services call repositories.
- Repositories call remote data sources.
- Remote data sources extend `BaseAppRepository` and use `makeRequest`.
- Domain models are used directly; there is no DTO layer.
- Shared exports are available through `lib/features/features.dart`.
- Navigation uses Flutter Navigator and named routes.

### Architecture Rationale

The project still follows Clean Architecture and separation of concerns, but keeps the implementation intentionally lean for the assessment scope.

Services are used instead of one-class-per-use-case files because most flows are small and closely related. For example, auth actions live together in an auth service, shift actions live together in a shift service, and profile actions live together in profile services. This keeps business logic in the domain layer, keeps Cubits/Blocs free of API details, and avoids a large number of tiny use-case classes that would add ceremony without much value for this app.

Domain models are used directly instead of adding DTOs because the backend response shape is already close to the app's domain shape. Avoiding DTOs reduces mapping boilerplate and keeps parsing easy to follow. The boundary is still preserved: API parsing happens in the data layer, repositories expose domain results, services coordinate business behavior, and presentation only reacts to state.

## Completed Core Features

- Register
- Login
- Forgot password
- Reset password with deep link support
- Secure JWT storage
- Dio Authorization interceptor
- Global `401` handling with logout and redirect
- Dashboard
- Assigned shifts
- Ongoing shifts
- See-all shift lists
- Shift detail
- Clock in
- Clock out
- Server-side location verification before clock in/out
- Pull to refresh
- Infinite scroll/load more

## Completed Bonus Items

- Bonus A: Email OTP verification
- Bonus B: Profile-building onboarding flow
- Bonus C: Availability setting
- Bonus D: Unavailability management
- Bonus E: Shift marketplace
- Bonus F: Server-side geo-fence verification integration
- Animated transitions
- Unit tests for implemented business/data/service/cubit flows


## Marketplace

The Market tab lets workers browse open shifts.

Implemented behavior:

- Backend-backed marketplace list.
- Pagination/load more.
- Date filter.
- Role dropdown filter.
- Shift type chips.
- Claim confirmation dialog.
- Claim endpoint call.
- Success toast and refresh after claim.

Expected backend endpoint:

```text
GET /api/shifts/marketplace?page=1&limit=10&role=Nurse&typeOfShift=Morning&date=2026-05-01
PATCH /api/shifts/:id/claim
```

## Shift Detail And Geo-Fence

Clock-in/clock-out uses the existing local timing rules and calls the backend location verification endpoint before making the clock action request.

Expected backend endpoint:

```text
POST /api/shifts/:id/verify-location
```

Request:

```json
{
  "latitude": 53.4808,
  "longitude": -2.2426
}
```

The app displays backend geo-fence error messages directly through the app error handling layer when the worker is outside the required radius.

## Profile, Availability, And Unavailability

Profile flow:

- OTP verification runs before dashboard access when email is unverified.
- Profile setup runs before dashboard access when profile is incomplete.
- Phone, city, role, and skills are saved together at the end of the profile setup flow.
- Profile image picking is preview-only for now because the backend currently accepts a URL and does not provide an upload endpoint.

Availability:

- Weekly recurring template.
- Monday through Sunday rows.
- Toggles mark general availability.
- Saved through the availability endpoint.

Unavailability:

- Specific date ranges.
- Optional reason.
- Existing ranges are listed and can be deleted.
- Calendar highlights unavailable ranges.

## Useful Commands

Format:

```bash
dart format lib test
```

Analyze:

```bash
flutter analyze
```

Run all tests:

```bash
flutter test
```

Regenerate `freezed` and JSON files:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Troubleshooting

Android emulator cannot reach backend:

- Use `API_BASE_URL_ANDROID=http://10.0.2.2:8000/api`.

Reset-password deep link opens without token on Android:

- Quote the full command with single quotes, or escape `&` as `\&`.

Static map returns `403`:

- Check that the Google Static Maps API is enabled.
- Check API key restrictions.
- Replace demo keys with a valid key for the current app/package.

Native deep-link changes do not apply:

- Fully uninstall the app from the simulator/emulator.
- Run `flutter clean`.
- Reinstall with `flutter run`.

Generated files are missing:

- Run `flutter pub run build_runner build --delete-conflicting-outputs`.

## Trade-Offs

- Google Static Maps is used for shift location preview instead of a fully interactive map widget. This keeps the shift detail screen lighter and avoids extra native map setup.
- Device GPS is still used to send coordinates, but the final geo-fence decision now comes from the backend verification endpoint.
- Profile image upload is not implemented because the backend currently accepts `profilePictureUrl` only.
- Availability is treated as a recurring weekly template. Unavailability is a separate specific-date range feature.
- Non-assessment tabs can stay lightweight unless their backend/UI scope is added later.
