import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';

class AppCardWidget extends StatelessWidget {
  const AppCardWidget({
    required this.child,
    this.radius = 7,
    this.padding,
    this.color = Palette.white,
    this.shadowColor = Palette.colorTextLight,
    super.key,
  });

  final Widget child;
  final double radius;
  final EdgeInsets? padding;
  final Color color;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(Spacings.medium),
        child: child,
      ),
    );
  }
}
