import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'screen/OnBoardingPage.dart';
import 'menubar/ResponsiveNavBarPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );

  // Menjalankan fungsi initIntroduction() untuk menginisialisasi nilai introduction
  await initIntroduction();

  runApp(MyApp());
}

Future<void> initIntroduction() async {
  final prefs = await SharedPreferences.getInstance();

  int? intro = prefs.getInt('Introduction');
  print('intro : $intro');
  if (intro != null && intro == 1) {
    introduction = 1;
  }
  prefs.setInt('Introduction', 1);
}

int introduction = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SellEZ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: introduction == 0
          ? SplashScreen()
          : introduction == 1
              ? SplashScreen()
              : ResponsiveNavBarPage(),
      // Definisi route
      initialRoute: '/',
      routes: {
        '/onboarding': (context) => OnBoardingPage(),
        '/menubar': (context) => ResponsiveNavBarPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Menentukan halaman berikutnya
      Widget nextScreen;
      if (introduction == 0) {
        nextScreen = OnBoardingPage();
      } else {
        nextScreen = ResponsiveNavBarPage();
      }

      // Navigasi ke halaman berikutnya setelah 3 detik
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => nextScreen),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // set background putih
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}




