import 'package:flutter/material.dart';
import 'package:moviez/constant.dart';

class SuggestButton extends StatelessWidget {
  const SuggestButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 55),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(37),
          boxShadow: [
            BoxShadow(
              color: secondaryColor.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: const Text(
          "Suggest Movie",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
