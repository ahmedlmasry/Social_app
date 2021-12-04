import 'package:flutter/material.dart';
import 'package:groub/modules/twitter_app/time.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  var _screens = [TimeScreen()];
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentindex,
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              title: Text(''),
            ),
          ]),
      body: _screens[_currentindex],
    );
  }
}
