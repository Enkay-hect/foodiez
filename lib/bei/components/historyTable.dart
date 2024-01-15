import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:my_food_app/bei/apiServices/apiClient.dart';

class CoinTable extends StatefulWidget {
  const CoinTable({super.key});

  @override
  _CoinTableState createState() => _CoinTableState();
}

class _CoinTableState extends State<CoinTable> {
  List<String> headers = [];
  List<dynamic> dataList = [];

  Future<void> fetchData() async {
    try {
      final dynamic response = await ApiClientService.get('/dice');

      if (response is Map<String, dynamic> &&
          response['data'] is List<dynamic>) {
        List<dynamic> data = response['data'];

        if (data.isNotEmpty && data[0] is Map<String, dynamic>) {
          headers = data[0].keys.toList();

          dataList = data
              .map((item) => headers.map((header) => item[header]).toList())
              .toList();

          print('GET Data (Headers): $headers');
          print('GET Data (List): $dataList');
          
        } else {
          print('Unexpected data structure in the response.');
        }
      } else {
        print('Unexpected response type or missing "data" field.');
      }
    } catch (e) {
      print('GET Request failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: DataTable(
                horizontalMargin: 8.0,
                columnSpacing: 55.0,
                columns: [
                  for (var header in headers)
                    DataColumn(
                      label: Text(
                        header,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                ],
                rows: [
                  for (var rowData in dataList)
                    DataRow(
                      color: MaterialStateColor.resolveWith(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return Color(0xFF001234); // Selected color
                          }
                          return Color(0xFF001234); // Default color
                        },
                      ),
                      cells: [
                        for (var data in rowData)
                          DataCell(
                            Container(
                              width: 100.0,
                              child: Text(
                                data?.toString() ?? '',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}


  // DataRow HistoryTableRow(List<dynamic> dataList) {

    
  //   return DataRow(
  //     color: MaterialStateColor.resolveWith(
  //       (Set<MaterialState> states) {
  //         if (states.contains(MaterialState.selected)) {
  //           return Color(0xFF001234); // Selected color
  //         }
  //         return Color(0xFF001234); // Default color
  //       },
  //     ),
  //      cells: [
  //       for (var data in rowData)
  //         DataCell(
  //           Container(
  //             width: 100.0,
  //             child: Text(
  //               data?.toString() ?? '',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //         ),
  //     ],
  //   );
  // }


