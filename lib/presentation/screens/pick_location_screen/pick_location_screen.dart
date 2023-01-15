import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/cubit/weather_cubit/weather_cubit.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/constants.dart';
import '../../../constants/screens.dart';
import '../../../data/models/responses/weather_response/weather_list_response.dart';
import '../../../data/models/responses/weather_response/weather_response.dart';
import '../../../data/source/local/my_shared_preferences.dart';
import '../../../data/source/local/my_shared_preferences_keys.dart';
import '../../widgets/default_map.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';


class PickLocationScreen extends StatefulWidget {
  PickLocationScreen({Key? key}) : super(key: key);

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  double? clickedMarkerLat;
  double? clickedMarkerLong;

  @override
  initState() {
    locationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            DefaultMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: appInitialCameraPosition,
              onTap: (argument) {
                setState(() {
                  clickedMarkerLat = argument.latitude;
                  clickedMarkerLong = argument.longitude;
                });
              },
              markers: clickedMarkerLat != null && clickedMarkerLong != null
                  ? {
                      Marker(
                          markerId: const MarkerId('chosenLocation'),
                          infoWindow:
                              const InfoWindow(title: 'Chosen Location'),
                          position:
                              LatLng(clickedMarkerLat!, clickedMarkerLong!)),
                    }
                  : const {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 4.h),
              child: BlocListener<WeatherCubit, WeatherStates>(
                listener: (context, state) {
                  if (state is GetWeatherDataSuccessState) {
                    MySharedPreferences.putBoolean(
                        key: MySharedKeys.firstTimeLocation, value: true);

                    MySharedPreferences.putString(
                        key: MySharedKeys.currentWeatherLocation,
                        value: weatherResponseToJson(state.newWeatherResponse));

                    WeatherCubit weatherCubit = WeatherCubit.get(context);

                    weatherCubit.allWeatherListResponse
                        .addWeatherResponse(state.newWeatherResponse);

                    MySharedPreferences.putString(
                        key: MySharedKeys.userWeatherList,
                        value: weatherListResponseToJson(
                            weatherCubit.allWeatherListResponse));

                    Navigator.pushNamedAndRemoveUntil(
                        context, HOME_SCREEN, (route) => false);
                  }
                },
                child: DefaultMaterialButton(
                    onPressed: () {
                      if (clickedMarkerLat != null &&
                          clickedMarkerLong != null) {
                        WeatherCubit.get(context).getCurrentWeatherResponse(
                            '$clickedMarkerLat,$clickedMarkerLong');
                      } else {
                        showToastMsg(
                            msg: 'choose your location',
                            toastState: ToastStates.WARNING);
                      }
                    },
                    child: const DefaultText(text: 'Choose Location')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
