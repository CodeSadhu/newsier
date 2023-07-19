import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/utils/credentials.dart';

// Create a data model for the news article

class NewsProvider with ChangeNotifier {
  // Replace YOUR_API_KEY with your actual News API key.
  final String _apiKey = Credentials.apiKey;
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines';
  final String _country = 'in';
  final Dio dio = Dio();

  bool _isFetching = true;

  bool get isFetching => _isFetching;

  News? _news;

  News? get news => _news;

  Future<void> fetchNews() async {
    try {
      final response = await dio.get(
        '$_baseUrl?country=$_country&apiKey=$_apiKey',
      );

      if (response.statusCode == 200) {
        _isFetching = false;
        _news = News.fromJson(response.data);
        notifyListeners();
      } else {
        _isFetching = false;
        throw Exception('Failed to fetch news');
      }
    } catch (error) {
      _isFetching = false;
      throw Exception('Error: $error');
    }
  }
}
