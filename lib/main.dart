import 'package:flutter/material.dart';
import 'package:my_food_app/bei/coinHistory.dart';
import 'package:my_food_app/bei/components/Status.dart';
import 'package:my_food_app/bei/components/imageCarousel.dart';
import 'package:my_food_app/screens/happybowl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: 
      // status()
      //  coinHistory(),
      ImageCarousel(),

      // happybowl(),
      // home: landing(),
    );
  }
}
