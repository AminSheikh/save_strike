import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:save_strike/src/features/favorite/presentation/favorite_screen_controller.dart';
import 'package:save_strike/src/features/favorite/presentation/widgetholders/add_favorite_group_widgetholder.dart';
import 'package:save_strike/src/routing/app_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../authentication/data/auth_repository.dart';
import 'favorite_screen_header_delegate.dart';
import 'widgetholders/favorite_group_widgetholder.dart';

@RoutePage()
class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteScreenController =
        ref.watch(favoriteScreenControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Text(
              "Hallo,",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontFamily: 'MarkPro',
              ),
            ),
            Text(
              " Anton",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: 'MarkPro',
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              HapticFeedback.heavyImpact();
              ref.read(authRepositoryProvider).authenticated = false;
              AutoRouter.of(context).replace(const OnboardingRoute());
            },
            child: Container(
              height: 40,
              width: 40,
              child: CircleAvatar(
                backgroundImage: Image.asset(
                  "./assets/jpg/profile.jpg",
                  fit: BoxFit.contain,
                ).image,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: RefreshIndicator(
        edgeOffset: 80,
        onRefresh: () async {
          await ref
              .read(favoriteScreenControllerProvider.notifier)
              .getFavorites();
        },
        color: Colors.grey[800],
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: FavoriteScreenHeaderDelegate(),
              floating: true,
            ),
            switch (favoriteScreenController) {
              AsyncData(:final value) => SliverPadding(
                  padding: EdgeInsets.all(20),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 164 / 262,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final favoriteGroupListItem = value[index];
                        if (favoriteGroupListItem
                            is AddFavoriteGroupWidgetholder) {
                          return favoriteGroupListItem.build();
                        } else if (favoriteGroupListItem
                            is FavoriteGroupWidgetholder) {
                          return favoriteGroupListItem.build();
                        }
                      },
                      childCount: value.length,
                    ),
                  ),
                ),
              AsyncError(:final error) => SliverToBoxAdapter(
                  child: Container(
                    height: 200,
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Error: $error',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'MarkPro',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              _ => SliverPadding(
                  padding: EdgeInsets.all(20),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 164 / 262,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Shimmer.fromColors(
                          baseColor: Color.fromRGBO(36, 216, 241, 0.2),
                          highlightColor: Color.fromRGBO(36, 216, 241, 0.1),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      },
                      childCount: 6,
                    ),
                  ),
                ),
            },
          ],
        ),
      ),
    );
  }
}
