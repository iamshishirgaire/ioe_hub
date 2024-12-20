import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppErrorWidget extends StatelessWidget {
  final Widget? child;
  final String? message;
  const AppErrorWidget({super.key, this.child, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 170,
          ),
          child ??
              SvgPicture.asset(
                "assets/icons/empty.svg",
                height: 250,
              ),
          //

          const SizedBox(
            height: 10,
          ),
          Text(
            message ?? "Opps! Something went wrong.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
