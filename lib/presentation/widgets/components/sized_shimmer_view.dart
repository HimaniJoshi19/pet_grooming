import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:shimmer/shimmer.dart';

class SizedShimmerView extends StatelessWidget {
  const SizedShimmerView({
    super.key,
    required this.height,
    required this.width,
    this.radius,
  });
  final double height;
  final double width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Palette.colorShimmerBase,
        highlightColor: Palette.colorShimmerHighLight,
        child: Container(
          decoration: BoxDecoration(
            color: Palette.colorShimmerHighLight,
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 0),
            ),
          ),
          height: height,
          width: width,
        ),
      ),
    );
  }
}

class TextShimmerView extends StatelessWidget {
  const TextShimmerView({
    super.key,
    required this.text,
  });
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Palette.colorShimmerBase,
      highlightColor: Palette.colorShimmerHighLight,
      child: Container(
        child: text,
      ),
    );
  }
}
