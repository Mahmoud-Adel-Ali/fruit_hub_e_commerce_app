import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/repos/orders_repo/orders_repo.dart';
import '../../../domain/entities/order_output_entity.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit({required this.repo}) : super(FetchOrdersInitial());
  final OrdersRepo repo;
  StreamSubscription? _subscription;

  void fetchOrders() {
    emit(FetchOrdersLoading());

    _subscription = repo.fetchOrders().listen((result) {
      result.fold(
        (failure) => emit(FetchOrdersFailure(message: failure.message)),
        (orders) => emit(FetchOrdersSuccess(orders: orders)),
      );
    });

    // await for (var result in repo.fetchOrders()) {
    //   result.fold(
    //     (failure) => emit(FetchOrdersFailure(message: failure.message)),
    //     (orders) => emit(FetchOrdersSuccess(orders: orders)),
    //   );
    // }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
