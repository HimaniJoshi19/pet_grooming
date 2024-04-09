import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/text_styles.dart';
import 'package:pet_grooming/presentation/widgets/components/text_label.dart';

/// RadioListTileWidget
class CheckBoxListTileWidget<T> extends StatelessWidget {
  /// Constructor
  const CheckBoxListTileWidget({
    super.key,
    this.title,
    required this.value,
    this.groupValue,
    this.onChanged,
    this.colorSelected,
    this.colorUnSelected,
    this.titleTextStyle,
  });

  /// Label
  final String? title;

  /// Value = Own value
  final T value;

  /// Group Value = Selected value
  final T? groupValue;

  /// onChanged
  final ValueChanged<T>? onChanged;

  /// colorSelected
  @required
  final Color? colorSelected;

  /// colorUnSelected
  @required
  final Color? colorUnSelected;

  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onChanged!(value),
        child: Center(
          child: Row(
            children: <Widget>[
              if (value == groupValue)
                Icon(
                  Icons.check_box_outlined,
                  color: colorSelected,
                )
              else
                Icon(
                  Icons.check_box_outline_blank_outlined,
                  color: colorUnSelected,
                ),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextLabel(
                  text: title,
                  textStyle: titleTextStyle ?? TextStyles.titleMedium(),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
