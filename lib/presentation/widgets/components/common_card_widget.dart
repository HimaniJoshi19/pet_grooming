import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';

class CommonCardWidget extends StatelessWidget {
  const CommonCardWidget({
    super.key,
    required this.child,
    this.bgColor = Palette.white,
    this.radius = 10.0,
    this.elevation = 1.0,
    this.margin = EdgeInsets.zero,
    this.borderSide = BorderSide.none,
    this.clipBehavior = Clip.antiAlias,
  });

  final Widget child;
  final Color bgColor;
  final double radius;
  final double elevation;
  final EdgeInsetsGeometry margin;
  final BorderSide borderSide;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: bgColor,
      margin: margin,
      clipBehavior: clipBehavior,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        side: borderSide,
      ),
      child: child,
    );
  }
}
