import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:save_strike/src/interfaces/list_item.dart';

import '../data/favorite_repository.dart';
import 'widgetholders/add_favorite_group_widgetholder.dart';
import 'widgetholders/favorite_group_widgetholder.dart';
part 'favorite_screen_controller.g.dart';

@riverpod
class FavoriteScreenController extends _$FavoriteScreenController {
  @override
  FutureOr<List<ListItem>> build() async {
    final List<ListItem> favoriteGroupItemList = [];
    state = const AsyncLoading();
    final repository = ref.read(favoriteRepositoryProvider);
    final favoriteGroupList = await repository.getFavoriteGroups();
        favoriteGroupItemList.addAll(favoriteGroupList.map((favoriteGroup) =>
            FavoriteGroupWidgetholder(favoriteGroup: favoriteGroup)));
    favoriteGroupItemList.add(AddFavoriteGroupWidgetholder());
    return favoriteGroupItemList;
  }

  Future<void> getFavorites() async {
    final repository = ref.read(favoriteRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        final List<ListItem> favoriteGroupItemList = [];
        await Future.delayed(Duration(seconds: 1));
        final favoriteGroupList = await repository.getFavoriteGroups();
        favoriteGroupItemList.addAll(favoriteGroupList.map((favoriteGroup) =>
            FavoriteGroupWidgetholder(favoriteGroup: favoriteGroup)));
        favoriteGroupItemList.add(AddFavoriteGroupWidgetholder());
        return favoriteGroupItemList;
      },
    );
  }
}
