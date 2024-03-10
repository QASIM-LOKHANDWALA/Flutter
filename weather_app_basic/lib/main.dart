import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app_basic/my_theme.dart';
import 'package:weather_app_basic/screens/home_screen.dart';
import 'package:weather_app_basic/theme_cubit.dart';
import 'package:weather_app_basic/theme_provider.dart';

import 'bloc/bloc_weather_bloc.dart';

void main() {
  runApp(
    const MyApp(),
    //ChangeNotifierProvider(create: (context) => ThemeProvider(),child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final themeCubit = ThemeCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      bloc: themeCubit,
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeCubit.state,
          home: FutureBuilder(
            future: _determinePosition(),
            builder: (context, snap) {
              if (snap.hasData) {
                return BlocProvider<WeatherBloc>(
                  create: (context) =>
                  WeatherBloc()
                    ..add(FetchWeather(snap.data as Position)),
                  child: const HomeScreen(),
                );
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    return Future.error("Please connect to the internet");
  }

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Open location settings
    await launchUrl(Uri(scheme: 'geolocator', path: 'enableLocation'));
    return Future.error("Please enable Location Services");
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("LOCATION PERMISSION DENIED");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        "LOCATION PERMISSION DENIED FOREVER, APP CAN'T WORK WITHOUT IT");
  }

  return await Geolocator.getCurrentPosition();
}
