import 'package:flutter/material.dart';

class FadeInWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FadeInWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 700),
  });

  @override
  FadeInWidgetState createState() => FadeInWidgetState();
}

class FadeInWidgetState extends State<FadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Define a curved animation that will stay at 0 opacity for the first half
    // and gradually increase in opacity during the second half.
    _animation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0,
          curve: Curves.easeIn), // Starts at 50% of the duration
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward(); // Start the animation
    });
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
