import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_list_app/presentation/app%20navigation/app_navigation_bar.dart';
import 'package:task_list_app/service/nav_service/nav_notifier.dart';

// This class does not have to be used. It should be replaced with class
// handling navigation using go_router package
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 110.w, maxWidth: 120.w),
            child: AppNavigationBar(),
          ),
          Consumer(builder: (context, ref, _) {
            final navBarProvider = ref.watch(changeWidgetOfNavProvider);
            return Expanded(child: navBarProvider);
          }),
        ],
      ),
    );
  }
}
