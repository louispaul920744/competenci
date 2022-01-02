import 'dart:async';

import 'package:competenci/configs/app_constants.dart';
import 'package:competenci/views/screens/login_screen/login_screen.dart';
import 'package:competenci/views/screens/onboarding_screen/pages/onboard_pages.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final onboardKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: onboardKey,
      globalBackgroundColor: AppColors.kCulturedWhite,
      pages: onboardPages,
      showSkipButton: false,
      showDoneButton: true,
      showNextButton: true,
      next: Text(
        'Next',
        style: Theme.of(context).textTheme.button,
      ),
      done: MaterialButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        ),
        color: AppColors.kDarkRed,
        textColor: Colors.white,
        child: const Text(
          "Continue",
        ),
      ),
      onDone: () {},
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
