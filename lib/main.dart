import 'package:competenci/configs/app_constants.dart';
import 'package:competenci/views/screens/splash_screen/intro_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CompetenciApp());
}

class CompetenciApp extends StatelessWidget {
  const CompetenciApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Competenci App",
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
        primaryColor: AppColors.kPrimaryColor,
        brightness: Brightness.light,
      ),
      home: const SplashScreen(),
    );
  }
}
