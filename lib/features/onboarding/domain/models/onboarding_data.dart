import 'package:flutter/material.dart';

class OnboardingData {
  final String title;
  final String description;
  final String stepTitle;
  final int stepNumber;
  final IconData topIcon;
  final List<OnboardingItem> items;

  OnboardingData({
    required this.title,
    required this.description,
    required this.stepTitle,
    required this.stepNumber,
    required this.topIcon,
    required this.items,
  });
}

class OnboardingItem {
  final String text;
  final IconData icon;
  final Color? iconColor;

  OnboardingItem({required this.text, required this.icon, this.iconColor});
}
