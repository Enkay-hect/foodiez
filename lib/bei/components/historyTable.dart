import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_food_app/bei/apiServices/apiClient.dart';

class CoinTable extends StatefulWidget {
  @override
  _CoinTableState createState() => _CoinTableState();
}

class _CoinTableState extends State<CoinTable> {
  List<Map<String, dynamic>> coinData = [];

  final List<String> headers = [
    'Game Type',
    'Prediction',
    'Stake',
    'Odds',
    'Game Result',
    'Status',
    'Payout',
    'Date'
  ];
  final List<String> celldatas = ['1', '2', '3', '4', '5', '6', '7', '8'];

  @override
    void initState() {
      super.initState();
      fetchData();
    }

  Future<void> fetchData() async {
  try {
    final dynamic getData = await ApiClientService.get('/stake');

    if (getData is List<dynamic>) {
      // Handle list data
      List<dynamic> dataList = getData;
      print('GET Data (List): $dataList');
    } else if (getData is Map<String, dynamic>) {
      // Handle map data
      Map<String, dynamic> dataMap = getData;
      print('GET Data (Map): $dataMap');
    } else {
      print('Unexpected response type');
    }
  } catch (e) {
    print('GET Request failed: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          // horizontalMargin: 22.0, // Adjust the horizontal margin as needed
          columnSpacing: 100.0,
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
            for (var celldata in celldatas)
              DataRow(
                color: MaterialStateColor.resolveWith(
                  (Set<MaterialState> states) {
                    // Use a different color when the row is selected
                    if (states.contains(MaterialState.selected)) {
                      return Color(0xFF001234); // Selected color
                    }
                    return Color(0xFF001234); // Use the default color
                  },
                ),

                cells: [
                  for (var data in celldatas)
                    DataCell(
                      Container(
                        width: 100.0, // Set the width for this cell
                        child: Text(
                          data,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                ],

                // cells: [
                //   for (var header in headers)
                //     DataCell(
                //       Container(
                //           // padding: EdgeInsets.all(14),
                //           child: Text('${coinData[i][header] ?? ""}', style: TextStyle(color: Colors.white),),

                //       )
                //     ),
                // ],
              ),
          ],
        ),
      ),
    );
  }
}

// class _CoinTableState extends State<CoinTable> {
//   List<Map<String, dynamic>> coinData = [];

//     final List<String> headers = ['Game Type', 'Prediction', 'Stake', 'Odds', 'Game Result', 'Status', 'Payout', 'Date'];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       setState(() {
//         coinData = List<Map<String, dynamic>>.from(data);
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: SingleChildScrollView(
//         child: DataTable(
//           columns: [
//             for (var header in headers)
//               const DataColumn(
//                 label: Text('header'),
//               ),
//           ],
//           rows: [
//             for (int i = 0; i < coinData.length; i++)
//               DataRow(
//                 cells: [
//                   for (int j = 1; j <= 8; j++)
//                     DataCell(
//                       Text('${coinData[i]['userId'] ?? ""}'), // Replace 'userId' with your actual data key
//                     ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
