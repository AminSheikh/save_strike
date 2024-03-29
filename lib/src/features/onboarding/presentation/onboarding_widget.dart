import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../domain/onboarding_item.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.onboardingItem,
  });

  final OnboardingItem onboardingItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 25),
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              height: 465,
              fit: BoxFit.contain,
              onboardingItem.imagePath,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    Color.fromRGBO(1, 138, 190, 1),
                    Color.fromRGBO(2, 69, 122, 1)
                  ],
                ).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      onboardingItem.text,
                      textStyle: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "MarkPro"
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 50),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
