import 'package:flutter/material.dart';
import 'package:my_food_app/bei/cardesktop.dart';
import 'package:my_food_app/bei/coinHistory.dart';
import 'package:my_food_app/bei/components/Status.dart';
import 'package:my_food_app/bei/components/audioPlayer.dart';
import 'package:my_food_app/bei/components/imageCarousel.dart';
import 'package:my_food_app/screens/happybowl.dart';
import 'package:my_food_app/screens/testoddspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: cardesktopscreen(),
        // status()
        //  coinHistory(),
        // ImageCarousel(),

        // happybowl(),
        // home: landing(),
        );
  }
}
