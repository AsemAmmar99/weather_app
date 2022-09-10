import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/cubit/weather_cubit/weather_cubit.dart';
import '../../styles/colors.dart';
import '../../views/manage_locations/locations_list_item.dart';
import '../../widgets/default_text.dart';

class ManageLocationsScreen extends StatefulWidget {
  const ManageLocationsScreen({Key? key}) : super(key: key);

  @override
  State<ManageLocationsScreen> createState() => _ManageLocationsScreenState();
}

class _ManageLocationsScreenState extends State<ManageLocationsScreen> {
  late WeatherCubit weatherCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultAppColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: defaultAppColor,
        elevation: 0,
        title: const DefaultText(
          text: 'Manage Locations',
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(6.sp),
        child: BlocConsumer<WeatherCubit, WeatherStates>(
          listener: (context, state) {},
          builder: (context, state) {
            weatherCubit = WeatherCubit.get(context);
            return ListView.builder(
              itemBuilder: (context, index) => LocationsListItem(
                  weatherResponse: weatherCubit
                      .allWeatherListResponse.weatherResponse[index],
                  index: index),
              itemCount:
                  weatherCubit.allWeatherListResponse.weatherResponse.length,
            );
          },
        ),
      ),
    );
  }
}
