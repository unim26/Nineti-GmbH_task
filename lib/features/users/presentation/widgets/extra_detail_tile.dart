import 'package:flutter/widgets.dart';
import 'package:task/core/App_Style/app_text_style.dart';

class ExtraDetailTile extends StatelessWidget {
  final String title;
  final String value;
  const ExtraDetailTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Table(
        children: [
          TableRow(
            children: [
              Text(title, style: AppTextStyle.subTitleTextStyle(context)),
              Text(":"),
              Text(value, style: AppTextStyle.subTitleTextStyle(context)),
            ],
          ),
        ],
      ),
    );
  }
}
