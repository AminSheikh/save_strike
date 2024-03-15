import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:save_strike/src/routing/app_router.dart';

import '../../features/authentication/data/auth_repository.dart';


class AuthGuard extends AutoRouteGuard {
  AuthGuard(this.ref);
  final ProviderRef<Object?> ref;
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // let's assume that user is authenticated
    final authenticated = ref.read(authRepositoryProvider).authenticated;
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (authenticated ) {
      // if user is authenticated, continue
      resolver.next(true);
    } else {
      router.replace(OnboardingRoute());
    }
  }
}
