import 'package:flutter/material.dart';
import 'package:weather/core/constant/Colors.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.darkColor
                : AppColors.lightColor,
            borderRadius: BorderRadius.circular(20)),
        height: 140,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.lightColor
                  : AppColors.darkColor,
            ),
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.lightColor
                    : AppColors.darkColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
