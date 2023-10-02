import 'package:ayana/core/di/service_locator.dart';
import 'package:ayana/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(380, MediaQuery.of(context).size.height),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return FlutterWebFrame(
            maximumSize: Size(380, MediaQuery.of(context).size.height),
            enabled: true,
            backgroundColor: const Color(0xffBBA987),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (context) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme:
                    ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
                home: child,
              );
            },
          );
        },
        child: const HomePage());
  }
}
