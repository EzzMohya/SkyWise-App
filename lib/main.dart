import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Features/Home/Presentation/manager/weatherCubit/weather_cubit.dart';
import 'package:weather/Features/Home/Presentation/views/Home.dart';
import 'package:weather/Features/Setting/Presentation/views/Setting.dart';
import 'package:weather/Features/WeatherDetails/Presentation/views/WeatherDays.dart';
import 'package:weather/core/services/location.dart';
import 'package:weather/core/services/weather_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetPermissionLocation.determinePosition();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherService())..getWeather(),
      child: MaterialApp(
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        home: const WeatherApp(),
      ),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({
    super.key,
  });

  @override
  State<WeatherApp> createState() => WeatherAppState();
}

class WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/weatherDays': (context) => const WeatherDays(),
        '/setting': (context) => const Setting(),
      },
    );
  }
}
