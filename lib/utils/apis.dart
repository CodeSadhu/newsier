import 'package:news_app/utils/credentials.dart';

class Apis {
  Apis._();

  // example url: https://newsapi.org/v2/top-headlines?country=us&apiKey="API_KEY_HERE"

  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _type = 'top-headlines';
  static const String _countryCode = 'in';
  static String latestNews =
      '$_baseUrl/$_type?country=$_countryCode&apiKey=${Credentials.apiKey}';
}
