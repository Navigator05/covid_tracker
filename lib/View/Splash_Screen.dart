import 'dart:async';

import 'package:covid_tracker/Routring/route_name.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
// ignore: camel_case_types
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

// ignore: camel_case_types
class _Splash_ScreenState extends State<Splash_Screen> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, RouteName.WorldStateScreen);

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         AnimatedBuilder(
           animation: _controller,
           child: Container(
             height: 300,
             width: 300,
             child: const Center(child: Image(image: AssetImage("assets/images/virus1.png"),fit: BoxFit.fill,),),
           ),
           builder:(BuildContext context,Widget? child){
           return Transform.rotate(angle: _controller.value * 2.0 * math.pi,
           child: child,
           );
           },),
            SizedBox(height: MediaQuery.of(context).size.height * .07,),
            const Align(child: Text("COVID-19\nTracker App",textAlign: TextAlign.center,style: TextStyle(
              color:  Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),)
          ],
        ),
      ),
    );
  }
}
