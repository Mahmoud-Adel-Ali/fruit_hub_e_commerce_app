import 'package:flutter/material.dart';

import '../helper_functions/validation_of_input_fields.dart';
import '../utils/app_colors.dart';
import 'custom_text_form_field.dart';

class CustomPhoneTextFormField extends StatefulWidget {
  const CustomPhoneTextFormField({
    super.key,
    this.hintText = 'رقم الهاتف',
    this.controller,
    this.onChanged,
  });
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  State<CustomPhoneTextFormField> createState() =>
      _CustomPhoneTextFormFieldState();
}

class _CustomPhoneTextFormFieldState extends State<CustomPhoneTextFormField> {
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'رقم الهاتف',
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      validator: validatorOfEgyptianPhone,
      onChanged: (value) {
        isValid = validatorOfEgyptianPhoneBool(value);
        widget.onChanged?.call(value);
        setState(() {});
      },
      prefixIcon: Icon(
        Icons.phone,
        color: isValid ? AppColors.primaryColor : AppColors.grey,
      ),
      suffixIcon: isValid
          ? Icon(Icons.check, color: AppColors.primaryColor)
          : null,
    );
  }
}
