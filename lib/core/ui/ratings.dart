import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final Color color;
  final double size;

  const StarRating({
    super.key,
    required this.rating,
    this.starCount = 5,
    this.color = Colors.blue,
    this.size = 17.0,
  });

  @override
  Widget build(BuildContext context) {
    // Round off the rating to the nearest half (e.g. 4.3 -> 4.5)
    double roundedRating = (rating * 2).round() / 2;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        if (index < roundedRating.floor()) {
          // Full star
          return Icon(Icons.star, color: color, size: size);
        } else if (index < roundedRating && roundedRating % 1 != 0) {
          // Half star
          return Icon(Icons.star_half, color: color, size: size);
        } else {
          // Empty star
          return Icon(Icons.star_border, color: color, size: size);
        }
      }),
    );
  }
}
