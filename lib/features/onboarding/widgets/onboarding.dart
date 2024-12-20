import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAsset;
  final String type;

  const OnboardingWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageAsset,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        type == "svg"
            ? SvgPicture.asset(
                imageAsset,
                height: 180,
              )
            : Image.asset(
                imageAsset,
                height: 150,
                width: 200,
              ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subtitle,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
