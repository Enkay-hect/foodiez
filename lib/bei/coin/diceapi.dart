import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RaceData {
  final String wallet;
  final double amount;
  final double side;
  final double prediction;
  final double odds;
  final String type;

  RaceData({
    required this.wallet,
    required this.amount,
    required this.side,
    required this.prediction,
    required this.odds,
    required this.type,
  });

  factory RaceData.fromJson(Map<String, dynamic> json) {
  return RaceData(
    wallet: shortenWalletAddress(json['wallet'] ?? ''), 
    amount: json['amount'] != null ? double.tryParse(json['amount'].toString()) ?? 0.0 : 0.0, 
    prediction: json['prediction'] != null ? double.tryParse(json['prediction'].toString()) ?? 0.0 : 0.0, 
    odds: json['odds'] != null ? double.tryParse(json['odds'].toString()) ?? 0.0 : 0.0, 
    side: json['side'] != null ? double.tryParse(json['side'].toString()) ?? 0.0 : 0.0, 
    type: json['type'] ?? '', 
  );
}

}

Future<List<RaceData>> fetchOdds() async {
  final url =
      Uri.parse('https://server.smartcryptobet.co/v1/coin/history?key=K10llGN3RB');

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((item) => RaceData.fromJson(item)).toList();
    } else {
      throw Exception('Failed 1');
    }
  } catch (e) {
    throw Exception('Failed 2: $e');
  }
}



String shortenWalletAddress(String address, {int prefixLength = 6, int suffixLength = 6}) {
  if (address.length <= prefixLength + suffixLength) {
    return address;
  } else {
    final String prefix = address.substring(0, prefixLength);
    final String suffix = address.substring(address.length - suffixLength);
    return '$prefix.....$suffix';
  }
}


// K10llGN3RB