import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/constants/screens.dart' as screens;
import 'package:weather_app/presentation/widgets/default_text.dart';
import '../../../business_logic/cubit/weather_cubit/weather_cubit.dart';
import '../../../data/models/responses/weather_response/weather_response.dart';
import '../../../data/source/local/my_shared_preferences.dart';
import '../../../data/source/local/my_shared_preferences_keys.dart';
import '../../styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late WeatherCubit weatherCubit;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      animationBehavior: AnimationBehavior.preserve,
      value: 1,
      vsync: this,

    )..repeat(reverse: true,);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -1.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));

    Timer(const Duration(milliseconds: 4000), () async {
      if (MySharedPreferences.getBoolean(key: MySharedKeys.firstTimeLocation) ==
          true) {
        WeatherResponse weatherResponse = weatherResponseFromJson(
            MySharedPreferences.getString(
                key: MySharedKeys.currentWeatherLocation));
        weatherCubit = WeatherCubit.get(context);
        weatherCubit
          ..getUserAllWeatherLocation()
          ..getUserOtherWeatherLocation()
          ..getUserFavoriteWeatherLocation();
        await weatherCubit
            .getCurrentWeatherResponse(weatherResponse.locationLatLong)
            .then((value) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(screens.HOME_SCREEN, (route) => false);
        });
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            screens.PICK_LOCATION_SCREEN, (route) => false);
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(milliseconds:2500), (){
      _controller.stop(canceled: true);
    });

    return Scaffold(
      backgroundColor: defaultBlack,
      body: Stack(
        children: [
          TweenAnimationBuilder(
            duration: const Duration(milliseconds: 3000),
            tween: Tween<double>(begin: 0, end: 100.h),
            builder: (BuildContext context, double? value, Widget? child) =>
                Container(
                  height: value,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [
                          defaultBlack,
                          defaultAppColor,
                          defaultBlack,
                        ]
                    ),
                  ),
                ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SlideTransition(
                      position: _offsetAnimation,
                      child: Image.asset(
                        'assets/image/sun.gif',
                        height: 120.sp,
                      )),
                ),
                Flexible(
                  child: DefaultText(
                    text: 'MY WEATHER',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 25.sp,
                    color: defaultAppWhiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
