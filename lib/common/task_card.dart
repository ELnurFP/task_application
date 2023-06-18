import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../model/task.dart';

class TaskCart extends StatelessWidget {
  const TaskCart({super.key, required this.task, this.onPressed});
  final Task task;
  final VoidCallback? onPressed;
  static const taskCardKey = Key('task-card');
  String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('dd/MM, HH:mm');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    print(110.w);
    return InkWell(
      onTap: onPressed,
      key: taskCardKey,
      child: Container(
        width: 250.w,
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: 110.w <= 200
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 110.w <= 200 ? 180.w : 140.w,
                  child: Text(
                    task.title ?? 'Unknown',
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                ),
                Spacer(),
                if (110.w > 200)
                  Text(
                    formatDateTime(task.dateTime!),
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ),
              ],
            ),
            if (110.w <= 200)
              Text(
                formatDateTime(task.dateTime!),
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),
          ],
        ),
      ),
    );
  }
}
