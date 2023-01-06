import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowAdd extends StatefulWidget {
  final String name;
  final String mobileNo;
  final String address;
  final String city;
  final String area;
  final String pincode;
  final String state;
  final String country;
  const ShowAdd({
    Key? key,
    required this.name,
    required this.mobileNo,
    required this.address,
    required this.city,
    required this.area,
    required this.pincode,
    required this.state,
    required this.country,
  }) : super(key: key);

  @override
  State<ShowAdd> createState() => _ShowAddState();
}

class _ShowAddState extends State<ShowAdd> {
  int _value = 1;
  String phoneNumber = '+919913229525';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Address'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppTheme.black,
            )),
      ),
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(widget.name, style: AppTheme.textStyle20blackW6),
                    const SizedBox(width: 10),
                    Text(widget.mobileNo, style: AppTheme.textStyle20blackW6),
                  ],
                ),
                Row(
                  children: [
                    Text(widget.address, style: AppTheme.textStyle16blackbold),
                    const SizedBox(width: 10),
                    Text(widget.area, style: AppTheme.textStyle16blackbold),
                    const SizedBox(width: 10),
                    Text(widget.city, style: AppTheme.textStyle16blackbold),
                    const SizedBox(width: 10),
                  ],
                ),
                Row(
                  children: [
                    Text(widget.state, style: AppTheme.textStyle16blackbold),
                    const SizedBox(width: 10),
                    Text(widget.country, style: AppTheme.textStyle16blackbold),
                    const SizedBox(width: 5),
                    const Text('-', style: AppTheme.textStyle16blackbold),
                    const SizedBox(width: 5),
                    Text(widget.pincode, style: AppTheme.textStyle16blackbold),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _value = 1;
                    });
                  },
                  child: Container(
                    height: 70,
                    width: width,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _value == 1
                                ? AppTheme.black
                                : AppTheme.bluewhite,
                            width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset(
                                      'assets/svg/bhim-upi.svg')),
                              const SizedBox(width: 20),
                              const Text('UPI',
                                  style: AppTheme.textStyle16blackbold)
                            ],
                          ),
                          Radio(
                              value: 1,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 1;
                                });
                              }),
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _value = 2;
                    });
                  },
                  child: Container(
                    height: 70,
                    width: width,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _value == 2
                                ? AppTheme.black
                                : AppTheme.bluewhite,
                            width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 40,
                                  width: 40,
                                  child:
                                      SvgPicture.asset('assets/svg/cod.svg')),
                              const SizedBox(width: 20),
                              const Text('COD',
                                  style: AppTheme.textStyle16blackbold)
                            ],
                          ),
                          Radio(
                              value: 2,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 2;
                                });
                              }),
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _value = 3;
                    });
                  },
                  child: Container(
                    height: 70,
                    width: width,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _value == 3
                                ? AppTheme.black
                                : AppTheme.bluewhite,
                            width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset(
                                      'assets/svg/credit-debit-card.svg')),
                              const SizedBox(width: 20),
                              const Text('Credit/Debit card',
                                  style: AppTheme.textStyle16blackbold)
                            ],
                          ),
                          Radio(
                              value: 3,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 3;
                                });
                              }),
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _value = 4;
                    });
                  },
                  child: Container(
                    height: 70,
                    width: width,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _value == 4
                                ? AppTheme.black
                                : AppTheme.bluewhite,
                            width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset(
                                      'assets/svg/netbank.svg')),
                              const SizedBox(width: 20),
                              const Text('Net banking',
                                  style: AppTheme.textStyle16blackbold)
                            ],
                          ),
                          Radio(
                              value: 4,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = 4;
                                });
                              }),
                        ]),
                  ),
                ),
              ],
            ),
            Container(
              width: width,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: AppTheme.bluewhite),
                child: const Text(
                  "Confirm Order",
                  style: AppTheme.textStyle16blackbold,
                ),
                onPressed: () async {
                  if (_value == 1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppTheme.black,
                        content: Text(
                          "pressed 1",
                          style: AppTheme.textStyle16whitebold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else if (_value == 2) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppTheme.black,
                        content: Text(
                          "pressed 2",
                          style: AppTheme.textStyle16whitebold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else if (_value == 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppTheme.black,
                        content: Text(
                          "pressed 3",
                          style: AppTheme.textStyle16whitebold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else if (_value == 4) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppTheme.black,
                        content: Text(
                          "pressed 4",
                          style: AppTheme.textStyle16whitebold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppTheme.black,
                        content: Text(
                          "something pressed",
                          style: AppTheme.textStyle16whitebold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  // String description = '''Order Order Order!
                  // You have recieved order from ${widget.name} and
                  // the address is ${widget.address} ${widget.area} ${widget.city}
                  // ${widget.state} ${widget.country} - ${widget.pincode}''';
                  // // String url = 'https://wa.me/+$phoneNumber?text=$description';
                  // String url =
                  //     'whatsapp://send?phone=$phoneNumber&text=$description';
                  // if (await launchUrlString(url)) {
                  //   await launchUrlString(url);
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       behavior: SnackBarBehavior.floating,
                  //       backgroundColor: AppTheme.black,
                  //       content: Text(
                  //         "Something went wrong",
                  //         style: AppTheme.textStyle16whitebold,
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   );
                  // }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
