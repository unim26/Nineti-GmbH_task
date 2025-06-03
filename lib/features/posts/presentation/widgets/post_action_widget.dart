import 'package:flutter/material.dart';

class PostActionWidget extends StatelessWidget {
  final IconData icon;
  final int value;
  const PostActionWidget({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondary,

        border: Border.all(color: Colors.grey.shade200, width: 2),
      ),

      child: Column(
        children: [
          //icon
          Icon(icon),

          //value
          Text(value.toString()),
        ],
      ),
    );
  }
}
