import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:sellez_mobile/main.dart';

class OnBoardingPage extends StatefulWidget {
  final Key? key;
  const OnBoardingPage({this.key}) : super(key: key);
  
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
        titleTextStyle: TextStyle(
          fontFamily: 'Alef',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontFamily: 'Alef', fontSize: 16),
        bodyPadding: EdgeInsets.all(16));
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
            title: 'Stock Management',
            body: "Manage your supplier and Store goods",
            image: Lottie.asset('assets/animation/orange-boxes.json',repeat: true,reverse: true, width: 200, height: 200,),
                decoration: pageDecoration
                ),
                
        PageViewModel(
            title: 'Easy Payment',
            body: "Make payments and transaction easier for store",
            image: Lottie.asset('assets/animation/pocket-money.json', repeat: true, reverse: true,),
                decoration: pageDecoration
                ),
        PageViewModel(
            title: 'Selling Increase',
            body: 'Make your store sales increase with easy transaction and management',
            image: Lottie.asset('assets/animation/supermarket-cart.json',repeat: true, reverse: true,),
                decoration: pageDecoration,
                // footer: ElevatedButton(
                //   onPressed: () {},
                //   child: Text('Registrasi'),
                // )
              
                ),
        
              
      ],

      onDone: () {
        // Navigator.pushReplacement(context, 
        //   MaterialPageRoute(builder: (Builder) 
        // {
        //   return DashboardScreen();
        // }));
      },
      
      showSkipButton: true,
      showDoneButton: false,
      showNextButton: false,
      showBackButton: false,
      dotsFlex: 3,
      skipOrBackFlex: 1,
      back: Icon(Icons.arrow_back),
      skip: Text(
        'Skip', 
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      dotsDecorator: DotsDecorator(
        size: Size(10, 10),
        color: Colors.grey,
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
    );            
  }
}
