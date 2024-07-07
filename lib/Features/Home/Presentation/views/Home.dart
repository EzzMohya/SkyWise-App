import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/Features/Home/Presentation/manager/weatherCubit/weather_cubit.dart';
import 'package:weather/Features/Home/Presentation/manager/weatherCubit/weather_states.dart';
import 'package:weather/core/constant/Colors.dart';
import 'package:weather/core/constant/animation_assets.dart';
import 'package:weather/Features/Home/Presentation/views/widgets/detailDay.dart';
import 'package:weather/Features/Home/Presentation/views/widgets/searchBar.dart';
import 'package:weather/Features/Home/Presentation/views/widgets/weekdays.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      if (state is WeatherSuccess) {
        return Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.lightColor
              : AppColors.darkColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.lightColor
                : AppColors.darkColor,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/setting");
                  },
                  icon: Icon(Icons.settings,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.darkColor
                          : AppColors.lightColor))
            ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_pin,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.darkColor
                      : AppColors.lightColor,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  state.weatherModel.location!.region.toString(),
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.darkColor
                          : AppColors.lightColor),
                )
              ],
            ),
          ),
          body: SizedBox(
            height: height,
            width: width,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  Searchbar(
                    title: 'Search',
                    searchController: TextEditingController(),
                  ),
                  Lottie.asset("${AppConstant.animation[0]}",
                      height: 170, width: 200),
                  Column(
                    children: [
                      Text(
                        "${state.weatherModel.current!.tempC}",
                        style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.darkColor
                                    : AppColors.lightColor),
                      ),
                      Text(
                        "Thunderclouds",
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.darkColor
                                    : AppColors.lightColor),
                      ),
                      DetailCard(weatherModel: state.weatherModel),
                      const weekDays()
                    ],
                  ),
                  SizedBox(
                    height: 120,
                    width: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      // itemCount:24,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 7, 132, 250),
                                border: Border.all(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? const Color.fromARGB(113, 0, 0, 0)
                                        : const Color.fromARGB(
                                            66, 255, 255, 255)),
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "${AppConstant.hours[index]}",
                                    style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? AppColors.darkColor
                                            : AppColors.lightColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Lottie.asset(AppConstant.animation[index],
                                      repeat: false, height: 60, width: 60),
                                  Text(
                                    "${state.weatherModel.forecast!.forecastday![index].hour![index].tempC}°C",
                                    style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? AppColors.darkColor
                                            : AppColors.lightColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      } else if (state is WeatherFailure) {
        return const Center(
          child: Text('failure'),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
