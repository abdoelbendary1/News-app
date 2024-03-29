import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/screens/category/category_details.dart';
import 'package:news_app/screens/homeScreen.dart';

void main() {
  runApp(
    DevicePreview(
      builder: ((context) => MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: CategoryDetails.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        CategoryDetails.routeName: (context) => CategoryDetails(),
      },
    );
  }
}
