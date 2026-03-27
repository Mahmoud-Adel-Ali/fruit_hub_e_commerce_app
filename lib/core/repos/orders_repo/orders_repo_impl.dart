import 'package:dartz/dartz.dart';

import '../../../features/checkout/data/models/order_model.dart';
import '../../../features/checkout/domain/entities/order_entity.dart';
import '../../../features/orders/data/models/order_output_model.dart';
import '../../../features/orders/domain/entities/order_output_entity.dart';
import '../../errors/failures.dart';
import '../../services/database_service.dart';
import '../../utils/end_points.dart';
import 'orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService service;

  OrdersRepoImpl({required this.service});

  @override
  Future<Either<Failure, void>> addOrder({
    required OrderInputEntity order,
  }) async {
    try {
      var model = OrderInputModel.fromEntity(order);
      await service.addData(
        path: EndPoints.addOrders,
        documentId: model.orderId,
        data: model.toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<OrderOutputEntity>>> fetchOrders() async* {
    try {
      // (data as List<Map<String, dynamic>>)
      await for (List data in service.streamData(path: EndPoints.getOrders)) {
        var orders = data
            .map((e) => OrderOutputModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure('failed to fetch orders!.'));
    }
  }
}
