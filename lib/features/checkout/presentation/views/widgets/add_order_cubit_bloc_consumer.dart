import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_progress_hub.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../core/widgets/toast_helper.dart';
import '../../manager/add_order_cubit.dart/add_order_cubit.dart';

class AddOrderCubitBlocConsumer extends StatelessWidget {
  const AddOrderCubitBlocConsumer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderFailure) {
          DialogHelper.showErrorDialog(
            context,
            title: 'حدث خطأ',
            desc: state.message,
          );
        } else if (state is AddOrderSuccess) {
          ToastHelper.showSuccessToast('تم اضافة الطلب بنجاح');
        }
      },
      builder: (context, state) {
        return CustomProgressHub(
          isLoading: state is AddOrderLoading,
          child: child,
        );
      },
    );
  }
}
