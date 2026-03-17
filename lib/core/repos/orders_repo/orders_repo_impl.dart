import 'package:dartz/dartz.dart';

import '../../../features/checkout/data/models/order_model.dart';
import '../../../features/checkout/domain/entities/order_entity.dart';
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
      await service.addData(
        path: EndPoints.addOrders,
        data: OrderModel.fromEntity(order).toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
