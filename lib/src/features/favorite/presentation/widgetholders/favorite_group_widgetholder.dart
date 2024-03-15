import 'package:flutter/material.dart';
import 'package:save_strike/src/interfaces/list_item.dart';

import '../../domain/favorite_group.dart';
import '../widgets/favorite_group_widget.dart';

class FavoriteGroupWidgetholder extends ListItem {
  FavoriteGroupWidgetholder({
    required this.favoriteGroup,
  });
  final FavoriteGroup favoriteGroup;

  Widget build() {
    return FavoriteGroupWidget(
      favoriteGroup: favoriteGroup,
    );
  }
}
