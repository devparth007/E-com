import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/theme.dart';
import 'package:flutter_svg/svg.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText('Account'),
        elevation: 0.3,
      ),
      body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  width: 60,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: AppTheme.black,
                    child: SvgPicture.asset('assets/svg/avatar-profile.svg'),
                  ),
                ),
                title: const AutoSizeText('Name',
                    style: AppTheme.textStyle18blackW6),
                subtitle: const AutoSizeText('Email',
                    style: AppTheme.textStyle16greybold),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.currency_exchange_rounded),
                title: Text('Refer & earn'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.star),
                title: Text('Rate this App'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.local_police_outlined),
                title: Text('Legal and policies'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              )
            ],
          )),
    );
  }
}
