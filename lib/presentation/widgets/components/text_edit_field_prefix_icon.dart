import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/themes/text_styles.dart';
import 'package:pet_grooming/presentation/widgets/components/spacings.dart';

/// TextEditField
class TextEditFieldPrefixIcon extends StatefulWidget {
  /// constructor
  const TextEditFieldPrefixIcon({
    super.key,
    required this.context,
    this.hintText = '',
    required this.controller,
    this.textInputType,
    this.text,
    this.enabled = true,
    this.currentFocusNode,
    this.nextFocusNode,
    this.textInputAction = TextInputAction.next,
    this.isObscureText = false,
    this.textInputFormatter,
    this.funOnChanged,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.autoFocus = false,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.validator,
    this.hintStyle,
    this.textLabel,
    this.fillColor = Palette.white,
    this.outlineBorderColor = Palette.colorBlack,
    this.outlineBorderWidth = 0,
    this.contentPadding,
  });

  final BuildContext context;

  final String? hintText;

  final String? text;

  final bool? enabled;

  final bool? isObscureText;

  final TextInputType? textInputType;

  final TextEditingController? controller;

  final TextInputAction? textInputAction;

  final FocusNode? currentFocusNode;

  final FocusNode? nextFocusNode;

  final List<TextInputFormatter>? textInputFormatter;

  final Function(String)? funOnChanged;

  final Widget? prefixIcon;

  final TextInputType keyboardType;
  final bool readOnly;
  final bool autoFocus;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  final String? textLabel;
  final Color fillColor;
  final Color outlineBorderColor;
  final double outlineBorderWidth;
  final TextStyle? hintStyle;
  final EdgeInsets? contentPadding;

  final FormFieldValidator<String>? validator;

  @override
  TextEditFieldPrefixIconState createState() =>
      TextEditFieldPrefixIconState();
}

class TextEditFieldPrefixIconState extends State<TextEditFieldPrefixIcon> {
  @override
  void initState() {
    super.initState();
    if (widget.text != null) {
      widget.controller!.text = widget.text!;
    }
  }

  @override
  void didUpdateWidget(TextEditFieldPrefixIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      widget.controller!.text = widget.text!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus,
      inputFormatters: widget.textInputFormatter,
      textInputAction: widget.textInputAction,
      cursorColor: Palette.primary,
      obscureText: widget.isObscureText!,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      enabled: widget.enabled,
      focusNode: widget.currentFocusNode,
      readOnly: widget.readOnly,
      validator: widget.validator,
      onFieldSubmitted: (String value) {
        if (widget.currentFocusNode != null) {
          if (widget.nextFocusNode != null) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          } else {
            FocusScope.of(context).requestFocus(FocusNode());
          }
        } else {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon ?? const Offstage(),
        contentPadding: widget.contentPadding,
        labelText: widget.textLabel,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.outlineBorderColor,
            width: widget.outlineBorderWidth,
          ),
          borderRadius: BorderRadius.circular(Spacings.custom5),
        ),
        counterText: '',
        fillColor: widget.fillColor,
        filled: true,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            TextStyles.normal(
              color: Palette.grey,
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Palette.backgroundColor,
          ),
          borderRadius: BorderRadius.circular(Spacings.custom5),
        ),
      ),
      style: const TextStyle(
        color: Palette.colorBlack,
      ),
      onChanged: (String value) {
        if (widget.funOnChanged != null) {
          widget.funOnChanged!(value)!;
        }
      },
    );
  }
}
