import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/custom_email_text_form_field.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/custom_text_form_field.dart';

import '../../../../../core/helper_functions/validation_of_input_fields.dart';
import '../../../../../core/widgets/custom_name_text_form_field.dart';
import '../../../../../core/widgets/custom_phone_text_form_field.dart';
import '../../../../../core/widgets/custom_toggel_widget.dart';
import '../../../domain/entities/order_entity.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    var order = context.read<OrderEntity>();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          spacing: 12,
          children: [
            CustomNameTextFormField(
              controller: TextEditingController(
                text: order.shippingAddress.name,
              ),
              onChanged: (value) {
                order.shippingAddress.name = value;
              },
            ),
            CustomEmailTextFormField(
              controller: TextEditingController(
                text: order.shippingAddress.email,
              ),
              onChanged: (value) {
                order.shippingAddress.email = value;
              },
            ),
            CustomPhoneTextFormField(
              controller: TextEditingController(
                text: order.shippingAddress.phone,
              ),
              onChanged: (value) {
                order.shippingAddress.phone = value;
              },
            ),
            CustomTextFormField(
              hintText: 'العنوان',
              validator: simpleValidator,
              controller: TextEditingController(
                text: order.shippingAddress.address,
              ),
              onChanged: (value) {
                order.shippingAddress.address = value;
              },
            ),
            CustomTextFormField(
              hintText: 'رقم الطابق , رقم الشقه ..',
              validator: simpleValidator,
              controller: TextEditingController(
                text: order.shippingAddress.addressDetails,
              ),
              onChanged: (value) {
                order.shippingAddress.addressDetails = value;
              },
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
      ),
    );
  }
}
