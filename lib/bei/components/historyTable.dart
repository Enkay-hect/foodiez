import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinTable extends StatefulWidget {
  @override
  _CoinTableState createState() => _CoinTableState();
}

class _CoinTableState extends State<CoinTable> {
  List<Map<String, dynamic>> coinData = [];

  final List<String> headers = ['userId', 'id', 'title', 'body'];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        coinData = List<Map<String, dynamic>>.from(data);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      scrollDirection: Axis.horizontal,
      
      child: SingleChildScrollView(
            child: DataTable(
                columns: [
                  for (var header in headers)
                    DataColumn(
                      label: Text(header, style: TextStyle(color: Colors.white),),
                    ),
                ],

          rows: [
            for (int i = 0; i < coinData.length; i++)
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
                  for (var header in headers)
                    DataCell(
                      Container(
                          // padding: EdgeInsets.all(14), 
                          child: Text('${coinData[i][header] ?? ""}', style: TextStyle(color: Colors.white),),
                          
                      )
                    ),
                ],
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
