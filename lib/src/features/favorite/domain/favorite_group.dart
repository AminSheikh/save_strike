import 'package:save_strike/src/features/favorite/domain/favorite.dart';

class FavoriteGroup {
  const FavoriteGroup({
    required this.id,
    required this.favorites,
    required this.groupName,
    required this.numberOfElements,
  });
  final String? id;
  final List<Favorite>? favorites;
  final String? groupName;
  final int? numberOfElements;

  factory FavoriteGroup.fromMap(
    Map<dynamic, dynamic> value,
  ) {
    return FavoriteGroup(
      id: value['id'] as String?,
      favorites: (value['favorites'] as List<dynamic>?)
          ?.map((e) => Favorite.fromMap(e as Map<String, dynamic>))
          .toList(),
      groupName: value['groupName'] as String?,
      numberOfElements: value['numberOfElements'] as int?,

    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'favorites': favorites,
      'groupName': groupName,
      'numberOfElements': numberOfElements,
    };
  }
}
