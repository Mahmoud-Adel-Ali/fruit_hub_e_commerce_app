import 'package:bloc/bloc.dart';

import '../../../../../core/repos/orders_repo/orders_repo.dart';
import '../../../domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit({required this.repo}) : super(AddOrderInitial());

  final OrdersRepo repo;

  Future<void> addOrder({required OrderInputEntity order}) async {
    emit(AddOrderLoading());
    final result = await repo.addOrder(order: order);
    result.fold(
      (error) => emit(AddOrderFailure(message: error.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
