import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lion_project_07/getx/view/getx_home_view.dart';
import 'package:lion_project_07/set_state/view/home_view.dart';

void main() {
  runGetxApp();
}

void runSetStateApp() {
  runApp(const MyApp());
}

void runGetxApp() {
  runApp(const GetxMyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff23263B),
          primary: const Color(0xff23263B),
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      home: const HomeView(),
    );
  }
}

class GetxMyApp extends StatelessWidget {
  const GetxMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff23263B),
          primary: const Color(0xff23263B),
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      home: GetXHomeView(),
    );
  }
}
