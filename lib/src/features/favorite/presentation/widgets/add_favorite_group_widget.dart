import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../style/custom_icons/save_strike_icons.dart';

class AddFavoriteGroupWidget extends StatelessWidget {
  const AddFavoriteGroupWidget({super.key});

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
      child: DottedBorder(
        strokeWidth: 1.5,
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
        dashPattern : const <double>[8, 6],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                SaveStrikeIcons.goals_icon,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Neue Gruppe\nhinzufügen",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'MarkPro',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
