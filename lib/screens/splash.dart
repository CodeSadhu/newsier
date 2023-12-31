import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/screens/mobile/mobile.dart';
import 'package:news_app/screens/web/web.dart';
import 'package:news_app/utils/assets.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/responsive.dart';
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
      duration: const Duration(milliseconds: 2000),
    )..forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Responsive(
              mobile: HomeScreen(),
              desktop: WebScreen(),
            ),
          ),
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
                  'News, easier to read',
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
