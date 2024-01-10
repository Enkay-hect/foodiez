import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Map<String, dynamic>> items = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        items = List<Map<String, dynamic>>.from(data);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      
      child: ListView.builder(
        key: Key('uniqueKey'),
        physics: AlwaysScrollableScrollPhysics(),

        shrinkWrap: true,
        // itemCount: items.length,
        itemCount: 6,
        
        itemBuilder: (context, index) {
          return Container(
            
              decoration: BoxDecoration(
                color: Color(0xFF001234), // Background color
                borderRadius: BorderRadius.circular(10.0), // Border radius

                border: Border.all(
                    // color: Colors.red, // Border color
                    // width: 2.0, // Border width
                    ),
              ),
              
              margin: EdgeInsets.only(bottom: 20.0), // Adjust the margin as needed
              padding: EdgeInsets.all(0),
              // width: MediaQuery.of(context).size.width,
              child: const ListTile(
                
                  title: Column(
                  children: [

                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Wallet Address:',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '0xcynf659mbjbcj.',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.account_balance_wallet,
                                    size: 24.0,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Side Predicted:',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 153,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Head',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.monetization_on,
                                    size: 24.0,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Amount Staked',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 150,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$2.35',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.monetization_on_rounded,
                                    size: 24.0,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Odds',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 225,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '1.50',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.account_balance_wallet,
                                    size: 24.0,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 181,
                              ),
                              // Spacer(),
                              // Expanded(child: Container()),
                              
                              Row(
                                children: [
                                  Text(
                                    '2023-10-14',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.alarm,
                                    size: 24.0,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )


                ],
              ),
              ),

              );

        },
      ),
    );
  }
}
