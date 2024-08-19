import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_task_management_app/core/route_manager/routes_manager.dart';
import 'package:future_task_management_app/core/styles/app_theme.dart';
import 'package:future_task_management_app/firebase_options.dart';
import 'package:future_task_management_app/providers/app_auth_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => AppAuthProvider(), child: const MyApp()));
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
        initialRoute: RouteManger.loginRoute,
      ),
    );
  }
}
