import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/showaddress.dart';
import 'package:flutter_application_2/theme/theme.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({Key? key}) : super(key: key);

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mobileNo = TextEditingController();
  final TextEditingController _add = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _area = TextEditingController();
  final TextEditingController _pincode = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText('Add Adress'),
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _name,
                  style: AppTheme.textStyle16blackbold,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: AppTheme.black,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'ⓘ Required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Name',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorStyle: AppTheme.textStyle16Redbold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _mobileNo,
                  style: AppTheme.textStyle16blackbold,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: AppTheme.black,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(10)
                  ],
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'ⓘ Required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Mobile no.',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorStyle: AppTheme.textStyle16Redbold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _add,
                  style: AppTheme.textStyle16blackbold,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: AppTheme.black,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'ⓘ Required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Address',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorStyle: AppTheme.textStyle16Redbold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _area,
                  style: AppTheme.textStyle16blackbold,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: AppTheme.black,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'ⓘ Required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Area',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorStyle: AppTheme.textStyle16Redbold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _city,
                  style: AppTheme.textStyle16blackbold,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: AppTheme.black,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'ⓘ Required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'City',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorStyle: AppTheme.textStyle16Redbold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _pincode,
                  keyboardType: TextInputType.number,
                  style: AppTheme.textStyle16blackbold,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: AppTheme.black,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(6)
                  ],
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'ⓘ Required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Pincode',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorStyle: AppTheme.textStyle16Redbold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _state,
                  style: AppTheme.textStyle16blackbold,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: AppTheme.black,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'ⓘ Required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'State',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorStyle: AppTheme.textStyle16Redbold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _country,
                  style: AppTheme.textStyle16blackbold,
                  textInputAction: TextInputAction.done,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: AppTheme.black,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'ⓘ Required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Country',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorStyle: AppTheme.textStyle16Redbold),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: width,
                  height: 50,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: AppTheme.bluewhite),
                    child: const AutoSizeText(
                      "Confirm Address",
                      style: AppTheme.textStyle16blackbold,
                    ),
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowAdd(
                                name: _name.text,
                                mobileNo: _mobileNo.text,
                                address: _add.text,
                                city: _city.text,
                                area: _area.text,
                                pincode: _pincode.text,
                                state: _state.text,
                                country: _country.text),
                          ));
                      // }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
