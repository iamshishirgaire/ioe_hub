import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTile extends StatelessWidget {
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final Widget child;

  const ShimmerTile(
      {super.key, this.decoration, this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.surfaceBright,
        highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Container(
          height: 90,
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context)
                  .colorScheme
                  .surfaceContainer
                  .withOpacity(0.6)),
        ));
  }
}
