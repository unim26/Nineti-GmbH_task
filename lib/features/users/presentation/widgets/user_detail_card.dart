import 'package:flutter/material.dart';
import 'package:task/core/App_Style/app_text_style.dart';
import 'package:task/features/users/presentation/widgets/extra_detail_tile.dart';

class UserDetailCard extends StatelessWidget {
  final String cardTitle;
  final List<ExtraDetailTile> extraDetailTiles;
  const UserDetailCard({
    super.key,
    required this.cardTitle,
    required this.extraDetailTiles,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(15).copyWith(right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey.shade300,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Column(
          children: [
            //title
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                cardTitle,
                style: AppTextStyle.labelTextStyle(context),
              ),
            ),

            //details
            ...extraDetailTiles,
          ],
        ),
      ),
    );
  }
}
