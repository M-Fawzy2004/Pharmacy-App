import 'package:flutter/material.dart';
import 'package:pharmacy_app/constant.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({
    super.key,
    required this.imageUrl,
    this.onTap,
    required this.aspectRatio,
  });

  final String imageUrl;
  final void Function()? onTap;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image_not_supported,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
