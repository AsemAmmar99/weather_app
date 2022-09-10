import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/cubit/weather_cubit/weather_cubit.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/constants.dart';
import '../../../data/models/responses/weather_response/weather_response.dart';
import '../../styles/colors.dart';
import '../../widgets/default_cached_network_image.dart';
import '../../widgets/default_icon_button.dart';
import '../../widgets/default_text.dart';

class LocationsListItem extends StatefulWidget {
  const LocationsListItem(
      {Key? key, required this.weatherResponse, required this.index})
      : super(key: key);
  final WeatherResponse weatherResponse;
  final int index;

  @override
  State<LocationsListItem> createState() => _LocationsListItemState();
}

class _LocationsListItemState extends State<LocationsListItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) async {
        if (widget.weatherResponse.location.name !=
            WeatherCubit.get(context).currentWeatherResponse.location.name) {
          return true;
        } else {
          showToastMsg(
              msg: "Can't remove current selected location",
              toastState: ToastStates.WARNING);
          return false;
        }
      },
      onDismissed: (direction) {
        WeatherCubit.get(context)
          ..removeWeatherItem(widget.weatherResponse)
          ..getUserFavoriteWeatherLocation()
          ..getUserOtherWeatherLocation();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(25.sp),
            gradient: const LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                defaultAppColor,
                defaultAppWhiteColor,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: DefaultCachedNetworkImage(
                  imageUrl: httpSC +
                      widget.weatherResponse.currentWeather.condition.icon,
                  fit: BoxFit.fill,
                  height: 10.h,
                ),
              ),
              DefaultText(
                  text:
                  ' ${changeTempUnit(widget.weatherResponse.currentWeather.tempC, widget.weatherResponse.currentWeather.tempF)}'),
              SizedBox(
                width: 6.w,
              ),
              Expanded(
                flex: 5,
                child: DefaultText(
                  text: widget.weatherResponse.location.name,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                  color: defaultDarkBlue,
                ),
              ),
              Flexible(
                child: DefaultIconButton(
                  onPressed: () {
                    widget.weatherResponse.location.favorite
                        ? WeatherCubit.get(context)
                            .removeFavoriteWeather(widget.weatherResponse)
                        : WeatherCubit.get(context)
                            .addFavoriteWeather(widget.weatherResponse);
                    WeatherCubit.get(context)
                      ..getUserFavoriteWeatherLocation()
                      ..getUserOtherWeatherLocation();
                  },
                  icon: widget.weatherResponse.location.favorite
                      ? const Icon(
                          Icons.star,
                          color: defaultAppColor2,
                        )
                      : const Icon(
                          Icons.star,
                          color: defaultDarkBlue,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
