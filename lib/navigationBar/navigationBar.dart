import 'package:flutter/material.dart';
import '../screens/HomeScreen.dart';
import '../screens/SavedScreen.dart';
import '../screens/SettingsScreen.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';

class NavigationTabBar extends StatelessWidget {
  final selectedIndex;

  const NavigationTabBar({this.selectedIndex});

  void onItemTapped(index) {
    if (index != selectedIndex) {
      switch (index) {
        case 0:
          Get.to(() => HomeScreen());
          break;
        case 1:
          Get.to(() => SavedScreen());
          break;
        case 2:
          Get.to(() => SettingsScreen());
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: selectedIndex,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      //  elevation: 0,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Obx(
            () => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedIndex == 0
                    ? customSecondaryColor.value
                    : customWhite.value,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/home.png',
                  color: selectedIndex == 0
                      ? customPrimaryColor.value
                      : customBlack.value,
                ),
              ),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Obx(
            () => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedIndex == 1
                    ? customSecondaryColor.value
                    : customWhite.value,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/group.png',
                  color: selectedIndex == 1
                      ? customPrimaryColor.value
                      : customBlack.value,
                ),
              ),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Obx(
            () => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedIndex == 2
                    ? customSecondaryColor.value
                    : customWhite.value,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/settings.png',
                  color: selectedIndex == 2
                      ? customPrimaryColor.value
                      : customBlack.value,
                ),
              ),
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
