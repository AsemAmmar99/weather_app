import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/cubit/weather_cubit/weather_cubit.dart';
import '../../../constants/screens.dart';
import '../../styles/colors.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/horizontal_divider.dart';
import 'home_drawer_favorite_item.dart';
import 'home_drawer_other_locations_item.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  late WeatherCubit weatherCubit;
  @override
  void initState() {
    weatherCubit = WeatherCubit.get(context);
    weatherCubit
      ..getUserOtherWeatherLocation()
      ..getUserFavoriteWeatherLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: defaultDarkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.sp),
            bottomRight: Radius.circular(20.sp)),
      ),
      child: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, state) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.star, color: defaultAppWhiteColor),
                          SizedBox(
                            width: 3.w,
                          ),
                          const DefaultText(
                              text: 'Favourite Location',
                              color: defaultAppWhiteColor),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsetsDirectional.only(end: 3.w),
                            child: const Icon(Icons.info_outlined,
                                color: defaultAppWhiteColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ]),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => HomeDrawerFavoriteItem(
                                weatherResponse: weatherCubit
                                    .favoriteWeatherListResponse
                                    .weatherResponse[index],
                              ),
                          childCount: weatherCubit.favoriteWeatherListResponse
                              .weatherResponse.length)),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const HorizontalDivider(),
                        Row(
                          children: [
                            const Icon(Icons.add_location_outlined,
                                color: defaultAppWhiteColor),
                            SizedBox(
                              width: 3.w,
                            ),
                            const DefaultText(
                                text: 'Manage Locations',
                                color: defaultAppWhiteColor),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => HomeDrawerOtherLocationItem(
                                weatherResponse: weatherCubit
                                    .otherWeatherListResponse
                                    .weatherResponse[index],
                              ),
                          childCount: weatherCubit.otherWeatherListResponse
                              .weatherResponse.length)),
                  SliverToBoxAdapter(
                    child: Column(children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(top: 2.h, bottom: 1.h),
                        child: DefaultMaterialButton(
                          background: defaultAppWhiteColor.withOpacity(0.3),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MANAGE_LOCATIONS_SCREEN);
                          },
                          text: 'Manage Locations',
                        ),
                      ),
                      const HorizontalDivider(),
                      Row(
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.info_outline_rounded,
                                color: defaultAppWhiteColor,
                              ),
                              label: const Text(
                                'Report wrong location',
                                style: TextStyle(
                                  color: defaultAppWhiteColor,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.headset_mic,
                                color: defaultAppWhiteColor,
                              ),
                              label: const Text(
                                'Contact Us',
                                style: TextStyle(
                                  color: defaultAppWhiteColor,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      )
                    ]),
                  )
                ],
              ));
        },
      ),
    );
  }
}
