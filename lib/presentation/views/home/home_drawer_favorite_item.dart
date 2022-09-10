import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/cubit/weather_cubit/weather_cubit.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/constants.dart';
import '../../../data/models/responses/weather_response/weather_response.dart';
import '../../styles/colors.dart';
import '../../widgets/default_cached_network_image.dart';
import '../../widgets/default_text.dart';

class HomeDrawerFavoriteItem extends StatelessWidget {
  const HomeDrawerFavoriteItem({Key? key, required this.weatherResponse})
      : super(key: key);
  final WeatherResponse weatherResponse;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        WeatherCubit.get(context)
            .getCurrentWeatherResponse(weatherResponse.locationLatLong);
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Row(
                children: [
                  Icon(Icons.location_pin,
                      size: 12.sp, color: defaultAppWhiteColor),
                  SizedBox(
                    height: 3.h,
                  ),
                  DefaultText(
                      text: weatherResponse.location.name,
                      color: defaultAppWhiteColor),
                ],
              ),
            ),
          ),
          DefaultText(
              text:
                  ' ${changeTempUnit(weatherResponse.currentWeather.tempC, weatherResponse.currentWeather.tempF)}'),
          DefaultCachedNetworkImage(
              imageUrl: httpSC + weatherResponse.currentWeather.condition.icon,
              fit: BoxFit.contain)
        ],
      ),
    );
  }
}
