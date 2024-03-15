import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:save_strike/src/routing/bottom_navigation_screen.dart';

import '../features/favorite/presentation/favorite_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter(ref));

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter(this.ref);
  final ProviderRef<Object?> ref;
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnboardingRoute.page,
        ),
        AutoRoute(
          page: BottomNavigationRoute.page,
          guards: [
            AuthGuard(ref),
          ],
          initial: true,
          children: [
            AutoRoute(path: 'favorite', page: FavoriteRoute.page),
            AutoRoute(path: 'goal', page: FavoriteRoute.page),
            AutoRoute(path: 'shop', page: FavoriteRoute.page),
          ],
        )
      ];
}
