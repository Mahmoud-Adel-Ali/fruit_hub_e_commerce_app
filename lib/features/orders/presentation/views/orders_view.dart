import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helper_functions/dummy_order.dart';
import '../../../../core/repos/orders_repo/orders_repo.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../manager/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, showNotifications: false, title: 'طلباتي'),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<FetchOrdersCubit>(
            create: (context) =>
                FetchOrdersCubit(repo: getit.get<OrdersRepo>()),
          ),
        ],
        child: OrdersViewBodyBlocConsumer(),
      ),
    );
  }
}

class OrdersViewBodyBlocConsumer extends StatefulWidget {
  const OrdersViewBodyBlocConsumer({super.key});

  @override
  State<OrdersViewBodyBlocConsumer> createState() =>
      _OrdersViewBodyBlocConsumerState();
}

class _OrdersViewBodyBlocConsumerState
    extends State<OrdersViewBodyBlocConsumer> {
  @override
  void initState() {
    super.initState();
    context.read<FetchOrdersCubit>().fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchOrdersCubit, FetchOrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody(orders: state.orders);
        } else if (state is FetchOrdersFailure) {
          return Center(child: Text(state.message));
        } else {
          return Skeletonizer(
            child: OrdersViewBody(
              orders: List.generate(3, (index) => DummyOrder.getOrder()),
            ),
          );
        }
      },
    );
  }
}
