import 'package:flutter/services.dart';

class CustomTextFormatter extends TextInputFormatter {
  CustomTextFormatter({this.regularExpression = r'^[A-Za-z ]+$'});

  final String regularExpression;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final RegExp regEx = RegExp(regularExpression);
    final String newString = regEx.stringMatch(newValue.text) ?? '';
    return TextEditingValue(
      text: newString == newValue.text ? newValue.text : oldValue.text,
      selection:
          newString == newValue.text ? newValue.selection : oldValue.selection,
    );
  }
}
