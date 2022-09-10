import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/constants/constant_methods.dart';
import '../../../constants/constants.dart';
import '../../../data/models/responses/forecast_response/forecast_response.dart';
import '../../widgets/default_cached_network_image.dart';
import '../../widgets/default_text.dart';

class DaysTempItem extends StatelessWidget {
  final Forecastday forecastDay;

  const DaysTempItem({
    Key? key,
    required this.forecastDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 5.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: DefaultText(
              text: DateTime.parse(forecastDay.date).isSameDate(DateTime.now())
                  ? 'Today'
                  : DateFormat('EEEE').format(DateTime.parse(forecastDay.date)),
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
          const Flexible(
            child: Icon(Icons.water_drop),
          ),
          Expanded(
              child: DefaultText(
            text: '${forecastDay.day.avghumidity.toStringAsFixed(0)}%',
            fontSize: 12.sp,
          )),
          Flexible(
            child: DefaultCachedNetworkImage(
              imageUrl: httpSC + forecastDay.day.condition.icon,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 2,
            child: DefaultText(
              text:
                  '${changeTempUnit(forecastDay.day.maxtempC, forecastDay.day.maxtempF)} ${changeTempUnit(forecastDay.day.mintempC, forecastDay.day.mintempF)}',
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
