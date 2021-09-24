import 'package:flutter/material.dart';
import 'package:news_app_challenge_flutter/constants/constants.dart';
import 'package:news_app_challenge_flutter/navigationBar/navigationBar.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationTabBar(
        selectedIndex: 2,
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60.0,
          ),
          Center(
            child: Container(
              child: Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, bottom: 20.0, top: 30.0),
            child: Text(
              'Theme color:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                    customPrimaryColor.value = kBlueTheme;
                    customSecondaryColor.value = kBlueTheme.withOpacity(0.25);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 30.0),
                  decoration: BoxDecoration(
                    color: kBlueTheme,
                    borderRadius: BorderRadius.circular(4.0),
                    border: index == 1
                        ? Border.all(color: Colors.black45, width: 3.3)
                        : Border.all(color: Colors.black54, width: 0),
                  ),
                  height: 70,
                  width: 70,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                    customPrimaryColor.value = kGreenTheme;
                    customSecondaryColor.value = kGreenTheme.withOpacity(0.25);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kGreenTheme,
                    borderRadius: BorderRadius.circular(4.0),
                    border: index == 2
                        ? Border.all(color: Colors.black45, width: 3.3)
                        : Border.all(color: Colors.black54, width: 0),
                  ),
                  height: 70,
                  width: 70,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 3;
                    customPrimaryColor.value = kOrangeTheme;
                    customSecondaryColor.value = kOrangeTheme.withOpacity(0.25);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kOrangeTheme,
                    borderRadius: BorderRadius.circular(4.0),
                    border: index == 3
                        ? Border.all(color: Colors.black45, width: 3.3)
                        : Border.all(color: Colors.black54, width: 0),
                  ),
                  height: 70,
                  width: 70,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 4;
                    customPrimaryColor.value = kPurpleTheme;
                    customSecondaryColor.value = kPurpleTheme.withOpacity(0.25);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 30.0),
                  decoration: BoxDecoration(
                    color: kPurpleTheme,
                    borderRadius: BorderRadius.circular(4.0),
                    border: index == 4
                        ? Border.all(color: Colors.black45, width: 3.3)
                        : Border.all(color: Colors.black54, width: 0),
                  ),
                  height: 70,
                  width: 70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
