import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_text.dart';


class SunriseSunsetItem extends StatelessWidget {

  String? sunStatus;
  String? sunStatusTime;

  SunriseSunsetItem({Key? key, required this.sunStatus, required this.sunStatusTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultText(text: sunStatus!, fontSize: 12.sp, fontWeight: FontWeight.bold,),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 1.h, bottom: 2.h),
            child: DefaultText(text: sunStatusTime!, fontSize: 12.sp, fontWeight: FontWeight.bold,),
          ),
          Image.asset(sunStatus == 'Sunrise' ? 'assets/image/sunrise.png' : 'assets/image/sunset.png', height: 60.sp),
        ],
      ),
    );
  }
}
