import 'package:flutter/material.dart';
import 'package:weather/core/constant/Colors.dart';

class weekDays extends StatelessWidget {
  const weekDays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Today",
            style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.darkColor
                    : AppColors.lightColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/weatherDays');
              },
              icon: Row(
                children: [
                  Text(
                    "7 days",
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.darkColor
                            : AppColors.lightColor),
                  ),
                  Icon(Icons.chevron_right,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.darkColor
                          : AppColors.lightColor)
                ],
              ))
        ],
      ),
    );
  }
}
