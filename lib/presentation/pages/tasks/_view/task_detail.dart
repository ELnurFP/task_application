import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/common/async_value_widget.dart';
import 'package:task_list_app/common/empty_place_holder.dart';
import 'package:task_list_app/service/neywork/network_service.dart';

import '../../../../common/custom_task_title.dart';
import '../../../../constanst/app_size.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key, required this.id});
  final String id;
  String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('dd/MM, HH:mm');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, _) {
        final taskValue = ref.watch(taskProvider(id));
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: AsyncValueWidget(
              value: taskValue,
              data: (product) => product == null
                  ? EmptyPlaceholderWidget(message: 'Product not found')
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTitle(
                          title: product.title ?? 'Unkwon',
                        ),
                        darkDivider,
                        gapH32,
                        Text(
                          formatDateTime(product.dateTime!),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        gapH12,
                        Text(
                          product.description ?? 'Unkwon',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )),
        );
      }),
    );
  }
}
