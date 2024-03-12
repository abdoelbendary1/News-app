import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/providers/authProvider.dart';
import 'package:news_app/providers/bookmarkProvider.dart';
import 'package:news_app/screens/auth/login/login.dart';
import 'package:news_app/screens/auth/signUp/signUp.dart';
import 'package:news_app/screens/newsBasedCategory/category_details.dart';
import 'package:news_app/screens/homeScreen.dart';
import 'package:news_app/tabs/homeTab/newsItemScreen.dart';
import 'package:provider/provider.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyCO50jcyArwL3yU8NqWIukWJA5IaL3c5gE",
              appId: "1:206773062426:android:83eba7a3014970815dfaa3",
              messagingSenderId: '206773062426',
              projectId: "newsproject-8d86b"),
        )
      : await Firebase.initializeApp();
  runApp(
    DevicePreview(
        builder: ((context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => BookmarkProvider(),
                ),
                ChangeNotifierProvider(
                  create: (context) => AuthProviders(),
                ),
              ],
              child: MyApp(),
            ))),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        /*  CategoryDetails.routeName: (context) => CategoryDetails(), */
        NewsItemScreen.routeName: (context) => NewsItemScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
      },
    );
  }
}
