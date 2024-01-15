import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_food_app/bei/apiServices/apiClient.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class status extends StatefulWidget {
  const status({Key? key}) : super(key: key);

  @override
  State<status> createState() => _statusState();
}

class _statusState extends State<status> {
  List<dynamic> dataList = [];

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        if (data.isNotEmpty && data[0] is Map<String, dynamic>) {
          // Assign the list of objects to dataList
          setState(() {
            dataList = data;
          });
        } else {
          print('Unexpected data structure in the response.');
        }
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('GET Request failed: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            // Check if index is within the valid range
            if (index >= 0 && index < dataList.length) {
              // Access specific properties like id andn symbol from each object
              final id = dataList[index]['id'];
              final symbol = dataList[index]['symbol'];
              final imageUrl = dataList[index]['image'];
              final rank = dataList[index]['market_cap_rank'];
              final priceChangeKey = 'price_change_24h';
              final rawPriceChange = dataList[index][priceChangeKey];

              // Truncate the rawPriceChange value to a maximum length of 5 characters
              final truncatedPriceChange =
                  truncateText(rawPriceChange.toString(), 7);

              return Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(bottom: 20, top: 20, left: 10, right: 10),
                  margin: EdgeInsets.all(10),
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
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.all(20),
                                child:
                                    // Image.network(imageUrl),
                                    Image.network(
                                  ' Image.network(imageUrl)',
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                        ),
                                      );
                                    }
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object error, StackTrace? stackTrace) {
                                    print('Error loading image: $error');
                                    return Center(
                                      child: Text('Error loading image'),
                                    );
                                  },
                                ))
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 230,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '$id \n$symbol \nRank: $rank',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Text(
                                          '\$$truncatedPriceChange \n0.38% \n24hrs',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
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
                  ));
            } else {
              // Return a placeholder widget or handle the out-of-range case
              return Container(
                width: 0, // Set to 0 to make it invisible
              );
            }
          },
          options: CarouselOptions(
            height: 200,
            // enlargeCenterPage: true,
            // aspectRatio: 16 / 9,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

// class CoinGeckoApi extends StatelessWidget {
//   const CoinGeckoApi({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 150,
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.all(40),
//         margin: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//             color: Colors.red,
//             border: Border.all(style: BorderStyle.none),
//             borderRadius: BorderRadius.circular(20)),
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.all(20),
//                     child: Text('Icon'),
//                   )
//                 ],
//               ),
//               Spacer(),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                       width: 250,
//                       child: Row(
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 'XDC Network \nXDC \nRank: 100',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 15),
//                               )
//                             ],
//                           ),
//                           Spacer(),
//                           Column(
//                             children: [
//                               Text(
//                                 '\$0.0004 \n0.38% \n24hrs',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 15),
//                                 textAlign: TextAlign.end,
//                               )
//                             ],
//                           )
//                         ],
//                       )),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
