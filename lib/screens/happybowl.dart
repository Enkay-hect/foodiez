import 'package:flutter/material.dart';
import 'package:my_food_app/screens/happyride.dart';

class happybowl extends StatelessWidget {
  const happybowl({Key? key}) :super(key: key);

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
                  Image(image: AssetImage('images/bowl.png')),
                ],
              ),

              const SizedBox(height: 20.0),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Everything you love made fresh \nfrom the farm to your table..', 
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
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const happyride()),
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
        ),

      )
    );
  }
}