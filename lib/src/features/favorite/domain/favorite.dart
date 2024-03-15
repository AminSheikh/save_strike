
class Favorite {
  const Favorite({
    required this.id,
    required this.image,
  });
  final String? id;
  final String? image;

  factory Favorite.fromMap(
    Map<dynamic, dynamic> value,
  ) {
    return Favorite(
      id: value['id'] as String?,
      image: value['image'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
    };
  }
}
