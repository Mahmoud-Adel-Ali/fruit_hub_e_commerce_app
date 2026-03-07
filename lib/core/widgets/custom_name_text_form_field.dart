import 'package:flutter/material.dart';

import '../helper_functions/validation_of_input_fields.dart';
import '../utils/app_colors.dart';
import 'custom_text_form_field.dart';

class CustomNameTextFormField extends StatefulWidget {
  const CustomNameTextFormField({super.key, this.controller, this.onChanged});
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  State<CustomNameTextFormField> createState() =>
      _CustomNameTextFormFieldState();
}

class _CustomNameTextFormFieldState extends State<CustomNameTextFormField> {
  bool validName = false;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'الإسم',
      keyboardType: TextInputType.text,
      controller: widget.controller,
      validator: (value) => validatorOfUserName(value),
      onChanged: (value) {
        validName = validatorOfUserNameBool(value);
        widget.onChanged?.call(value);
        setState(() {});
      },
      suffixIcon: validName
          ? Icon(Icons.check, size: 24, color: AppColors.primaryColor)
          : null,
      prefixIcon: Icon(
        Icons.person_outline_outlined,
        color: validName ? AppColors.primaryColor : AppColors.grey,
      ),
    );
  }
}
