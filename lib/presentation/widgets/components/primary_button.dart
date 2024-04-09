import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/themes/text_styles.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.enabledColor,
    this.onTap,
    this.label,
    this.disabledColor = Palette.colorTextLight,
    this.padding = Spacings.medium,
    this.leading,
    this.trailing,
    this.textStyles,
    this.borderRadius = Spacings.custom5,
  });

  final Color? enabledColor;
  final Color? disabledColor;
  final VoidCallback? onTap;
  final String? label;
  final double? padding;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? textStyles;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.all(padding!),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.disabled)
                    ? disabledColor!
                    : enabledColor ?? Palette.primary,
          ),
          overlayColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) => Colors.white.withOpacity(0.4),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: enabledColor ?? Palette.primary),
            ),
          ),
        ),
        onPressed: () => onTap!(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            leading ?? const Offstage(),
            Text(
              label!,
              style: textStyles ?? TextStyles.button(color: Palette.white),
            ),
            trailing ?? const Offstage(),
          ],
        ),
      ),
    );
  }
}

class PrimaryButtonRound extends StatelessWidget {
  const PrimaryButtonRound({
    super.key,
    this.enabledColor,
    this.onTap,
    this.label,
    this.disabledColor = Palette.colorTextLight,
    this.padding = Spacings.small,
    this.leading,
    this.trailing,
    this.textStyles,
  });

  final Color? enabledColor;
  final Color? disabledColor;
  final VoidCallback? onTap;
  final String? label;
  final double? padding;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? textStyles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.all(padding!),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.disabled)
                    ? disabledColor!
                    : enabledColor ?? Palette.primary,
          ),
          overlayColor: MaterialStateColor.resolveWith(
            (Set<MaterialState> states) => Colors.white.withOpacity(0.4),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(color: enabledColor ?? Palette.primary),
            ),
          ),
        ),
        onPressed: () => onTap!(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            leading ?? const Offstage(),
            Text(
              label!,
              style: textStyles ?? TextStyles.button(color: Palette.white),
            ),
            trailing ?? const Offstage(),
          ],
        ),
      ),
    );
  }
}
