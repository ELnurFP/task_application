import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/presentation/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/presentation/pages/tasks/_view/task_detail.dart';
import 'package:task_list_app/presentation/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/presentation/pages/teams/_view/teams_page.dart';

import 'not_found_screen.dart';

enum AppRoute {
  home,
  tasks,
  taskDetail,
  teams,
  projects,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'tasks',
              name: AppRoute.tasks.name,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                    child: TasksPage(),
                    fullscreenDialog: true,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity:
                            CurveTween(curve: Curves.easeIn).animate(animation),
                        child: child,
                      );
                    });
              },
            ),
            GoRoute(
              path: 'task-detail/:id',
              name: AppRoute.taskDetail.name,
              pageBuilder: (context, state) {
                String id = state.pathParameters['id'] as String;
                return CustomTransitionPage(
                    child: TaskDetailPage(id: id),
                    fullscreenDialog: true,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity:
                            CurveTween(curve: Curves.easeIn).animate(animation),
                        child: child,
                      );
                    });
              },
            ),
            GoRoute(
              path: 'teams',
              name: AppRoute.teams.name,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                    child: TeamsPage(),
                    fullscreenDialog: true,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity:
                            CurveTween(curve: Curves.easeIn).animate(animation),
                        child: child,
                      );
                    });
              },
            ),
            GoRoute(
              path: 'projects',
              name: AppRoute.projects.name,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                    child: ProjectsPage(),
                    fullscreenDialog: true,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity:
                            CurveTween(curve: Curves.easeIn).animate(animation),
                        child: child,
                      );
                    });
              },
            ),
          ]),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
