import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/theme.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            child: AutoSizeText('data'),
            decoration: BoxDecoration(color: AppTheme.bluewhite),
          ),
          ListTile(
            title: AutoSizeText('data'),
            subtitle: AutoSizeText('subdata'),
          ),
          ListTile(
            title: AutoSizeText('data'),
            subtitle: AutoSizeText('subdata'),
          ),
          ListTile(
            title: AutoSizeText('data'),
            subtitle: AutoSizeText('subdata'),
          ),
          ListTile(
            title: AutoSizeText('data'),
            subtitle: AutoSizeText('subdata'),
          )
        ],
      ),
    );
  }
}
