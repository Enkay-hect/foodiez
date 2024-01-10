import 'package:flutter/material.dart';

class landing extends StatelessWidget {
  const landing({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    color: const Color(0xFFFFCC00), 
    child: const Image(image: AssetImage('images/landingimage.png'),),
    
    
    );
  }
}