import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/task_controller.dart';
import 'package:notes/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final TaskController _taskController = Get.put(
    TaskController(),
  );
  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: (_taskController.darkTheme.value) ? Brightness.dark : Brightness.light,
          ),
          home: HomePage(),
        );
      }
    );
  }
}