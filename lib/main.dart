import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_task_management_app/core/route_manager/routes_manager.dart';
import 'package:future_task_management_app/core/styles/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
     builder: (context, child) => MaterialApp(
       onGenerateRoute: RouteManger.onGenerateRoute,
       theme: AppTheme.lightTheme,
     ),
    );
  }
}
