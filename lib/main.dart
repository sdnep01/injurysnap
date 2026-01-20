import 'package:flutter/material.dart';
import 'package:injurysnap/core/constants/app_colors.dart';
import 'package:injurysnap/features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(const InjurySnapApp());
}

class InjurySnapApp extends StatelessWidget {
  const InjurySnapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InjurySnap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          surface: AppColors.background,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const SplashScreen(),
    );
  }
}
