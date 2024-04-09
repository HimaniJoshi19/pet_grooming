import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/widgets/components/spacings.dart';

class CommonSpacings {
  static Widget commonSpacingHeight({double space = Spacings.custom15}) {
    return SizedBox(
      height: space,
    );
  }

  static Widget commonSpacingWidth({double space = Spacings.custom10}) {
    return SizedBox(
      width: space,
    );
  }
}
