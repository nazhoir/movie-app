import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviez/widget/skeleton.dart';

import '../model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:moviez/constant.dart';
import 'package:moviez/widget/button.dart';
import 'widget/card_movie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => searchMovieScreenState();
}

// ignore: camel_case_types
class searchMovieScreenState extends State<SearchScreen> {
  final List<Movie> listMovies = [];
  final List<Movie> searchMovie = [];
  final url =
      Uri.parse("https://my-json-server.typicode.com/nazhoir/moviez/all");
  var loading = false;
  Future<void> fetchData() async {
    setState(
      () {
        loading = true;
      },
    );
    listMovies.clear();
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = (json.decode(response.body) as Map<String, dynamic>)["data"];
      setState(
        () {
          for (dynamic i in data) {
            listMovies.add(Movie.fromJson(i));
            loading = false;
          }
        },
      );
    }
  }

  TextEditingController controller = TextEditingController();

  onSearch(String text) async {
    searchMovie.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var movie in listMovies) {
      if (movie.title.contains(RegExp(text)) ||
          movie.categories.contains(text)) {
        searchMovie.add(movie);
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  onChanged: onSearch,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(9),
                    hintText: "Search Movie",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: primaryColor,
                    ),
                  ),
                ),
                loading
                    ? SizedBox(
                        height: 127 * 5,
                        child: ListView(
                          children: const [
                            SekeletonTall(),
                            SekeletonTall(),
                            SekeletonTall(),
                            SekeletonTall(),
                            SekeletonTall(),
                          ],
                        ),
                      )
                    : searchMovie.isNotEmpty || controller.text.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: searchMovie.length,
                            itemBuilder: (context, i) {
                              final b = searchMovie[i];
                              return CardMovieVertical(
                                title: b.title,
                                rating: b.rating,
                                categories: b.categories,
                                poster:
                                    "https://www.themoviedb.org/t/p/original${b.poster}",
                              );
                            },
                          )
                        : SizedBox(
                            height:
                                (MediaQuery.of(context).size.height / 3) * 2,
                            child: Center(
                              child: Text(
                                "Search Anything",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SuggestButton(
        onTap: () {},
      ),
    );
  }
}
