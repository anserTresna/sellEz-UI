import 'package:sellez_mobile/main.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sellez_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:sellez_mobile/menubar/ResponsiveNavBarPage.dart';
import 'package:sellez_mobile/screen/OnBoardingPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Card(
            elevation: 8,
            child: Container(
              padding: const EdgeInsets.all(32.0),
              constraints: const BoxConstraints(maxWidth: 350),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                    ),
                    _gap(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Welcome to SellEZ!",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0),
                    //   child: Text(
                    //     "Enter your email and password to continue.",
                    //     style: Theme.of(context).textTheme.caption,
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    _gap(),
                    TextFormField(
                      
                      validator: (value) {
                        // add email validation
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }

                      //   bool emailValid = RegExp(
                      //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      //       .hasMatch(value);
                      //   if (!emailValid) {
                      //     return 'Please enter a valid email';
                      //   }

                      //   return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        // prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }

                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          // prefixIcon: const Icon(Icons.lock_outline_rounded),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(_isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          )),
                    ),
                    _gap(),
                    // CheckboxListTile(
                    //   value: _rememberMe,
                    //   onChanged: (value) {
                    //     if (value == null) return;
                    //     setState(() {
                    //       _rememberMe = value;
                    //     });
                    //   },
                    //   title: const Text('Remember me'),
                    //   controlAffinity: ListTileControlAffinity.leading,
                    //   dense: true,
                    //   contentPadding: const EdgeInsets.all(0),
                    // ),
                    // _gap(),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0),
                    //   child: Text(
                    //     "Belum Memiliki Akun? Daftar Sekarang.",
                    //     style: Theme.of(context).textTheme.caption,
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    _gap(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ResponsiveNavBarPage();
                            }));
                          }
                        },
                      ),
                    ),
                    _gap(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          primary: Color.fromARGB(255, 255, 255, 255),
                          onPrimary: Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Kembali',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OnBoardingPage();
                          }));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
