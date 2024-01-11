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

List names = ["18/20 - 2010", "Game Type", 'Status'];

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
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color(0xFF034F96) // Background color
                      // border: Border.all(
                      //   color: Colors.red, // Border color
                      //   width: 2.0, // Border width
                      // ),
                      ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                               padding: EdgeInsets.all(20),
                            child: const Text(
                            'All Coin Stakes',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                decoration: TextDecoration.none),
                          ),)
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Expanded(
                        child: Details(),
                      )
                    ],
                  )),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                height: MediaQuery.of(context).size.height,

                decoration: BoxDecoration(
                  color: Color(0xFF034F96),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 53, 100),
                        border: Border(bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 65),
                                child: Text(
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
                              Container(
                                margin: EdgeInsets.only(bottom: 40),
                                child: Row(
                                    children: List.generate(
                                  3,
                                  (index) => Row(
                                    children: [
                                      dateContainer(
                                        name: names[index],
                                      ),
                                      SizedBox(
                                          width:
                                              16.0), // Adjust the width as needed
                                    ],
                                  ),
                                )),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(bottom: 40),
                                child: Row(
                                    children: List.generate(
                                        10, (index) => htContainer())),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: CoinTable()
                    ),
               
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

class htContainer extends StatelessWidget {
  const htContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 35,
        decoration: BoxDecoration(
            color: Color(0xFF001234), border: Border.all(color: Colors.white)),
        child: Center(
          child: Text(
            'H',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ));
  }
}

class dateContainer extends StatelessWidget {

  const dateContainer({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 40,
      width: 150,
      color: Colors.white,
      child: Row(
        children: [
          Row(
            children: [Text(name)],
          ),
          Spacer(),
          Row(
            children: [
              Icon(Icons.sort),
            ],
          )
        ],
      ),
    );
  }
}
