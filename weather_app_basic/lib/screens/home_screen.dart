import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app_basic/bloc/bloc_weather_bloc.dart';
import 'package:weather_app_basic/widgets/middle_background/middle_background_widget_1.dart';
import 'package:weather_app_basic/widgets/middle_background/middle_background_widget_2.dart';
import 'package:weather_app_basic/widgets/top_background_color.dart';

import '../main.dart';
import '../theme_cubit.dart';
import '../theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String backgroung(){
    if(context.isDarkMode){
      return "assets/darkBG.jpg";
    }else{
      return "assets/lightBG2.jpg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: context.theme.colorScheme.brightness,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: context.theme.colorScheme.primary,
            child: Icon(
              CupertinoIcons.circle_lefthalf_fill,
              color: context.theme.focusColor,
            ),
            onPressed: () => MyApp.themeCubit.toggleTheme(),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                // const Widget1(),
                // const Widget2(),
                // const TopBackgroundWidget(),
                Positioned.fill(
                  child: Image.asset(
                    backgroung(),
                    fit: BoxFit.cover,
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(40, kTextTabBarHeight * 1.2, 40, 20),
                  child: MainContent(),
                ),
              ],
            ),
          ),
        );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  String getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return "assets/1.png";
      case >= 300 && < 400:
        return "assets/2.png";
      case >= 500 && < 600:
        return "assets/3.png";
      case >= 600 && < 700:
        return "assets/4.png";
      case >= 700 && < 800:
        return "assets/5.png";
      case == 800:
        return "assets/6.png";
      case > 800 && <= 804:
        return "assets/7.png";
      default:
        return "assets/7.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSuccess) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📍 ${state.weather.areaName}',
                    style: TextStyle(
                      color: context.theme.focusColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'WELCOME',
                    style: TextStyle(
                      color: context.theme.focusColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      height: context.screenHeight / 2.5,
                      getWeatherIcon(state.weather.weatherConditionCode!)),
                  ),
                  Center(
                    child: Text(
                      "${state.weather.temperature!.celsius!.round()}°C",
                      style: TextStyle(
                          color: context.theme.focusColor,
                          fontSize: 55,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Center(
                    child: Text(
                      state.weather.weatherMain!.toUpperCase(),
                      style: TextStyle(
                          color: context.theme.focusColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      DateFormat('EEEE dd • ')
                          .add_jm()
                          .format(state.weather.date!),
                      style: TextStyle(
                          color: context.theme.focusColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/11.png",
                                scale: 8,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sunrise",
                                    style: TextStyle(
                                      color: context.theme.focusColor,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    DateFormat()
                                        .add_jm()
                                        .format(state.weather.sunrise!),
                                    style: TextStyle(
                                      color: context.theme.focusColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/12.png",
                                scale: 8,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sunset",
                                    style: TextStyle(
                                      color: context.theme.focusColor,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    DateFormat()
                                        .add_jm()
                                        .format(state.weather.sunset!),
                                    style: TextStyle(
                                      color: context.theme.focusColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Divider(
                          color: context.theme.colorScheme.surface,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/13.png",
                                scale: 8,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Temp Max",
                                    style: TextStyle(
                                      color: context.theme.focusColor,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    '${state.weather.tempMax!.celsius!.round().toString()} °C',
                                    style: TextStyle(
                                      color: context.theme.focusColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/14.png",
                                scale: 8,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Temp Min",
                                    style: TextStyle(
                                      color: context.theme.focusColor,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    '${state.weather.tempMin!.celsius!.round().toString()} °C',
                                    style: TextStyle(
                                      color: context.theme.focusColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
