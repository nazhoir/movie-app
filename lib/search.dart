import 'package:flutter/material.dart';
import 'package:moviez/constant.dart';
import 'package:moviez/model/movie_model.dart';
import 'package:moviez/widget/button.dart';
import 'package:provider/provider.dart';

import 'controller/search_controller.dart';

import 'widget/card_movie.dart';
import 'widget/skeleton.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SearchController>(context, listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.searchController,
                onChanged: controller.onSearch,
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
              controller.searchLength == 0
                  ? SizedBox(
                      height: (MediaQuery.of(context).size.height / 3) * 2,
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
                    )
                  : Container(
                      margin: const EdgeInsets.only(top: 35, bottom: 20),
                      child: RichText(
                        text: TextSpan(
                          text: 'Search Result',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' (${controller.searchResult})',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
              if (controller.searchLength != 0)
                FutureBuilder<List<Movie>>(
                  future: controller.getAllMovie(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: SekeletonTall(),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text("Data Tidak Ditemukan"),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, index) {
                        Movie movie = snapshot.data![index];

                        return CardMovieVertical(
                            title: movie.title,
                            rating: movie.rating,
                            categories: movie.categories,
                            poster:
                                "${controller.mainImageURL}${movie.poster}");
                      },
                    );
                  },
                ),
            ],
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
