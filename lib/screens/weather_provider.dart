import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apikey = "a1fc9e6c652b4edfaab143006222507";
  final String _baseURL = "api.weatherapi.com";
  final String _q = 'Durango';
  final String _days = '5';
  final String _aqi = 'no';
  final String _alert = 'no';

  List<dynamic> dataMovies = [];
  List<dynamic> dataPopular = [];
  List<dynamic> dataUpcoming = [];

  MoviesProvider(){getClima();}

    getClima() async {
    var url = Uri.https(_baseURL,'/v1/',{'api_key': _apikey, 'q':_q, 'days': _days, 'aqi': _aqi, 'alert': _alert});

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      dataUpcoming = jsonResponse["results"];
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

}