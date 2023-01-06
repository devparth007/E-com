import 'package:flutter_application_2/provider/add_cart_provider.dart';
import 'package:flutter_application_2/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsVM(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          radioTheme: RadioThemeData(
              fillColor:
                  MaterialStateColor.resolveWith((states) => AppTheme.black)),
          //fontFamily: 'Cormorant Garamond',
          scaffoldBackgroundColor: AppTheme.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppTheme.white,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: AppTheme.textStyle25blackW6,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Screen(),
      ),
    );
  }
}
