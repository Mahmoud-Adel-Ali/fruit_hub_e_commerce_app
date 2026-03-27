import 'package:flutter/material.dart';

enum OrderStatus { pending, accepted, delivered, cancelled }

extension OrderStatusEx on OrderStatus {
  /// 🔹 UI Label
  String get label {
    switch (this) {
      case OrderStatus.pending:
        return "قيد الانتظار";
      case OrderStatus.accepted:
        return "تم القبول";
      case OrderStatus.delivered:
        return "تم التوصيل";
      case OrderStatus.cancelled:
        return "تم الإلغاء";
    }
  }

  /// 🔹 API إرسال
  String toJson() {
    return name; // Dart >= 2.15 gives enum name directly
  }

  /// 🔹 API استقبال
  static OrderStatus fromJson(String value) {
    // switch (value) {...}
    return OrderStatus.values.firstWhere(
      (status) => status.name == value,
      orElse: () => OrderStatus.pending, // fallback safety
    );
  }

  /// 🔹 UI Color
  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.accepted:
        return Colors.blue;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
    }
  }
}
