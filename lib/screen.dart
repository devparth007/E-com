import 'package:flutter_application_2/provider/add_cart_provider.dart';
import 'package:flutter_application_2/screens/screen1.dart';
import 'package:flutter_application_2/screens/screen2.dart';
import 'package:flutter_application_2/screens/screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/theme.dart';
import 'package:provider/provider.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int _selectedIndex = 0;
  final List _children = [
    const Screen1(),
    const Screen2(),
    const Screen3(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    Provider.of<ProductsVM>(context, listen: false).func();
    Provider.of<ProductsVM>(context, listen: false).func2(0);
    Provider.of<ProductsVM>(context, listen: false).func3(0);
    Provider.of<ProductsVM>(context, listen: false).getId();
    Provider.of<ProductsVM>(context, listen: false).getLocation();
    Provider.of<ProductsVM>(context, listen: false).checkConnectivity2(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'My order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_sharp),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppTheme.black,
          onTap: _onItemTapped,
        ));
  }
}
