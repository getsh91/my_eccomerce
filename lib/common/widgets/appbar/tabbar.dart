import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ITabBar extends StatelessWidget implements PreferredSizeWidget {
  const ITabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? Colors.black : Colors.white,
      child: TabBar(
        labelColor: dark ? IColors.white : IColors.primary,
        unselectedLabelColor: IColors.darkGrey,
        indicatorColor: IColors.primary,
        tabs: tabs,
        isScrollable: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(IDeviceUtils.getAppBarHeight());
}
