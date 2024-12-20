import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final bool isDisabled;
  final String text;
  final VoidCallback? onPressed;

  const AppButton(
      {super.key,
      required this.isDisabled,
      required this.text,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: isDisabled
              ? WidgetStateProperty.all(
                  Theme.of(context).colorScheme.primary.withOpacity(0.2))
              : WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDisabled
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.4)
                      : Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ));
  }
}
