import 'package:flutter/material.dart';
import 'package:future_task_management_app/ui/home/auth/register/register_screen.dart';
import 'package:future_task_management_app/ui/home/home_screen.dart';

class RouteManger{
  static const String registerRoute = '/';
  static const String homeRoute = '/home';

 static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case registerRoute: {
        return MaterialPageRoute(builder: (context) => RegisterScreen(),);
      }
      case homeRoute: {
        return MaterialPageRoute(builder: (context) => HomeScreen(),);
      }

    }
  }
}