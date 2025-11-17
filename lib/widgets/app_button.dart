import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enabled;
  final double height;
  final double? width;
  final Color? color;
  final double? radius;
  final Widget? child;

  const AppButton({
    super.key,
    this.title,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.height = 48,
    this.width,
    this.color,
    this.radius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? Theme.of(context).primaryColor;

    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: (enabled && !isLoading) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled ? buttonColor : Colors.grey.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : (child ??
                  Text(
                    title ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
      ),
    );
  }
}
