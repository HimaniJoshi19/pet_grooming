// ignore_for_file: prefer_null_aware_method_calls, avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/themes/text_styles.dart';
import 'package:pet_grooming/presentation/widgets/components/spacings.dart';
import 'package:pet_grooming/utils/utility.dart';

/// TextEditField
class TextEditField extends StatefulWidget {
  /// constructor
  const TextEditField({
    super.key,
    required this.context,
    this.autoFocus = false,
    this.hintText = '',
    required this.controller,
    this.textInputType = TextInputType.text,
    this.text,
    this.enabled = true,
    this.currentFocusNode,
    this.nextFocusNode,
    this.textInputAction = TextInputAction.next,
    this.isObscureText = false,
    this.textInputFormatter,
    this.funOnChanged,
    this.fillColor = Palette.white,
    this.outlineBorderColor = Palette.backgroundColor,
    this.outlineBorderWidth = 0,
    this.hintStyle,
    this.textStyle,
    this.readOnly = false,
    this.maxLength,
    this.onSubmitted,
    this.textLabel,
    this.validator,
    this.suffixTextWidget,
    this.prefixTextWidget,
    this.minLines,
    this.maxLines,
    this.counterText = '',
    this.enabledInputBorder,
    this.borderRadius = Spacings.custom10,
    this.autocorrect = false,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: Spacings.custom14,
      horizontal: Spacings.custom20,
    ),
  });

  final BuildContext context;

  final String? hintText;

  final String? text;

  final bool? enabled;
  final bool autoFocus;

  final bool? isObscureText;

  final TextInputType? textInputType;

  final TextEditingController? controller;

  final TextInputAction? textInputAction;

  final FocusNode? currentFocusNode;

  final FocusNode? nextFocusNode;

  final List<TextInputFormatter>? textInputFormatter;

  final Function(String)? funOnChanged;
  final int? maxLength;

  final Color fillColor;
  final Color outlineBorderColor;
  final double outlineBorderWidth;

  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  final bool readOnly;
  final Function? onSubmitted;
  final String? textLabel;
  final FormFieldValidator<String>? validator;

  final Widget? suffixTextWidget;
  final Widget? prefixTextWidget;

  final int? minLines;
  final int? maxLines;
  final String? counterText;
  final InputBorder? enabledInputBorder;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;
  final bool autocorrect;

  @override
  _TextEditFieldState createState() => _TextEditFieldState();
}

class _TextEditFieldState extends State<TextEditField> {
  @override
  void initState() {
    super.initState();
    if (widget.text != null) {
      widget.controller!.text = widget.text!;
    }
  }

  @override
  void didUpdateWidget(TextEditField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      widget.controller!.text = widget.text!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.textInputFormatter,
      textInputAction: widget.textInputAction,
      cursorColor: Palette.primary,
      obscuringCharacter: '*',
      obscureText: widget.isObscureText!,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      enabled: widget.enabled,
      autofocus: widget.autoFocus,
      readOnly: widget.readOnly,
      focusNode: widget.currentFocusNode,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      onEditingComplete: () {
        Utility.showLog('onTap');
      },
      autocorrect: widget.autocorrect,
      validator: widget.validator,
      onFieldSubmitted: (String value) {
        if (widget.onSubmitted != null) {
          widget.onSubmitted!();
        }
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
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        counterText: widget.counterText,
        labelText: widget.textLabel,
        border: widget.enabledInputBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.outlineBorderColor,
                width: widget.outlineBorderWidth,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
        prefixIcon: widget.prefixTextWidget != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[widget.prefixTextWidget!],
              )
            : null,
        suffixIcon: widget.suffixTextWidget != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  widget.suffixTextWidget!,
                ],
              )
            : null,
        fillColor: widget.fillColor,
        filled: true,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            TextStyles.normal(
              color: Palette.grey,
            ),
        enabledBorder: widget.enabledInputBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.outlineBorderColor,
                width: widget.outlineBorderWidth,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
      ),
      style: widget.textStyle ?? TextStyles.normal(),
      onChanged: (String value) {
        if (widget.funOnChanged != null) {
          widget.funOnChanged!(value);
        }
      },
    );
  }
}
