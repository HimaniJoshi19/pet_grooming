import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.borderColor,
    this.backgroundColor,
    this.padding,
    this.radius,
    this.borderWidth,
    this.alignment,
  });
  final Widget child;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double? borderWidth;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double? radius;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? Spacings.small),
        ),
        border: Border.all(
          color: borderColor ?? Palette.backgroundColor,
          width: borderWidth ?? 1,
        ),
      ),
      padding: padding,
      child: child,
    );
  }
}
