import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/constanst/app_style.dart';
import 'package:task_list_app/constanst/app_size.dart';
import 'package:task_list_app/service/nav_service/nav_notifier.dart';

import '../../common/language_drop_down.dart';
import '../../l10n/app_localizations.dart';
import 'nav_bar_list_item.dart';

class AppNavigationBar extends ConsumerWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = ref.watch(navProvider);
    AppLocalizations? t = AppLocalizations.of(context);
    String navName(String vale) {
      if (vale == 'Tasks') {
        return t!.tasks;
      } else if (vale == 'Projects') {
        return t!.projects;
      } else if (vale == 'Teams') {
        return t!.teams;
      } else {
        return '';
      }
    }

    return ColoredBox(
      color: AppStyle.darkBlue,
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 64),
            itemCount: navigationBarItems.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                ref.read(navProvider.notifier).indexChange(index);
              },
              child: NavigationBarListItem(
                name: navName(navigationBarItems[index].name),
                isIndex: navIndex.index == index,
              ),
            ),
            separatorBuilder: (context, index) => mediumDivider,
          ),
          Spacer(),
          const Divider(
            color: AppStyle.lightTextColor,
            height: 0,
            thickness: 1,
          ),
          gapH16,
          LanguageDropdown(),
          gapH16,
        ],
      ),
    );
  }
}

final navigationBarItems = [
  NavigationBarItem(name: 'Tasks', url: 'tasks'),
  NavigationBarItem(name: 'Projects', url: 'projects'),
  NavigationBarItem(name: 'Teams', url: 'teams'),
];

class NavigationBarItem {
  final String name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}
