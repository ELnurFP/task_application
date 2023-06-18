import 'package:flutter/material.dart';

import '../../constanst/app_size.dart';
import '../../constanst/app_style.dart';

class NavigationBarListItem extends StatelessWidget {
  const NavigationBarListItem({
    Key? key,
    required this.name,
    required this.isIndex,
  }) : super(key: key);
  final String name;
  final bool isIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p16, vertical: Sizes.p12),
      decoration: BoxDecoration(
        color: isIndex ? AppStyle.activeNavColor : Colors.transparent,
        borderRadius: BorderRadius.circular(Sizes.p8),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: AppStyle.lightTextColor,
          fontSize: Sizes.p18,
        ),
      ),
    );
  }
}
