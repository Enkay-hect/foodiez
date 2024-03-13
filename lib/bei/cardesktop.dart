import 'package:flutter/material.dart';
import 'package:my_food_app/bei/car/cardesktop.dart';
import 'package:my_food_app/bei/car/carmobile.dart';

class cardesktopscreen  extends StatelessWidget {
  const cardesktopscreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => car_mobile()),
                );
              },
              child: Container(
                child: Text('Mobile'),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => car_des()),
                );
              },
              child: Container(
                child: Text('Desktop'),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
