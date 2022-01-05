import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_app/Homepage/home_tab.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _currentIndex = 0;

  List<Widget> _selectedTabWidgets = [
    const HomeTab(),
    const Text('Likes Tab'),
    const Text('Profile Tab')
  ];

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SalomonBottomBar(
        itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
                      /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_filled),
              title: const Text("Home"),
              selectedColor: Colors.green[700],
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Likes"),
              selectedColor: Colors.pink,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person_outline_sharp),
              // icon: const FaIcon(FontAwesomeIcons.user),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
        ]),
        body:  _selectedTabWidgets.elementAt(_currentIndex) ,
      ),
    );
  }
}