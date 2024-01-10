import 'package:flutter/material.dart';
import 'package:my_food_app/bei/components/details.dart';
import 'package:my_food_app/bei/components/historyTable.dart';

class coinHistory extends StatefulWidget {
  const coinHistory({Key? key}) : super(key: key);

  @override
  State<coinHistory> createState() => _coinHistoryState();
}

// class _coinHistoryState extends State<coinHistory> {
// @override
// Widget build(BuildContext context) {
// return Scaffold(
// body: LayoutBuilder(
// builder: (context, constraints) {
// if (constraints.maxWidth > 600) {
// return _buildTabletLayout();
// } else {
// return _buildMobileLayout();
// }
// },
// ),
// );
// }
//
// Widget _buildMobileLayout() {
// return Container(
// width: double.infinity,
// child: Column(
// children: [
// Container(
// padding: const EdgeInsets.all(14),
// decoration: const BoxDecoration(
// color: Color(0xFF034F96),
// ),
// child: const Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// Text(
// 'All Coin Stakes',
// style: TextStyle(
// color: Colors.white,
// fontSize: 26,
// decoration: TextDecoration.none,
// ),
// ),
// ],
// ),
// SizedBox(
// height: 40,
// ),
// Expanded(
// child: Details(),
// ),
// ],
// ),
// ),
// Container(
// height: MediaQuery.of(context).size.height,
// padding: const EdgeInsets.all(14),
// decoration: const BoxDecoration(
// color: Color(0xFF001234),
// ),
// child: const Text(
// 'My History',
// style: TextStyle(
// color: Colors.white,
// fontSize: 26,
// decoration: TextDecoration.none,
// ),
// ),
// ),
// ],
// ),
// );
// }
//
// Widget _buildTabletLayout() {
// return Container(
// width: double.infinity,
// child: Row(
// children: [
// Expanded(
// flex: 1,
// child: Container(
// padding: const EdgeInsets.all(14),
// decoration: const BoxDecoration(
// color: Color(0xFF034F96),
// ),
// child: const Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// Text(
// 'All Coin Stakes',
// style: TextStyle(
// color: Colors.white,
// fontSize: 26,
// decoration: TextDecoration.none,
// ),
// ),
// ],
// ),
// SizedBox(
// height: 40,
// ),
// Expanded(
// child: Details(),
// ),
// ],
// ),
// ),
// ),
// Expanded(
// flex: 4,
// child: Container(
// height: MediaQuery.of(context).size.height,
// padding: const EdgeInsets.all(14),
// decoration: const BoxDecoration(
// color: Color(0xFF001234),
// ),
// child: const Text(
// 'My History',
// style: TextStyle(
// color: Colors.white,
// fontSize: 26,
// decoration: TextDecoration.none,
// ),
// ),
// ),
// ),
// ],
// ),
// );
// }
// }
//

class _coinHistoryState extends State<coinHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 1,
                              
             child: Container(
                  // height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color:
                        Color(0xFF034F96) // Background color
                    // border: Border.all(
                    //   color: Colors.red, // Border color
                    //   width: 2.0, // Border width
                    // ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'All Coin Stakes',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Expanded(
                        child: Details(),
                      )
                    ],
                  )
                  ),
            ),


            Expanded(
              flex: 4,
              child: Container(
                      height: MediaQuery.of(context).size.height,
                    
                      decoration:  BoxDecoration(
                        color: Color(0xFF034F96), 
                      ),

                  child: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container(
                          child: Column(
                          children: [
                            Row(
                              children: [
                                  Container(
                                    
                                  child:  Text(
                                          'My History',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 26,
                                              decoration: TextDecoration.none),
                                        ),
                                  )
                              ],
                            ),
                            

                            Row(
                              children: [

                              ],
                            )
                          ],


                        ),

                        ),                     




                        Expanded(
                          child: CoinTable()
                          )
                      ],
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
