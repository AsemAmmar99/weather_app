import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../widgets/default_cached_network_image.dart';
import '../../widgets/default_text.dart';


class HoursTempItem extends StatelessWidget {
  final String time;
  final String temp;
  final String icon;
  final String state;
  const HoursTempItem({
    Key? key,
    required this.time,
    required this.temp,
    required this.icon,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.5.h, bottom: 2.5.h),
      child: SizedBox(
        width: 25.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultText(text: time),
            DefaultCachedNetworkImage(
                imageUrl: '$httpSC$icon', fit: BoxFit.contain),
            DefaultText(text: state),
            DefaultText(text: temp.toString()),
          ],
        ),
      ),
    );
  }
}
