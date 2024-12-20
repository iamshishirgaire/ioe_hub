import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String url;
  final double? height;
  const AppCachedNetworkImage({super.key, required this.url, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      height: height ?? 70,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.surfaceBright,
              highlightColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainer
                        .withOpacity(0.6)),
              )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

Widget appCacheNetworkImageProvider(
  BuildContext contex, {
  required String url,
  double? height,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    fit: BoxFit.cover,
    height: height ?? 70,
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.surfaceBright,
            highlightColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surfaceContainer
                      .withOpacity(0.6)),
            )),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
