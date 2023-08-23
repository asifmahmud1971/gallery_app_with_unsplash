# Unsplash-Gallery

---

## Getting Started 🚀

<a href="https://drive.google.com/file/d/18J-MQETOnIx6tCR9Vk2keFsVe3Lj73rd/view?usp=sharing">
<img height="60" src="https://tecmanic.com/envato/android-app.png">
</a>

App features

   - Photo Gallery App with infinite scroll pagination
   - Unsplash API for fetching photos.
   - User has an infinite scroll on the gallery screen
   - Cache Images and API responses
   - Allow saving photos


This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart
$ flutter build apk --flavor development --target lib/main_development.dart
$ flutter build appbundle --flavor development --target lib/main_development.dart


# Staging
$ flutter run --flavor staging --target lib/main_staging.dart
$ flutter build apk --flavor staging --target lib/main_staging.dart
$ flutter build appbundle --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
$ flutter build apk --flavor production --target lib/main_production.dart
$ flutter build appbundle --flavor production --target lib/main_production.dart

```




