import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../data/models/responses/forecast_response/forecast_response.dart';
import '../../widgets/default_svg.dart';
import '../../widgets/default_text.dart';

class ForecastAttributesItem extends StatelessWidget {

  String? attributeName;
  final Forecastday forecastDay;

  ForecastAttributesItem({Key? key, required this.attributeName, required this.forecastDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String uv = '';

    if(forecastDay.day.uv <= 2){
      uv = 'Low';
    }else if(forecastDay.day.uv > 2 && forecastDay.day.uv <= 7){
      uv = 'Medium';
    }else{
      uv = 'High';
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(attributeName == 'UV index') DefaultSvg(imagePath: 'assets/icons/sun.svg', height: 30.sp),
          if(attributeName == 'Wind') DefaultSvg(imagePath: 'assets/icons/wind.svg', height: 30.sp),
          if(attributeName == 'Humidity') DefaultSvg(imagePath: 'assets/icons/humidity.svg', height: 30.sp),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 2.h, bottom: 1.h),
            child: DefaultText(text: attributeName!, fontSize: 12.sp, fontWeight: FontWeight.bold,),
          ),
          if(attributeName == 'UV index') DefaultText(text: uv, fontSize: 12.sp, fontWeight: FontWeight.bold,),
          if(attributeName == 'Wind') DefaultText(text: '${forecastDay.day.maxwindKph.round()}km/h', fontSize: 12.sp, fontWeight: FontWeight.bold,),
          if(attributeName == 'Humidity') DefaultText(text: '${forecastDay.day.avghumidity.round()}%', fontSize: 12.sp, fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }
}
