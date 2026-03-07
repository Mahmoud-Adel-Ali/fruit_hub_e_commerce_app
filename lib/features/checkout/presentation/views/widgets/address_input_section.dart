import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/custom_email_text_form_field.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/custom_text_form_field.dart';

import '../../../../../core/helper_functions/validation_of_input_fields.dart';
import '../../../../../core/widgets/custom_name_text_form_field.dart';
import '../../../../../core/widgets/custom_phone_text_form_field.dart';
import '../../../../../core/widgets/custom_toggel_widget.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 12,
        children: [
          CustomNameTextFormField(),
          CustomEmailTextFormField(),
          CustomPhoneTextFormField(),
          CustomTextFormField(
            hintText: 'العنوان',
            validator: simpleValidator,
            controller: null,
          ),
          CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            validator: simpleValidator,
            controller: null,
          ),
          CustomToggleWidget(
            title: "حفظ العنوان",
            initialValue: true,
            onChanged: (value) {
              log(value.toString());
            },
          ),
        ],
      ),
    );
  }
}
