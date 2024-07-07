import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather/controllers/weatherController.dart';
import 'package:weather/core/constant/Colors.dart';
import 'package:weather/core/constant/animation_assets.dart';
import 'package:weather/Features/Home/Presentation/views/widgets/detailDay.dart';
import 'package:weather/core/models/weather_model/weather_model.dart';

class WeatherDays extends StatelessWidget {
  const WeatherDays({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.lightColor
          : AppColors.darkColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.lightColor
              : AppColors.darkColor,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_month,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.darkColor
                    : AppColors.lightColor,
              ),
              Text(
                " 7 days",
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.darkColor
                      : AppColors.lightColor,
                ),
              )
            ],
          )),
      body: Consumer<WeatherController>(builder: (context, controller, child) {
        return SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30),
                      child: Lottie.asset(
                          height: 120,
                          width: 120,
                          "${AppConstant.animation[0]}"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          "Tomorrow",
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? AppColors.darkColor
                                  : AppColors.lightColor,
                              fontSize: 20),
                        ),
                        Row(
                          children: [
                            Text(
                              "${AppConstant.temperature[0]}",
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColors.darkColor
                                      : AppColors.lightColor,
                                  fontSize: 55,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              '/${AppConstant.tempe[0]}',
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColors.darkColor
                                      : AppColors.lightColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const DetailCard(
                  weatherModel: WeatherModel(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppConstant.days.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${AppConstant.days[index]}",
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColors.darkColor
                                      : AppColors.lightColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Lottie.asset(AppConstant.daysWeather[index],
                                    repeat: true, height: 60, width: 60),
                                Text(
                                  "${AppConstant.typeWeather[index]}",
                                  style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? AppColors.darkColor
                                        : AppColors.lightColor,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  controller.isBool
                                      ? "${controller.convertFahrenheit(int.parse(AppConstant.temperature[index]))}°"
                                      : "${AppConstant.temperature[index]}°",
                                  style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? AppColors.darkColor
                                          : AppColors.lightColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  controller.isBool
                                      ? "${controller.convertFahrenheit(int.parse(AppConstant.tempe[index]))}°F"
                                      : "${AppConstant.tempe[index]}°C",
                                  style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? AppColors.darkColor
                                          : AppColors.lightColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
