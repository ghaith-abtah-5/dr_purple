import 'package:dr_purple/app/app_management/strings_manager.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrPurpleNavigationBar extends StatelessWidget {
  const DrPurpleNavigationBar({Key? key, required this.navigationShell})
      : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _onDestinationTapped,
      destinations: <NavigationDestination>[
        NavigationDestination(
          icon: const Icon(Icons.home_outlined, size: AppSize.s30),
          selectedIcon: const Icon(Icons.home_rounded),
          label: AppStrings.homeNav.tr(),
        ),
        NavigationDestination(
          icon: const Icon(Icons.calendar_today),
          selectedIcon: const Icon(Icons.calendar_month_rounded),
          label: AppStrings.appointmentsNav.tr(),
        ),
        NavigationDestination(
          icon: const Icon(CupertinoIcons.bell),
          selectedIcon: const Icon(CupertinoIcons.bell_fill),
          label: AppStrings.notificationsNav.tr(),
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings_outlined),
          selectedIcon: const Icon(Icons.settings_rounded),
          label: AppStrings.settingsNav.tr(),
        ),
      ],
    );
  }

  void _onDestinationTapped(int destinationIndex) => navigationShell.goBranch(
        destinationIndex,
        initialLocation: destinationIndex == navigationShell.currentIndex,
      );
}
