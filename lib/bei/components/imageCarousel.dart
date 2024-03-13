import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  List<dynamic> dataList = [];

  Future<void> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse('https://webadmin.smartcryptobet.co/api/fetch-adverts'));

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        // print(data);
        // print(data["response"]["data"][0]["url"]);
        setState(() {
          dataList.add(data);
        });

        // print(dataList);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildCarousel(),
    );
  }

Widget buildCarousel() {
  return CarouselSlider(
    items: dataList.map<Widget>((item) {
      final length = item.length;
      int currentIndex = dataList.indexOf(item); // Get the current index
      String imageUrl = item["response"]["data"][currentIndex]["image"] ?? 'N/A';
     
      return Container(
        height: 450,
        width: 500,
        margin: EdgeInsets.all(8.0),
        child: Image.network(
          'https://webadmin.smartcryptobet.co/images/ads/$imageUrl',
          fit: BoxFit.contain,
        ),
      );
    }).toList(),
    options: CarouselOptions(
      aspectRatio: 16 / 9,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      viewportFraction: 1,
    ),
  );
}

}
