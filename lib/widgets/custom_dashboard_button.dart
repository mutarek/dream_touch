import 'package:flutter/material.dart';

class CustomDashboardButton extends StatelessWidget {

  final Color color;
  final Icon icon;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: color.withOpacity(0.4),
              offset: Offset(0, 10),
            ),
          ], color: color, borderRadius: BorderRadius.circular(30)),
          child: Center(child: icon),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          caption,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        )
      ],
    );
  }

  CustomDashboardButton({required this.color, required this.icon,required this.caption});
}
