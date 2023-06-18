import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/constanst/test_tasks.dart';
import 'package:task_list_app/model/task.dart';

class NetworkService {
  NetworkService();
  List<Task> tasks = kTestTask;

  Future<List<Task>> getTaskList() async {
    await Future.delayed(const Duration(seconds: 1));
    return Future.value(tasks);
  }

  Task? getTask(String id) {
    return tasks.firstWhere((element) => element.id == id);
  }

  Stream<List<Task>> watchTaskList() async* {
    await Future.delayed(const Duration(seconds: 1));
    yield tasks;
  }

  Stream<Task?> watchTask(String id) {
    return watchTaskList()
        .map((task) => task.firstWhere((task) => task.id == id));
  }
}

final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService();
});

final taskListStreamProvider = StreamProvider.autoDispose<List<Task>>((ref) {
  final taskRepository = ref.watch(networkServiceProvider);
  return taskRepository.watchTaskList();
});

final taskListFutureProvider =
    FutureProvider.autoDispose<List<Task>>((ref) async {
  final taskRepository = ref.watch(networkServiceProvider);
  return taskRepository.getTaskList();
});

final taskProvider =
    StreamProvider.autoDispose.family<Task?, String>((ref, id) {
  final taskRepository = ref.watch(networkServiceProvider);
  return taskRepository.watchTask(id);
});
