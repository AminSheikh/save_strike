import 'package:auto_route/auto_route.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:save_strike/src/features/onboarding/domain/onboarding_item.dart';
import 'package:save_strike/src/features/onboarding/presentation/onboarding_widget.dart';
import 'package:save_strike/src/routing/app_router.dart';

import '../../authentication/data/auth_repository.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingItem> onboardingList = [
    OnboardingItem(
      imagePath: "./assets/png/onboarding/1.png",
      text: "Alle Favoriten an einem Ort. Einfach abspeichern.",
      backgroundColor: Color.fromRGBO(241, 250, 227, 1),
    ),
    OnboardingItem(
      imagePath: "./assets/png/onboarding/2.png",
      text: "Plane deine Käufe.\nEinfach und übersichtlich.",
      backgroundColor: Color.fromRGBO(226, 247, 250, 1),
    ),
    OnboardingItem(
      imagePath: "./assets/png/onboarding/3.png",
      text: "Träume wahr werden lassen.\nSpare auf deine Goals.",
      backgroundColor: Color.fromRGBO(250, 231, 227, 1),
    ),
    OnboardingItem(
      imagePath: "./assets/png/onboarding/4.png",
      text: "Sicher bezahlen.\nCashback erhalten.",
      backgroundColor: Color.fromRGBO(244, 245, 250, 1),
    ),
  ];
  int currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  color: onboardingList[currentIndexPage].backgroundColor,
                  child: PageView.builder(
                    itemCount: onboardingList.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndexPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final onboardingItem = onboardingList[index];
                      return OnboardingWidget(onboardingItem: onboardingItem);
                    },
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: DotsIndicator(
                      dotsCount: onboardingList.length,
                      position: currentIndexPage,
                      decorator: DotsDecorator(
                        spacing: EdgeInsets.all(4.0),
                        size: const Size.square(4.0),
                        activeSize: const Size(20.0, 4.0),
                        activeColor: Color.fromRGBO(36, 216, 241, 1),
                        color: Color.fromRGBO(151, 202, 219, 1),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              return Container(
                height: 164,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        ref.read(authRepositoryProvider).authenticated = true;
                        AutoRouter.of(context).replace(
                          const BottomNavigationRoute(),
                        );
                      },
                      child: Text(
                        "Anmelden",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(36, 216, 241, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 56,
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromRGBO(36, 216, 241, 1),
                        child: TextButton(
                          style: ButtonStyle(),
                          onPressed: () {
                            HapticFeedback.heavyImpact();
                            ref.read(authRepositoryProvider).authenticated =
                                true;
                            AutoRouter.of(context).replace(
                              const BottomNavigationRoute(),
                            );
                          },
                          child: Text(
                            "Kostenlos registrieren",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
