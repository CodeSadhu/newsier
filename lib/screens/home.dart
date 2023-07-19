import 'package:flutter/material.dart';
import 'package:news_app/utils/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Homescreen',
          style: Styles.bodyLarge(),
        ),
      ),
    );
  }
}
