import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

final List<PageViewModel> onboardPages = [
  PageViewModel(
    title: "Onboarding 1",
    image: Image.asset(
      'assets/images/logo.png',
      width: 300,
    ),
    body: "Onboarding Content",
    decoration: const PageDecoration(
      bodyTextStyle: TextStyle(
        color: Colors.white70,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white70,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
      ),
    ),
  ),
  PageViewModel(
    title: "Onboarding 2",
    decoration: const PageDecoration(
      bodyTextStyle: TextStyle(
        color: Colors.white70,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white70,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
      ),
    ),
    image: Image.asset(
      'assets/images/logo.png',
      width: 300,
    ),
    body: "Onboarding Content",
  ),
  PageViewModel(
    title: "Onboarding 3",
    image: Image.asset(
      'assets/images/logo.png',
      width: 300,
    ),
    body: "Onboarding Content",
    decoration: const PageDecoration(
      bodyTextStyle: TextStyle(
        color: Colors.white70,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white70,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
      ),
    ),
  ),
];
