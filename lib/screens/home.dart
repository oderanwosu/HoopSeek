import 'package:flutter/material.dart';
import 'package:hoop_seek/screens/map.dart';
import 'package:hoop_seek/screens/messages.dart';
import 'package:hoop_seek/screens/profile.dart';
import 'package:hoop_seek/screens/record.dart';
import 'package:hoop_seek/utils/brand_icons_icons.dart';
import 'package:hoop_seek/utils/size_helpers.dart';
import 'package:hoop_seek/utils/themes.dart';

import 'authentication/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MapScreen(),
    RecordScreen(),
    MessagesScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) async {
    // add the setstate callback here
    setState(() {
      _currentIndex = index;
    });
    print('Selected: ${_currentIndex} CurrentIndex: ${index}');
  }

  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: BrandTheme.colorPrimary,
        unselectedItemColor: BrandTheme.colorDisabled,
        onTap: _onItemTapped,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              BrandIcons.logo,
              size: sizer.sx(0.07),
            ),
            label: 'Match map'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.book, size: sizer.sx(0.07)),
            label: 'Record'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_rounded,
              size: sizer.sx(0.07),
            ),
            label: 'Messages'.toUpperCase(),
          ),
          BottomNavigationBarItem(
              icon: Container(
                height: sizer.sx(0.07),
                width: sizer.sx(0.07),
                child: CircleAvatar(
                  backgroundColor: BrandTheme.colorFont,
                ),
              ),
              label: 'Profile'.toUpperCase())
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
