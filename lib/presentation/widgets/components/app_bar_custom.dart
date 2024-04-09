import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/font_constants.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/themes/text_styles.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    super.key,
    required this.title,
    this.onBackPress,
    this.isShowBackButton = false,
    this.actions,
    this.titleMaxLine = 1,
    this.prefixIcon,
  });

  final String title;
  final bool isShowBackButton;
  final VoidCallback? onBackPress;
  final List<Widget>? actions;
  final int titleMaxLine;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Palette.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 12,
            color: Color.fromRGBO(0, 0, 0, 0.16),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SafeArea(child: Container()),
          Expanded(
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const SizedBox(
                      width: Spacings.small,
                    ),
                    if (prefixIcon != null) prefixIcon!,
                    if (isShowBackButton)
                      IconButton(
                        onPressed: onBackPress,
                        icon: const Icon(
                          Icons.arrow_back,
                          size: Spacings.custom25,
                          color: Palette.colorBlack,
                        ),
                      )
                    else
                      const SizedBox(
                        width: Spacings.small,
                      ),
                    const SizedBox(
                      width: Spacings.small,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    if (actions != null) ...actions!
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: TextLabel(
                    text: title,
                    textStyle: TextStyles.titleMedium(
                      fontWeight: FontConstants.bold,
                    ),
                    maxLines: titleMaxLine,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
