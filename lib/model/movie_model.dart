// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    required this.title,
    required this.rating,
    required this.poster,
    required this.wallpaper,
    required this.categories,
  });

  String title;
  int rating;
  String poster;
  String wallpaper;
  String categories;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["title"],
        rating: json["rating"],
        poster: json["poster"],
        wallpaper: json["wallpaper"],
        categories: json["categories"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "rating": rating,
        "poster": poster,
        "wallpaper": wallpaper,
        "categories": categories,
      };
}
