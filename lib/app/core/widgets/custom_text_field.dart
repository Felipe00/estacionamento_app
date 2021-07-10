import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?)? validators;
  final TextInputType inputType;
  final int? maxlength;

  const CustomTextField(
      {required this.controller,
      required this.inputType,
      this.validators,
      this.maxlength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validators == null ? null : (value) => validators!(value),
      keyboardType: inputType,
      maxLength: maxlength,
      textAlign: TextAlign.center,
      decoration: _decoration(),
    );
  }

  _decoration() {
    return InputDecoration(
      counterStyle: TextStyle(height: double.minPositive),
      counterText: '',
    );
  }
}
