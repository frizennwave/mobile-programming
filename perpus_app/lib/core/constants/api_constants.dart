import 'package:flutter/foundation.dart';

class ApiConstants {
  static String get baseUrl {
    const override = String.fromEnvironment('API_BASE_URL');
    if (override.isNotEmpty) return override;
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.3.2/api';
    }
    return 'http://localhost/api';
  }

  static const int perPage = 15;

  static const String register = '/register';
  static const String login = '/login';
  static const String logout = '/logout';
  static const String me = '/me';
  static const String books = '/books';
}
