import 'package:flutter/material.dart';
import 'package:unsplash_gallery/core/constants/app_strings.dart';
import 'package:unsplash_gallery/features/screens/gallery/view/gallery_screen.dart';
import 'package:unsplash_gallery/features/screens/splash/view/splash_screen.dart';

class Routes {
  static const String splash = "/";
  static const String login = "/login";
  static const String forgot = "/forgot";
  static const String forgotSuccess = "/forgotSuccess";
  static const String dashboard = "/dashboard";
  static const String galleryScreen = "/galleryScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
            builder: (_) => SplashScreen(), settings: routeSettings);

      case Routes.galleryScreen:
        return MaterialPageRoute(
            builder: (_) => const GalleryScreen(), settings: routeSettings);

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noPageFound),
        ),
        body: const Center(
          child: Text(AppStrings.noPageFound),
        ),
      ),
    );
  }
}
