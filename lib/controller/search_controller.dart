import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/movie_model.dart';

class SearchController extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  final String mainURL = "https://my-json-server.typicode.com/nazhoir/moviez/";
  final String mainImageURL = "https://www.themoviedb.org/t/p/original";

  Future<List<Movie>> getAllMovie() async {
    Uri url = Uri.parse("${mainURL}all");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Movie.fromJson(e)).toList();
    }
  }

  int searchLength = 0;

  onSearch(String value) {
    searchLength = value.length;
    notifyListeners();
  }

  int searchResult = 0;
}
