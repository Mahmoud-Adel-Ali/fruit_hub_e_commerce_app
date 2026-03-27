part of 'fetch_orders_cubit.dart';

@immutable
abstract class FetchOrdersState {}

class FetchOrdersInitial extends FetchOrdersState {}

class FetchOrdersLoading extends FetchOrdersState {}

class FetchOrdersSuccess extends FetchOrdersState {
  final List<OrderOutputEntity> orders;

  FetchOrdersSuccess({required this.orders});
}

class FetchOrdersFailure extends FetchOrdersState {
  final String message;

  FetchOrdersFailure({required this.message});
}
