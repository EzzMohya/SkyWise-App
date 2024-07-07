import 'package:flutter/material.dart';
import 'package:weather/core/constant/Colors.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key,
    required this.title,
    this.searchOnPressed,
    this.onPressedFavorite,
    this.onChanged,
    required this.searchController,
  });
  final String title;
  final void Function()? searchOnPressed;
  final void Function()? onPressedFavorite;
  final void Function(String)? onChanged;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          onChanged: onChanged,
          controller: searchController,
          decoration: InputDecoration(
            hintText: title,
            hintStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.lightColor
                  : AppColors.darkColor,
            ),
            prefixIcon: IconButton(
              icon: Icon(
                Icons.search,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.lightColor
                    : AppColors.darkColor,
              ),
              onPressed: searchOnPressed,
            ),
            filled: true,
            fillColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.darkColor
                : AppColors.lightColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 13),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none),
          ),
        )),
      ],
    );
  }
}
