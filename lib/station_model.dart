import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class Station {
  String? line;
  String? name;
  double? lat;
  double? lng;

  Station({this.line, this.name, this.lat, this.lng});

  Station.fromJson(Map<String, dynamic> json) {
    line = json['line'];
    name = json['name'];
    lat = json['lat'];
    lng = json['lng'];
  }
}


