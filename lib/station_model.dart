import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class Station {
  final String line;
  final String name;
  final int code;
  final double lat;
  final double lng;

  Station(this.line, this.name, this.code, this.lat, this.lng);

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      json['line'],
      json['name'],
      json['code'],
      json['lat'],
      json['lng'],
    );
  }
}
