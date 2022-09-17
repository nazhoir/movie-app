import 'package:flutter/material.dart';
import 'package:moviez/constant.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SkeletonWide extends StatelessWidget {
  const SkeletonWide({super.key});

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
          Shimmer(
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(21),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Shimmer(
            child: Container(
              height: 20,
              width: 300,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(21),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Shimmer(
            child: Container(
              height: 20,
              width: 300,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(21),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SekeletonTall extends StatelessWidget {
  const SekeletonTall({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 127,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Shimmer(
                child: Container(
                  height: 127,
                  width: 100,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(21),
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
                  Shimmer(
                    child: Container(
                      height: 20,
                      width: 90,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Shimmer(
                    child: Container(
                      height: 20,
                      width: 70,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Shimmer(
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          height: 127,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Shimmer(
                child: Container(
                  height: 127,
                  width: 100,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(21),
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
                  Shimmer(
                    child: Container(
                      height: 20,
                      width: 90,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Shimmer(
                    child: Container(
                      height: 20,
                      width: 70,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Shimmer(
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          height: 127,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Shimmer(
                child: Container(
                  height: 127,
                  width: 100,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(21),
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
                  Shimmer(
                    child: Container(
                      height: 20,
                      width: 90,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Shimmer(
                    child: Container(
                      height: 20,
                      width: 70,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Shimmer(
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
