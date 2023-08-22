import 'package:flutter/material.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/screens/auth/view/forgot_page.dart';
import 'package:terminator/features/screens/auth/view/forgot_success.dart';
import 'package:terminator/features/screens/auth/view/login_page.dart';
import 'package:terminator/features/screens/dashboard/view/dashboard_screen.dart';
import 'package:terminator/features/screens/splash/view/splash_screen.dart';
import 'package:terminator/features/screens/termine/view/termine_screen.dart';

class Routes {
  static const String splash = "/";
  static const String login = "/login";
  static const String forgot = "/forgot";
  static const String forgotSuccess = "/forgotSuccess";
  static const String dashboard = "/dashboard";
  static const String termineScreen = "/termineScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
            builder: (_) => SplashScreen(), settings: routeSettings);

      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => LoginPage(), settings: routeSettings);

      case Routes.forgot:
        return MaterialPageRoute(
            builder: (_) => ForgotPage(), settings: routeSettings);

      case Routes.forgotSuccess:
        return MaterialPageRoute(
            builder: (_) => ForgotSuccess(), settings: routeSettings);

      case Routes.dashboard:
        return MaterialPageRoute(
            builder: (_) => const DashboardScreen(), settings: routeSettings);

      case Routes.termineScreen:
        return MaterialPageRoute(
            builder: (_) => const TermineScreen(), settings: routeSettings);

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
