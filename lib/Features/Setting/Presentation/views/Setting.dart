import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather/controllers/ThemeController.dart';
import 'package:weather/controllers/weatherController.dart';
import 'package:weather/core/constant/Colors.dart';
import 'package:weather/Features/Setting/Presentation/views/widgets/ThemeCard.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightColor
            : AppColors.darkColor,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ), 
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.lightColor
          : AppColors.darkColor,
      body: Consumer<WeatherController>(builder: (context, controller, child) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.light
                            ? const Color.fromARGB(83, 0, 0, 0)
                            : AppColors.lightColor,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.lightColor
                          : AppColors.darkColor,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Sign in or sign up',
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.darkColor
                            : AppColors.lightColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Themes",
                style: TextStyle(fontSize: 25),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ThemeCard(
                        title: 'Light',
                        icon: Icons.light_mode,
                        onTap: () {
                          ThemeMode newThemeMode = ThemeMode.light;
                          Provider.of<ThemeProvider>(context, listen: false)
                              .setThemeMode(newThemeMode);
                        },
                      ),
                      ThemeCard(
                        title: 'Dark',
                        icon: Icons.dark_mode,
                        onTap: () {
                          ThemeMode newThemeMode = ThemeMode.dark;
                          Provider.of<ThemeProvider>(context, listen: false)
                              .setThemeMode(newThemeMode);
                        },
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "Temperature",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  SwitchListTile(
                    value: controller.isBool,
                    onChanged: (value) {
                      controller.isBool = value;
                      if (value) {}
                    },
                    title: const Text(
                      "Convert To Fahrenheit",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
