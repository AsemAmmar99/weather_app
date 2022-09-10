import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/constants/screens.dart';
import '../../../business_logic/cubit/weather_cubit/weather_cubit.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/constants.dart';
import '../../../data/models/responses/forecast_response/forecast_response.dart';
import '../../styles/colors.dart';
import '../../views/home/days_temp_item.dart';
import '../../views/home/forecast_attributes_item.dart';
import '../../views/home/home_drawer.dart';
import '../../views/home/hours_temp_item.dart';
import '../../views/home/sunrise_sunset_item.dart';
import '../../widgets/default_cached_network_image.dart';
import '../../widgets/default_icon_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_white_transparent_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WeatherCubit weatherCubit;
  late Color backgroundColor;

  @override
  void initState() {
    backgroundColor = defaultAppColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    weatherCubit = WeatherCubit.get(context);

    final List<ChartData> chartData = List.generate(
      weatherCubit.currentWeatherResponse.forecast.forecastday[0].hour.length,
      (index) => ChartData(
          index,
          weatherCubit
              .currentWeatherResponse.forecast.forecastday[0].hour[index]),
    );
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            drawer: const HomeDrawer(),
            backgroundColor: backgroundColor,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                    scrolledUnderElevation: 30.h,
                    leading: Builder(builder: (context) {
                      return DefaultIconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            size: 20.sp,
                          ));
                    }),
                    backgroundColor: backgroundColor,
                    toolbarHeight: 10.h,
                    expandedHeight: 33.h,
                    collapsedHeight: 30.h,
                    pinned: true,
                    floating: true,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsetsDirectional.only(
                          start: 5.w, end: 2.w, top: 12.h),
                      centerTitle: false,
                      expandedTitleScale: 1.3,
                      background: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DefaultText(
                                text:
                                    '${changeTempUnit(weatherCubit.currentWeatherResponse.forecast.forecastday[0].day.maxtempC, weatherCubit.currentWeatherResponse.forecast.forecastday[0].day.maxtempF)} / ${changeTempUnit(weatherCubit.currentWeatherResponse.forecast.forecastday[0].day.mintempC, weatherCubit.currentWeatherResponse.forecast.forecastday[0].day.mintempF)} Feels Like ${changeTempUnit(weatherCubit.currentWeatherResponse.currentWeather.feelslikeC, weatherCubit.currentWeatherResponse.currentWeather.feelslikeF)}',
                                fontSize: 12.sp,
                              ),
                              DefaultText(
                                text:
                                    '${weatherCubit.currentWeatherResponse.currentWeather.condition.text}, ${DateFormat('hh:mm a').format(DateTime.parse(weatherCubit.currentWeatherResponse.currentWeather.lastUpdated))}',
                                fontSize: 12.sp,
                              ),
                            ]),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              DefaultText(
                                text: changeTempUnit(
                                    weatherCubit.currentWeatherResponse
                                        .currentWeather.tempC,
                                    weatherCubit.currentWeatherResponse
                                        .currentWeather.tempF),
                                fontSize: 30.sp,
                              ),
                              const Spacer(),
                              DefaultCachedNetworkImage(
                                imageUrl: httpSC +
                                    weatherCubit.currentWeatherResponse
                                        .currentWeather.condition.icon,
                                fit: BoxFit.fill,
                                height: 10.h,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: DefaultText(
                                  text: weatherCubit
                                      .currentWeatherResponse.location.name,
                                  fontSize: 16.sp,
                                ),
                              ),
                              DefaultIconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, PICK_LOCATION_SCREEN);
                                  },
                                  icon: Icon(
                                    Icons.location_pin,
                                    size: 15.sp,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )),
                DefaultWhiteTransparentBackground(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: List.generate(
                              weatherCubit.currentWeatherResponse.forecast
                                  .forecastday[0].hour.length,
                              (index) => HoursTempItem(
                                  time: DateFormat('hh:mm a').format(DateTime.parse(weatherCubit
                                      .currentWeatherResponse
                                      .forecast
                                      .forecastday[0]
                                      .hour[index]
                                      .time)),
                                  temp: changeTempUnit(
                                      weatherCubit
                                          .currentWeatherResponse
                                          .forecast
                                          .forecastday[0]
                                          .hour[index]
                                          .tempC,
                                      weatherCubit
                                          .currentWeatherResponse
                                          .forecast
                                          .forecastday[0]
                                          .hour[index]
                                          .tempF),
                                  icon: weatherCubit
                                      .currentWeatherResponse
                                      .forecast
                                      .forecastday[0]
                                      .hour[index]
                                      .condition
                                      .icon,
                                  state: weatherCubit
                                      .currentWeatherResponse
                                      .forecast
                                      .forecastday[0]
                                      .hour[index]
                                      .condition
                                      .text)),
                        ),
                        SizedBox(
                          width: 580.w,
                          height: 10.h,
                          child: SfCartesianChart(
                            plotAreaBorderColor: Colors.transparent,
                            primaryYAxis: NumericAxis(
                              isVisible: false,
                            ),
                            primaryXAxis: NumericAxis(
                              isVisible: false,
                            ),
                            series: <ChartSeries<ChartData, int>>[
                              LineSeries<ChartData, int>(
                                  dataSource: chartData,
                                  markerSettings: const MarkerSettings(
                                    isVisible: true,
                                  ),
                                  xValueMapper: (ChartData data, _) =>
                                      data.x,
                                  yValueMapper: (ChartData data, _) =>
                                      data.y.tempC),
                            ],
                          ),
                        ),
                        Row(
                          children: List.generate(
                              weatherCubit.currentWeatherResponse.forecast
                                  .forecastday[0].hour.length,
                              (index) => Container(
                                    width: 25.w,
                                    margin: EdgeInsets.only(bottom: 2.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        DefaultText(
                                            text:
                                                '${weatherCubit.currentWeatherResponse.forecast.forecastday[0].hour[index].humidity.toStringAsFixed(0)}%'),
                                        const Icon(Icons.water_drop)
                                      ],
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  ),
                ),
                DefaultWhiteTransparentBackground(
                  verticalMargin: 0,
                  child: Column(
                      children: List.generate(
                    7,
                    (index) => DaysTempItem(
                      forecastDay: weatherCubit.currentWeatherResponse
                          .forecast.forecastday[index],
                    ),
                  )),
                ),
                DefaultWhiteTransparentBackground(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SunriseSunsetItem(
                      sunStatus: 'Sunrise',
                      sunStatusTime: weatherCubit.currentWeatherResponse
                          .forecast.forecastday[0].astro.sunrise,
                    ),
                    SunriseSunsetItem(
                      sunStatus: 'Sunset',
                      sunStatusTime: weatherCubit.currentWeatherResponse
                          .forecast.forecastday[0].astro.sunset,
                    ),
                  ],
                )),
                DefaultWhiteTransparentBackground(
                    verticalMargin: 1.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ForecastAttributesItem(
                            attributeName: 'UV index',
                            forecastDay: weatherCubit.currentWeatherResponse
                                .forecast.forecastday[0]),
                        ForecastAttributesItem(
                            attributeName: 'Wind',
                            forecastDay: weatherCubit.currentWeatherResponse
                                .forecast.forecastday[0]),
                        ForecastAttributesItem(
                            attributeName: 'Humidity',
                            forecastDay: weatherCubit.currentWeatherResponse
                                .forecast.forecastday[0]),
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final int x;
  final Hour y;
}
