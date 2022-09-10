import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/presentation/router/app_router.dart';

import 'business_logic/cubit/weather_cubit/weather_cubit.dart';
import 'data/source/local/my_shared_preferences.dart';
import 'data/source/network/my_dio.dart';
import 'presentation/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  await MyDio.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter appRouter = AppRouter();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            theme: Themes.lightTheme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
