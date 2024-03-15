import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/favorite_group.dart';
part 'favorite_repository.g.dart';

class FavoriteRepository {
  Future<List<FavoriteGroup>> getFavoriteGroups() async {
    final String favoriteGroupsMockData =
        await rootBundle.loadString('assets/json/favorites.json');

    final List<FavoriteGroup> favoriteGroups =
        _parseFavoriteGroups(favoriteGroupsMockData);
    print(favoriteGroups);
    return favoriteGroups;
  }

  List<FavoriteGroup> _parseFavoriteGroups(String jsonString) {
    final List<Map<String,dynamic>> parsed = (json.decode(jsonString) as List).cast<Map<String, dynamic>>();
    return parsed.map<FavoriteGroup>((json) => FavoriteGroup.fromMap(json))
        .toList();
  }
}

@Riverpod(keepAlive: true)
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref) {
  return FavoriteRepository();
}

