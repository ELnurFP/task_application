import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/presentation/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/presentation/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/presentation/pages/teams/_view/teams_page.dart';
import 'package:task_list_app/service/nav_service/nav_state.dart';

class NavNotifier extends StateNotifier<NavStates> {
  NavNotifier() : super(NavStates());
  void indexChange(int index) {
    state = state.copyWith(index: index);
  }
}

final navProvider = StateNotifierProvider<NavNotifier, NavStates>((ref) {
  return NavNotifier();
});

Widget _buildTasksPage() {
  return TasksPage();
}

Widget _buildProjectsPage() {
  return ProjectsPage();
}

Widget _buildTeamsPage() {
  return TeamsPage();
}

final changeWidgetOfNavProvider = Provider<Widget>((ref) {
  final navResProvider = ref.watch(navProvider);
  switch (navResProvider.index) {
    case 0:
      return _buildTasksPage();
    case 1:
      return _buildProjectsPage();
    default:
      return _buildTeamsPage();
  }
});
