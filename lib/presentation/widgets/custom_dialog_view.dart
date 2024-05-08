import 'package:flutter/material.dart';
import 'package:pet_grooming/constants/String_constants.dart';
import 'package:pet_grooming/presentation/themes/themes.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';
class CustomDialogView {
  Future<int?> showDialogCustom({
    required BuildContext context,
    required String title,
    required String content,
    bool isSingleButton = false,
    bool barrierDismissible = true,
    bool onWillPop = false,
    String positiveButtonText = StringConstants.labelOk,
    String negativeButtonText = StringConstants.labelCancel,
  }) {
    return showDialog<int>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => PopScope(
        canPop: onWillPop,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Spacings.custom15),
              topLeft: Radius.circular(Spacings.custom15),
              bottomRight: Radius.circular(Spacings.custom15),
              bottomLeft: Radius.circular(Spacings.custom15),
            ),
          ),
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: Spacings.custom10,
                  horizontal: Spacings.custom15,
                ),
                child: TextLabel(
                  text: title,
                  textStyle: TextStyles.normal(
                    fontWeight: FontWeight.bold,
                    color: Palette.primary,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: Spacings.custom10,
                  horizontal: Spacings.custom15,
                ),
                child: TextLabel(
                  text: content,
                  textStyle: TextStyles.normalMedium(
                    color: Palette.colorTextDark,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: Spacings.custom10,
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.all(Spacings.custom10),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(
                      Spacings.custom5,
                    ),
                    bottom: Radius.circular(
                      Spacings.custom5,
                    ),
                  ),
                  color: Palette.primary,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context, 0);
                        },
                        child: Center(
                          child: TextLabel(
                            text: positiveButtonText,
                            textStyle: TextStyles.normalMedium(
                              color: Palette.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (!isSingleButton)
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.white,
                      ),
                    if (!isSingleButton)
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context, 1);
                          },
                          child: Center(
                            child: Text(
                              negativeButtonText,
                              style: TextStyles.normal(
                                color: Palette.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
