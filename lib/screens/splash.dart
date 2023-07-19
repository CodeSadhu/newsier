import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/utils/assets.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/styles.dart';

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
      duration: const Duration(milliseconds: 3000),
    )..forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 30,
        ),
        child: Center(
          child: FadeTransition(
            opacity: _animationController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.newsGraphic,
                  height: 150,
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Newsier',
                  style: Styles.extraLarge(
                    color: ColorPalette.primary,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'News, revolutionized',
                  style: Styles.bodyLarge(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
