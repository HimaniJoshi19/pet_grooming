import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/themes/text_styles.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.enabledColor,
    this.onTap,
    this.label,
    this.disabledColor = Palette.colorTextLight,
    this.padding = Spacings.medium,
    this.leading,
    this.trailing,
    this.textStyles,
  });

  final Color? enabledColor;
  final Color? disabledColor;
  final VoidCallback? onTap;
  final String? label;
  final double padding;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? textStyles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(
              color: Palette.primary,
            ),
          ),
        ),
        onPressed: () => onTap!(),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              leading ?? const Offstage(),
              Text(
                label!,
                style: textStyles ?? TextStyles.button(color: Palette.primary),
              ),
              trailing ?? const Offstage(),
            ],
          ),
        ),
      ),
    );
  }
}
