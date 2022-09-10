import 'package:flutter/material.dart';
import 'package:weather_app/constants/screens.dart' as screens;
import '../screens/home/home_screen.dart';
import '../screens/manage_locations/manage_locations_screen.dart';
import '../screens/pick_location_screen/pick_location_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const SplashScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case screens.PICK_LOCATION_SCREEN:
        return MaterialPageRoute(builder: (_) => PickLocationScreen());
      case screens.MANAGE_LOCATIONS_SCREEN:
        return MaterialPageRoute(builder: (_) => const ManageLocationsScreen());
      default:
        return null;
    }
  }
}
