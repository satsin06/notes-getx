import 'package:get/get.dart';
import 'package:notes/models/task_mode.dart';

class TaskController extends GetxController {
  RxList<Task> tasks = <Task>[].obs;
  RxBool darkTheme = false.obs;

  void addtask(Task task) {
    tasks.add(task);
    notifyChildrens();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyChildrens();
  }
}
