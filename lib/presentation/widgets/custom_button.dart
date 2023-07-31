import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final Function() onPressed;
  final Widget child;

  const CustomButton({
    super.key,
    this.isLoading = false,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              child,
              if (isLoading)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.background,
                      strokeWidth: 3,
                    ),
                  ),
                ),
            ],
          ),
        ),
        onTap: () => onPressed(),
      ),
    );
  }
}
