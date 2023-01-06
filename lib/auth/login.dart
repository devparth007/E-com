import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen.dart';
import 'package:flutter_application_2/theme/theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _obsecure = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _name,
                  style: AppTheme.textStyle18blackW6,
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
                  controller: _email,
                  style: AppTheme.textStyle18blackW6,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: AppTheme.black,
                  validator: (value) {
                    String pattern =
                        r"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
                    RegExp regex = RegExp(pattern);
                    if (value!.isEmpty) {
                      return "ⓘ Please enter email address";
                    } else if (!regex.hasMatch(value)) {
                      return "ⓘ Invalid email address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Email',
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
                  controller: _pass,
                  obscureText: _obsecure,
                  style: AppTheme.textStyle18blackW6,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: AppTheme.black,
                  validator: (value) {
                    String pattern =
                        r"(?=^.{8,}$)(?=.*\d)(?=.*[!@#$%^&*]+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$";
                    RegExp regex = RegExp(pattern);
                    if (value!.isEmpty) {
                      return "ⓘ Required";
                    } else if (!regex.hasMatch(value)) {
                      return "ⓘ Password must contain 8 characters with at least one uppercase and one special character.";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obsecure = !_obsecure;
                            });
                          },
                          icon: Icon(
                            _obsecure ? Icons.visibility : Icons.visibility_off,
                          )),
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
                const SizedBox(height: 20),
                SizedBox(
                  width: width,
                  height: 50,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: AppTheme.bluewhite),
                    child: const AutoSizeText(
                      "Login",
                      style: AppTheme.textStyle16blackbold,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Screen(),
                            ));
                      }
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
