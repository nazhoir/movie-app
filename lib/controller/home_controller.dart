import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:moviez/model/movie_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends ChangeNotifier {
  final String mainURL = "https://my-json-server.typicode.com/nazhoir/moviez/";
  final String mainImageURL = "https://www.themoviedb.org/t/p/original";

  Future<List<Movie>> popularMovie() async {
    Uri url = Uri.parse("${mainURL}popular");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Movie.fromJson(e)).toList();
    }
  }

  Future<List<Movie>> disneyMovie() async {
    Uri url = Uri.parse("${mainURL}disney");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Movie.fromJson(e)).toList();
    }
  }
}
