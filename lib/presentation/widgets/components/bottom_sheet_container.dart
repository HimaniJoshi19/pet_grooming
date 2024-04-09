import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/widgets/components/spacings.dart';

class BottomSheetContainer {
  static double borderRadius = 40.0;

  static void showBottomSheet({
    required Widget? widget,
    required BuildContext context,
    String? title,
  }) {
    showModalBottomSheet(
      /*shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius)),
        ),*/
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Spacings.medium,
                horizontal: Spacings.large,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  /*const SizedBox(
                      height: Spacings.large,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextLabel(
                            text: title,
                            textStyle: TextStyles.title(),
                          ),
                          const Icon(Icons.cancel),
                        ],
                      ),
                    ),*/
                  widget!
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
