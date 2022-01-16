import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/task_controller.dart';
import 'package:notes/models/task_mode.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);
  final nameCotroller = TextEditingController();
  final body = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  final TaskController _taskController = Get.put(
    TaskController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Task',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameCotroller,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
                validator: (String? data) {
                  if (data == null || data.isEmpty) {
                    return 'Enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 10,
                controller: body,
                decoration: const InputDecoration(
                  hintText: 'Note',
                ),
                validator: (String? data) {
                  if (data == null || data.isEmpty) {
                    return 'Note Cant be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    Task task = Task(
                      title: nameCotroller.text,
                      body: body.text,
                      createTime: DateTime.now(),
                    );
                    _taskController.addtask(task);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Task'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
