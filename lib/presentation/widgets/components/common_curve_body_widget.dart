import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';

class CommonCurveBodyWidget extends StatelessWidget {
  const CommonCurveBodyWidget({
    super.key,
    this.headerWidget,
    required this.bodyWidget,
  });
  final Widget? headerWidget;
  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Palette.primary,
      child: Column(
        children: <Widget>[
          if (headerWidget != null) headerWidget!,
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Palette.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Spacings.custom10),
                  topRight: Radius.circular(Spacings.custom10),
                ),
              ),
              child: bodyWidget,
            ),
          ),
        ],
      ),
    );
  }
}
