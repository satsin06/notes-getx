import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/darktheme_controller.dart';
import 'package:notes/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final  DarkthemeController _darkThemeController =
      Get.put(DarkthemeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: (_darkThemeController.darkTheme.value) ? Brightness.dark : Brightness.light,
          ),
          home: HomePage(),
        );
      }
    );
  }
}