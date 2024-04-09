import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';

class DropDownButtonWidget extends StatefulWidget {
  const DropDownButtonWidget({
    required this.listItems,
    this.selectedValue,
    required this.onChange,
    this.isExpanded = false,
    this.hint,
    this.style,
    this.prefixIcon,
    this.backgroundColor,
    this.icon = Icons.keyboard_arrow_down,
    super.key,
  });
  final DropDownModel? selectedValue;
  final List<DropDownModel> listItems;
  final Function(DropDownModel) onChange;
  final bool isExpanded;
  final Widget? hint;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final IconData icon;

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  DropDownModel? selectedValue;
  List<DropDownModel> listItems = <DropDownModel>[];

  @override
  void initState() {
    super.initState();
    listItems = widget.listItems;
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(Spacings.custom5),
        ),
        border: Border.all(color: Palette.backgroundColor),
        color: widget.backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Spacings.small,
        vertical: Spacings.custom5,
      ),
      child: Row(
        children: <Widget>[
          if (widget.prefixIcon != null)
            Expanded(
              child: widget.prefixIcon!,
            ),
          if (widget.prefixIcon != null)
            const SizedBox(
              width: Spacings.small,
            ),
          Expanded(
            flex: 9,
            child: DropdownButton<DropDownModel>(
              value: selectedValue,
              isExpanded: widget.isExpanded,
              hint: widget.hint,
              style: widget.style,
              underline: const SizedBox(),
              icon: Icon(widget.icon),
              items: listItems.map((DropDownModel model) {
                return DropdownMenuItem<DropDownModel>(
                  value: model,
                  child: Text(model.value),
                );
              }).toList(),
              onChanged: (DropDownModel? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
                widget.onChange(selectedValue!);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DropDownModel extends Equatable {
  const DropDownModel({required this.id, required this.value});

  final String id;
  final String value;

  @override
  List<Object?> get props => <Object>[id, value];
}
