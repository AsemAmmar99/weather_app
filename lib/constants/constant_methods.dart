import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/presentation/styles/colors.dart';
import 'constants.dart';

void printResponse(String text) {
  if (kDebugMode) {
    print('\x1B[33m$text\x1B[0m');
  }
}

void printError(String text) {
  if (kDebugMode) {
    print('\x1B[31m$text\x1B[0m');
  }
}

void printTest(String text) {
  if (kDebugMode) {
    print('\x1B[32m$text\x1B[0m');
  }
}

void showToastMsg({required String msg, required ToastStates toastState}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state: toastState),
      textColor: defaultDarkBlue,
      fontSize: 16.0);
}

Color chooseToastColor({required ToastStates state}) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green.withOpacity(0.5);
      break;
    case ToastStates.WARNING:
      color = Colors.yellow.withOpacity(0.5);
      break;
    case ToastStates.ERROR:
      color = Colors.red.withOpacity(0.5);
      break;
  }
  return color;
}


Future<Position> locationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    printError('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      printError('Location permissions are denied');

      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    printError(
        'Location permissions are permanently denied, we cannot request permissions.');
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
  return position;
}

String changeTempUnit(double tempC, double tempF) {
  return appTempUnitIsC
      ? '${tempC.toStringAsFixed(0)}C°'
      : '${tempF.toStringAsFixed(0)}F°';
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
