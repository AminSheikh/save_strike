import 'package:flutter/material.dart';

class OnboardingItem {
 const  OnboardingItem({
  required this.imagePath,
  required this.text,
  required this.backgroundColor,
 });
 final String imagePath;
 final String text;
 final Color backgroundColor;
}