import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:shimmer/shimmer.dart';

class GetShimmerContainer extends StatelessWidget {
  const GetShimmerContainer({
    super.key,
    this.color = Colors.grey,
    this.height = 20,
    this.width = 25,
  });
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Palette.colorShimmerHighLight,
      baseColor: Palette.colorShimmerBase,
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
