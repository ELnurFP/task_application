import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/common/async_value_widget.dart';
import 'package:task_list_app/l10n/app_localizations.dart';
import 'package:task_list_app/model/task.dart';
import 'package:task_list_app/routing/app_routing.dart';

import '../../../../common/custom_task_title.dart';
import '../../../../common/task_card.dart';
import '../../../../constanst/app_size.dart';
import '../../../../service/neywork/network_service.dart';

class TasksPage extends ConsumerWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListValue = ref.watch(taskListStreamProvider);
    // AppLocalizations? t = AppLocalizations.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.p20),
        child: Column(
          children: [
            CustomTitle(
              title: AppLocalizations.of(context)!.tasks,
            ),
            darkDivider,
            gapH32,
            SizedBox(
              height: 812,
              child: AsyncValueWidget<List<Task>>(
                  value: taskListValue,
                  data: (tasks) => tasks.isEmpty
                      ? Center(
                          child: Text('No tasks yet'),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => TaskCart(
                                task: tasks[index],
                                onPressed: () => context.goNamed(
                                    AppRoute.taskDetail.name,
                                    pathParameters: {'id': tasks[index].id!}),
                              ),
                          separatorBuilder: (context, index) => gapH12,
                          itemCount: tasks.length)),
            ),
          ],
        ),
      ),
    );
  }
}
