import 'package:flutter/material.dart';
import 'package:weather/core/constant/Colors.dart';
import 'package:weather/core/models/weather_model/weather_model.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: const Color.fromARGB(66, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(
                Icons.wind_power,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.darkColor
                    : AppColors.lightColor,
              ),
              Text(
                "${weatherModel.current!.windKph} km/h",
                style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.darkColor
                        : AppColors.lightColor,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "wind",
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.darkColor
                      : AppColors.lightColor,
                ),
              )
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              Icon(
                Icons.water_drop,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.darkColor
                    : AppColors.lightColor,
              ),
              Text(
                "${weatherModel.current!.humidity} %",
                style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.darkColor
                        : AppColors.lightColor,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "Humidity",
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.darkColor
                      : AppColors.lightColor,
                ),
              )
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.water,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.darkColor
                      : AppColors.lightColor),
              Text(
                "${weatherModel.current!.uv} %",
                style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.darkColor
                        : AppColors.lightColor,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "Rain",
                style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.darkColor
                        : AppColors.lightColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
