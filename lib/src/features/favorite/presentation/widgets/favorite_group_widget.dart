import 'package:flutter/material.dart';
import 'package:save_strike/src/features/favorite/domain/favorite_group.dart';

class FavoriteGroupWidget extends StatelessWidget {
  const FavoriteGroupWidget({
    super.key,
    required this.favoriteGroup,
  });
  final FavoriteGroup favoriteGroup;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 7,
            blurRadius: 9,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 160,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Color.fromRGBO(244, 245, 250, 1),
                    child: ((favoriteGroup.favorites?.length ?? 0) >= 1)
                        ? Container(
                          color: Colors.white,
                          child: Image.asset(
                              favoriteGroup.favorites?[0].image ?? "",
                              fit: BoxFit.contain,
                            ),
                        )
                        : null,
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Color.fromRGBO(244, 245, 250, 1),
                    child: ((favoriteGroup.favorites?.length ?? 0) >= 2)
                        ? Container(
                          color: Colors.white,
                          child: Image.asset(
                              favoriteGroup.favorites?[1].image ?? "",
                            ),
                        )
                        : null,
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Color.fromRGBO(244, 245, 250, 1),
                    child: ((favoriteGroup.favorites?.length ?? 0) >= 3)
                        ? Container(
                          color: Colors.white,
                          child: Image.asset(
                              favoriteGroup.favorites?[2].image ?? "",
                            ),
                        )
                        : null,
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Color.fromRGBO(244, 245, 250, 1),
                    child: ((favoriteGroup.favorites?.length ?? 0) >= 4)
                        ? Container(
                          color: Colors.white,
                          child: Image.asset(
                              favoriteGroup.favorites?[3].image ?? "",
                            ),
                        )
                        : null,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favoriteGroup.groupName ?? "",
                  style: const TextStyle(
                    fontFamily: 'MarkPro',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "${favoriteGroup.numberOfElements.toString()} Element(e)",
                  style: TextStyle(
                    fontFamily: 'MarkPro',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            indent: 15,
            endIndent: 15,
            color: Colors.grey[200],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.more_horiz_outlined),
                Icon(
                  Icons.send,
                  size: 14,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
