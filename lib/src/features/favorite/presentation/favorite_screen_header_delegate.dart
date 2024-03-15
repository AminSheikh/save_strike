import 'package:flutter/material.dart';

class FavoriteScreenHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  FavoriteScreenHeaderDelegate([this.height = 80]);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the Container
        borderRadius:
            BorderRadius.circular(10), // Rounded corners for the Container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
            spreadRadius: 0, // Minimal spread radius
            blurRadius: 10, // Blur radius for softer shadow
            offset: Offset(0, 5), // Offset for bottom shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              color: Color.fromRGBO(241, 250, 227, 1),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.euro,
                            size: 12,
                            color: Color.fromRGBO(32, 197, 20, 1),
                          ),
                          alignment: PlaceholderAlignment.top,
                        ),
                        TextSpan(
                          text: "10.435,",
                          style: const TextStyle(
                            fontFamily: 'MarkPro',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color.fromRGBO(32, 197, 20, 1),
                          ),
                        ),
                        TextSpan(
                          text: "00",
                          style: const TextStyle(
                            fontFamily: 'MarkPro',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color.fromRGBO(32, 197, 20, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Gespart in Goals",
                    style: const TextStyle(
                      fontFamily: 'MarkPro',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromRGBO(32, 197, 20, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.euro,
                            size: 12,
                            color: Colors.black,
                          ),
                          alignment: PlaceholderAlignment.middle,
                        ),
                        TextSpan(
                          text: "800,",
                          style: const TextStyle(
                            fontFamily: 'MarkPro',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "00",
                          style: const TextStyle(
                            fontFamily: 'MarkPro',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Geld in Wallet",
                    style: const TextStyle(
                      fontFamily: 'MarkPro',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
