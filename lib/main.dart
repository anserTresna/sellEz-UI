import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/OnBoardingPage.dart';
import 'splash/splashScreen.dart';
import 'menubar/ResponsiveNavBarPage.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SellEZ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Definisi route
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnBoardingPage(),
        '/menubar': (context) => ResponsiveNavBarPage(),
      },
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
    ); 
  }
}