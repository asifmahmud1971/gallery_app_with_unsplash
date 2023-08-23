import '../../core/app/app_flavor.dart';

class ApiUrls {
  static String baseUrl = getServerUrl();
  static const String liveUrl = 'https://api.unsplash.com/'; //live server
  static const String devUrl = 'https://api.unsplash.com/'; // dev server
  static const String testUrl = 'https://api.unsplash.com/'; // test server

  // get current flavor url
  static String getServerUrl() {
    if (AppFlavor.getFlavor == FlavorStatus.production) {
      return liveUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.development) {
      return devUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.staging) {
      return testUrl;
    } else {
      return liveUrl;
    }
  }

  // api url name start here //
  static const String login = 'login';
  static const String photos = 'photos';
  static const String forgot = 'forgot-password';
  static const String otpCheck = 'verify-token';
  static const String resetPassword = 'reset-password';
  static const String logout = 'logout';
  static const String dashboard = 'dashboard-chart';
  static const String termin = 'termin';

  static String terminHistory(id) {
    return "termin/$id/history";
  }

  static String editDetails(id) {
    return "termin/$id/continue-workflow";
  }

  static const String filter = 'filter-options';
  static const String terminFilter = termin + '/' + filter;
}
