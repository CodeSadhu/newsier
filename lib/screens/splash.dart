import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/utils/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the home screen when animation is completed.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animationController,
          child: SvgPicture.asset(Assets.newsGraphic),
        ),
      ),
    );
  }
}
