import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/themes/text_styles.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';

/// RadioListTileWidget
class RadioListTileWidget<T> extends StatelessWidget {
  /// Constructor
  const RadioListTileWidget({
    super.key,
    this.title,
    this.value,
    this.groupValue,
    this.onChanged,
    this.colorSelected,
    this.colorUnSelected,
    this.selectedWidget = const Icon(
      size: Spacings.custom14,
      Icons.radio_button_checked_sharp,
      color: Palette.grey,
    ),
    this.deSelectedWidget = const Icon(
      Icons.radio_button_off,
      size: Spacings.custom14,
      color: Palette.colorShimmerHighLight,
    ),
  });

  /// Label
  final String? title;

  /// Value = Own value
  final T? value;

  /// Group Value = Selected value
  final T? groupValue;

  /// onChanged
  final ValueChanged<T>? onChanged;

  /// colorSelected
  final Color? colorSelected;

  /// colorUnSelected
  final Color? colorUnSelected;

  final Widget selectedWidget;
  final Widget deSelectedWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // ignore: null_check_on_nullable_type_parameter
      onTap: () => onChanged!(value!),
      child: Center(
        child: Row(
          children: <Widget>[
            if (value == groupValue) selectedWidget else deSelectedWidget,
            const SizedBox(width: 8.0),
            Text(title ?? '', style: TextStyles.titleMedium())
          ],
        ),
      ),
    );
  }
}
