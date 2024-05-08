import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/themes/text_styles.dart';

/// TextEditField
class TextEditFieldSuffixIcon extends StatefulWidget {
  /// constructor
  const TextEditFieldSuffixIcon({
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
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.readOnly = false,
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

  final Widget? suffixIcon;

  final TextInputType keyboardType;
  final int? maxLength;
  final bool readOnly;

  @override
  TextEditFieldSuffixIconState createState() =>
      TextEditFieldSuffixIconState();
}

class TextEditFieldSuffixIconState extends State<TextEditFieldSuffixIcon> {
  @override
  void initState() {
    super.initState();
    if (widget.text != null && widget.text!.isNotEmpty) {
      widget.controller!.text = widget.text!;
    }
  }

  @override
  void didUpdateWidget(TextEditFieldSuffixIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      widget.controller!.text = widget.text!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: widget.maxLength,
      inputFormatters: widget.textInputFormatter,
      textInputAction: widget.textInputAction,
      cursorColor: Palette.primary,
      obscureText: widget.isObscureText!,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      focusNode: widget.currentFocusNode,
      onSubmitted: (String value) {
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
        counterText: '',
        fillColor: Palette.white,
        filled: true,
        suffixIcon: widget.suffixIcon ?? const Offstage(),
        hintText: widget.hintText,
        hintStyle: TextStyles.normalMedium(
          color: Palette.grey,
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      onChanged: (String value) {
        if (widget.funOnChanged != null) {
          try {
            widget.funOnChanged!(value)!;
          } catch (_) {}
        }
      },
    );
  }
}
