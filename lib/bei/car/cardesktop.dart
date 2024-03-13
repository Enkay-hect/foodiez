import 'package:flutter/material.dart';
import 'package:my_food_app/bei/car/carapi.dart';

class car_des extends StatefulWidget {
  const car_des({super.key});

  @override
  State<car_des> createState() => _car_desState();
}

class _car_desState extends State<car_des> {
  late Future<List<RaceData>> futureData;
  late String wallet;
  late String prediction;
  late String amount;
  late String odds;
  late String side;

  @override
  void initState() {
    super.initState();
    futureData = fetchOdds();

    wallet = '';
    prediction = '';
    amount = '';
    odds = '';
    side = '';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RaceData>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final dataList = snapshot.data!;
            final raceData = dataList.first;

            wallet = raceData.wallet;
            prediction = raceData.prediction.toString();
            amount = raceData.amount.toString();
            odds = raceData.odds.toString();
            side = raceData.side.toString();


            //body here

            return Center(
              child: Container(
                child: Column(children: [

                  Text(wallet),
                  Text(prediction),
                  Text(amount),
                  Text(odds),
                  Text(side),

                ],)
              ),
            );



          }
        });
  }
}
