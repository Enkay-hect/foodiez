import 'package:flutter/material.dart';
import 'package:my_food_app/bei/apiServices/provider.dart';

class OddsDisplayWidget extends StatefulWidget {
  @override
  _OddsDisplayWidgetState createState() => _OddsDisplayWidgetState();
}

class _OddsDisplayWidgetState extends State<OddsDisplayWidget> {
  late Future<List<Odds>> futureOdds;
  late double raceOdds;

  @override
  void initState() {
    super.initState();
    futureOdds = fetchOdds();
    raceOdds = 0.0;
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Odds Display'),
      ),
      body: Center(
        child: FutureBuilder<List<Odds>>(
          future: futureOdds,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final oddsList = snapshot.data!;
              // Find odds for race type
              final raceOddsData = oddsList.firstWhere((odd) => odd.type == 'race', orElse: () => Odds(id: -1, maxAmount: 0, minAmount: 0, odds: 0, type: 'race'));
              raceOdds = raceOddsData.odds;
              return Text(
                'Race Odds: $raceOdds',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
