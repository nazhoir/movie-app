import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../constant.dart';

class CardMovieHorizontal extends StatelessWidget {
  const CardMovieHorizontal(
      {super.key,
      required this.title,
      required this.rating,
      required this.poster,
      required this.categories});
  final String title;
  final int rating;
  final String poster;
  final String categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(21),
              child: CachedNetworkImage(
                height: 200,
                fit: BoxFit.cover,
                imageUrl: poster,
                placeholder: (context, url) => Shimmer(
                  child: Container(
                    height: 200,
                    width: 300,
                    color: secondaryColor,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 200,
                  width: 300,
                  color: secondaryColor,
                  child: const Center(
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 79,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 175,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        categories,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: secondaryColor, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                RatingBar.readOnly(
                  size: 18,
                  filledColor: aksenColor,
                  emptyColor: const Color(0xffE1E1EA),
                  filledIcon: Icons.star,
                  emptyIcon: Icons.star,
                  initialRating: rating.toDouble(),
                  maxRating: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardMovieVertical extends StatelessWidget {
  const CardMovieVertical({
    super.key,
    required this.title,
    required this.rating,
    required this.categories,
    required this.poster,
  });

  final String title;
  final int rating;
  final String poster;
  final String categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 127,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(21),
              child: CachedNetworkImage(
                width: 100,
                fit: BoxFit.cover,
                imageUrl: poster,
                placeholder: (context, url) => Shimmer(
                  child: Container(
                    height: 127,
                    width: 100,
                    color: secondaryColor,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 127,
                  width: 100,
                  color: secondaryColor,
                  child: const Center(
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                categories,
                style: TextStyle(color: secondaryColor, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              RatingBar.readOnly(
                size: 18,
                filledColor: aksenColor,
                emptyColor: const Color(0xffE1E1EA),
                filledIcon: Icons.star,
                emptyIcon: Icons.star,
                initialRating: rating.toDouble(),
                maxRating: 5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
