import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviez/constant.dart';
import 'package:moviez/controller/home_controller.dart';
import 'package:moviez/model/movie_model.dart';
import 'package:moviez/search.dart';
import 'package:moviez/widget/card_movie.dart';
import 'package:moviez/widget/skeleton.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Moviez",
              style: TextStyle(
                  fontSize: 28,
                  color: primaryColor,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              "Watch much easier",
              style: TextStyle(fontSize: 16, color: secondaryColor),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
              color: primaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<Movie>>(
                future: controller.popularMovie(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SkeletonWide(),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("Data Tidak Ditemukan"),
                    );
                  }
                  return CarouselSlider.builder(
                    itemCount: 2,
                    itemBuilder:
                        (BuildContext context, index, int pageViewIndex) {
                      Movie movie = snapshot.data![index];

                      return CardMovieHorizontal(
                        title: movie.title,
                        rating: movie.rating,
                        poster: "${controller.mainImageURL}${movie.wallpaper}",
                        categories: movie.categories,
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: false,
                      viewportFraction: 0.9,
                      padEnds: false,
                      enableInfiniteScroll: false,
                      height: 279,
                      initialPage: 0,
                    ),
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  "From Disney",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
              FutureBuilder<List<Movie>>(
                future: controller.disneyMovie(),
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
                    itemCount: 2,
                    itemBuilder: (BuildContext context, index) {
                      Movie movie = snapshot.data![index];

                      return CardMovieVertical(
                        title: movie.title,
                        rating: movie.rating,
                        categories: movie.categories,
                        poster: "${controller.mainImageURL}${movie.poster}",
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
