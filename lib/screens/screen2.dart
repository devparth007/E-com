import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //final data = Provider.of<ProductsVM>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText('My order'),
      ),
      body: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Center(
            child: Text(''),
          )),
    );
  }
}
