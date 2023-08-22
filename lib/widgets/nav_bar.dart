import 'package:demo/constants.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      currentIndex: 1,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.neutralLight3,
      onTap: (value) {},
      items: BottomNavItems.values
          .map(
            (e) => BottomNavigationBarItem(
              icon: Image.asset(
                e.getIconString(),
                color: switch (e) {
                  BottomNavItems.month => AppColors.primary,
                  _ => AppColors.neutralDark
                },
              ),
              label: e.name,
            ),
          )
          .toList(),
    );
  }
}
