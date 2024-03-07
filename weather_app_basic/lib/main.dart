import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_basic/my_theme.dart';
import 'package:weather_app_basic/screens/home_screen.dart';

import 'bloc/bloc_weather_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(),
      darkTheme: MyTheme.darkTheme(),
      themeMode: ThemeMode.system,
      home: FutureBuilder(
        future: _determinePosition(),
        builder: (context,snap) {
          if(snap.hasData){
            return BlocProvider<WeatherBloc>(
              create: (context) => WeatherBloc()..add(FetchWeather(snap.data as Position)),
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
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if(!serviceEnabled) {
    return Future.error("LOCATION SERVICE DISABLED");
  }

  permission = await Geolocator.checkPermission();
  if(permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied) {
      return Future.error("LOCATION PERMISSION DENIED");
    }
  }

  if(permission == LocationPermission.deniedForever) {
    return Future.error("LOCATION PERMISSION DENIED FOREVER, APP CAN'T WORK WITHOUT IT");
  }

  return await Geolocator.getCurrentPosition();
}
