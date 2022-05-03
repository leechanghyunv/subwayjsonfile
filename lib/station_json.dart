import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:subwayjsonfile/station_model.dart';


class Stationjson extends StatefulWidget {
  const Stationjson({Key? key}) : super(key: key);

  @override
  State<Stationjson> createState() => StationjsonState();
}

class StationjsonState extends State<Stationjson> {

  List<dynamic> stationList = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/station_coorinate.json');
    final data = await json.decode(response);
    stationList = data['station'].map((data) => Station.fromJson(data)).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }



    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('station json'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        '$name°',
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$code in $line',
                  textAlign: TextAlign.right,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
