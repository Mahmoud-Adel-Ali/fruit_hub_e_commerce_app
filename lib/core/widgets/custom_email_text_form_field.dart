import 'package:flutter/material.dart';

import '../helper_functions/validation_of_input_fields.dart';
import '../utils/app_colors.dart';
import 'custom_text_form_field.dart';

class CustomEmailTextFormField extends StatefulWidget {
  const CustomEmailTextFormField({super.key, this.controller, this.onChanged});
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  State<CustomEmailTextFormField> createState() =>
      _CustomEmailTextFormFieldState();
}

class _CustomEmailTextFormFieldState extends State<CustomEmailTextFormField> {
  bool validEmail = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'البريد الألكتروني',
      keyboardType: TextInputType.emailAddress,
      validator: (value) => validatorOfEmail(value),
      controller: widget.controller,
      prefixIcon: Icon(
        Icons.email_outlined,
        color: validEmail ? AppColors.primaryColor : AppColors.grey,
      ),
      suffixIcon: validEmail
          ? Icon(Icons.check, size: 24, color: AppColors.primaryColor)
          : null,
      onChanged: (value) {
        validEmail = validatorOfEmailBool(value);
        widget.onChanged?.call(value);
        setState(() {});
      },
    );
  }
}
