import 'package:flutter/material.dart';
import 'package:news_app/appThem.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: const Center(child: Text("TEXT")),
    );
  }
}
