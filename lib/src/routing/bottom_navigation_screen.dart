import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_strike/src/routing/app_router.dart';
import 'package:save_strike/src/style/custom_icons/save_strike_icons.dart';

@RoutePage()
class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        FavoriteRoute(),
        FavoriteRoute(),
        FavoriteRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          selectedItemColor: Color.fromRGBO(36, 216, 241, 1),
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            HapticFeedback.lightImpact();
            tabsRouter.setActiveIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Favoriten',
              icon: Icon(SaveStrikeIcons.favorite_icon),
            ),
            BottomNavigationBarItem(
              label: 'Goals',
              icon: Icon(SaveStrikeIcons.goals_icon),
            ),
            BottomNavigationBarItem(
              label: 'Shopping',
              icon: Icon(SaveStrikeIcons.shopping_icon),
            ),
          ],
        );
      },
    );
  }
}
