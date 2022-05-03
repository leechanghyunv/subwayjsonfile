import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subwayjsonfile/search.dart';
import 'dart:convert';
import 'package:subwayjsonfile/station_model.dart';


class Stationjson extends StatefulWidget {
  const Stationjson({Key? key}) : super(key: key);

  @override
  State<Stationjson> createState() => StationjsonState();
}

class StationjsonState extends State<Stationjson> {

  Station station = Station();
  late String subName = '미정';
  late int subline = 0;
  late double sublat = 0;
  late double sublng = 0;

  Future<void> readJson(dynamic station) async {
    final String response = await rootBundle.loadString('assets/station_coorinate.json');
    final data = await json.decode(response);
    station = data['station'].map((data) => Station.fromJson(data)).
    setState((){
      subline = station.line;
      subName = station.name;
      sublat = station.lat;
      sublng = station.lng;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(  // 검색란
                      onPressed: () async {
                        var typedName = await Navigator.push(context,
                          MaterialPageRoute(   //typedName = subName
                            builder: (context) => search(),
                          ),
                        );
                        if (typedName!= null) { // 지하철을 검색한값 = typeNAme
                          var subName = typedName;
                          readJson(subName);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),

                Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      ' $subName 확인받음 $subline 호선 $sublng $sublng',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


