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

        setState(() {
          dataList.add(data);
        });

        print(dataList);

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
    return Container();

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Carousel'),
    //   ),
    //   body: FutureBuilder(
    //     future: fetchData(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         if (snapshot.hasError) {
    //           return Center(
    //             child: Text('Error: ${snapshot.error}'),
    //           );
    //         }

    //         return buildCarousel();
    //       } else {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //     },
    //   ),
    // );
  }

  Widget buildCarousel() {
    return CarouselSlider(
      items: dataList.map<Widget>((item) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Image.network(
            item['image'], // Replace with your actual image URL key
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        // enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 1,
      ),
    );
  }
}
