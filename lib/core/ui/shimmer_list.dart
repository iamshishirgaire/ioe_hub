import 'package:flutter/material.dart';
import 'package:ioe_hub/core/ui/shimmer_tile.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return const ShimmerTile(
          child: ListTile(
        title: Text(""),
        subtitle: Text(""),
      ));
    });
  }
}
