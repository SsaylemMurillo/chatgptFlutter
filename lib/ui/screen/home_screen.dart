//import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_gpt_mobile/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/message_page.dart';
import '../pages/history_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Home');

  final pages = const [
    HomePage(),
    MessagePage(),
    HistoryPage(),
  ];

  final pageTitles = const [
    'Home',
    'New Message',
    'History',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This single part of the code is being rebuilt by using the valueListenableBuilder
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: _OnNavigationItemSelected,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void _OnNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarItem(
                index: 0,
                label: 'Home',
                icon: CupertinoIcons.home,
                isSelected: (selectedIndex == 0),
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 1,
                label: 'New Message',
                icon: CupertinoIcons.bubble_left,
                isSelected: (selectedIndex == 1),
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 2,
                label: 'History',
                icon: CupertinoIcons.clock,
                isSelected: (selectedIndex == 2),
                onTap: handleItemSelected,
              ),
            ],
          ),
        ));
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.index,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final ValueChanged<int> onTap;
  final bool isSelected;
  final int index;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Icon(
            icon,
            size: 20,
            color: isSelected ? AppTheme.accentColor : null,
          ),
        ),
      ),
    );
  }
}
