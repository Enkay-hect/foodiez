import 'package:flutter/material.dart';
import 'package:my_food_app/screens/happybowl.dart';
import 'package:my_food_app/screens/happygirl.dart';

class happyride extends StatelessWidget {
  const happyride({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/bike.png')),
                ],
              ),

              const SizedBox(height: 20.0),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Seamless Deliveries!', 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Nourd-Regular',
                      fontSize: 20,
                    ), 
                  ),
                ],
              ),

              const SizedBox(height: 100.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const happybowl()),
                        );
                        },
                        style: OutlinedButton.styleFrom(
                                      backgroundColor: const Color(0xFFE84B1D), 
                                      foregroundColor: Colors.white,
                                      side: const BorderSide(color: Color(0xFFE84B1D))
                                      ), 
                        child: const Text('Previous'),
                      ),
                    ],
                  ), 

                const SizedBox(width: 100,),

                  Column(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const happygirl()),
                        );
                        },
                        style: OutlinedButton.styleFrom(
                                      backgroundColor: const Color(0xFFE84B1D), 
                                      foregroundColor: Colors.white,
                                      side: const BorderSide(color: Color(0xFFE84B1D))
                                      ), 
                        child: const Text('Next'),
                      ),
                    ],
                  ), 
                ],
              ),
            ],
          ),
        ),

      )
    );
  }
}