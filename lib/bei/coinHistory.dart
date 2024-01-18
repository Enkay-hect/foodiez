import 'package:flutter/material.dart';
import 'package:my_food_app/bei/components/details.dart';
import 'package:my_food_app/bei/components/historyTable.dart';

class coinHistory extends StatefulWidget {
  const coinHistory({Key? key}) : super(key: key);

  @override
  State<coinHistory> createState() => _coinHistoryState();
}


List names = ["18/20 - 2010", "Game Type", 'Status'];

class _coinHistoryState extends State<coinHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: const Text(
                              'All Coin Stakes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  decoration: TextDecoration.none),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 10,
                              //MediaQuery.of(context).size.width,
                            ),
                            child: Details(),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Color(0xFF034F96),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 2, 53, 100),
                        border: Border(bottom: BorderSide(color: Colors.white)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 65),
                                child: const Text(
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
                                margin: const EdgeInsets.only(bottom: 40),
                                child: Row(
                                    children: List.generate(
                                  3,
                                  (index) => Row(
                                    children: [
                                      dateContainer(
                                        name: names[index],
                                      ),
                                      const SizedBox(
                                          width:
                                              16.0), // Adjust the width as needed
                                    ],
                                  ),
                                )),
                              ),
                              const Spacer(),
                              Container(
                                margin: const EdgeInsets.only(bottom: 40),
                                child: Row(
                                    children: List.generate(
                                        10, (index) => const htContainer())),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Expanded(child: CoinTable()),
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
            color: const Color(0xFF001234),
            border: Border.all(color: Colors.white)),
        child: const Center(
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
      padding: const EdgeInsets.all(10),
      height: 40,
      width: 150,
      color: Colors.white,
      child: Row(
        children: [
          Row(
            children: [Text(name)],
          ),
          const Spacer(),
          const Row(
            children: [
              Icon(Icons.sort),
            ],
          )
        ],
      ),
    );
  }
}
