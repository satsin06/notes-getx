import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/view/add_task.dart';
import 'package:notes/controller/task_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TaskController _taskController = Get.put(
    TaskController(),
  );

  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App'),
        actions: [
          IconButton(
              onPressed: () {
                _taskController.darkTheme.value =
                    !_taskController.darkTheme.value;
              },
              icon: const Icon(Icons.brightness_2))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTask(),
            ),
          );
        },
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
      ),
      body: Obx(() {
        return _taskController.tasks.isEmpty
            ? const Center(
                child: Text('Add a note'),
              )
            : ListView.builder(
                itemCount: _taskController.tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Column(
                        children: [
                          Text(_taskController.tasks[index].createTime.day
                              .toString()),
                          Text(days[
                              _taskController.tasks[index].createTime.weekday -
                                  1])
                        ],
                      ),
                      title: Text(_taskController.tasks[index].title),
                      subtitle: Text(_taskController.tasks[index].body),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _taskController
                              .deleteTask(_taskController.tasks[index]);
                        },
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
