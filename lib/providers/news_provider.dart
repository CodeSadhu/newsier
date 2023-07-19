import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';

// Create a data model for the news article

class NewsProvider with ChangeNotifier {
  // Replace YOUR_API_KEY with your actual News API key.
  static const String _apiKey = 'YOUR_API_KEY';
  static const String _baseUrl = 'https://newsapi.org/v2/top-headlines';
  static const String _country = 'us';
  Dio dio = Dio();

  News? _news;

  News? get news => _news;

  Future<void> fetchNews() async {
    try {
      final response = await dio.get(
        '$_baseUrl?country=$_country&apiKey=$_apiKey',
      );

      if (response.statusCode == 200) {
        _news = News.fromJson(response.data);

        notifyListeners();
      } else {
        throw Exception('Failed to fetch news');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
