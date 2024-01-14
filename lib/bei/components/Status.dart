import 'package:flutter/material.dart';

class status extends StatelessWidget {
  const status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(40),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // margin: EdgeInsets.all(20),
                      child: Text('Icon'),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 250,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'XDC Network \nXDC \nRank: 100',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  '\$0.0004 \n0.38% \n24hrs',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                  textAlign: TextAlign.end,
                                )
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
