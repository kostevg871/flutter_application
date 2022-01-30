import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final int customerId;
  final List<int> productIds;
  final double deliveryFee;
  final double subtotal;
  final double total;
  final bool isAccepted;
  final bool isDelivered;
  final bool isCanceled;
  final DateTime createdAt;

  const Order(
      {required this.id,
      required this.customerId,
      required this.productIds,
      required this.deliveryFee,
      required this.subtotal,
      required this.total,
      required this.isAccepted,
      required this.isDelivered,
      required this.isCanceled,
      required this.createdAt});

  Order copyWith({
    int? id,
    int? customerId,
    List<int>? productIds,
    double? deliveryFee,
    double? subtotal,
    double? total,
    bool? isAccepted,
    bool? isDelivered,
    bool? isCanceled,
    DateTime? createdAt,
  }) {
    return Order(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      productIds: productIds ?? this.productIds,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      isAccepted: isAccepted ?? this.isAccepted,
      isDelivered: isDelivered ?? this.isDelivered,
      isCanceled: isCanceled ?? this.isCanceled,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "customerId": customerId,
      "productIds": productIds,
      "deliveryFee": deliveryFee,
      "subtotal": subtotal,
      "total": total,
      "isAccepted": isAccepted,
      "isDelivered": isDelivered,
      "isCanceled": isCanceled,
      "createdAt": createdAt.millisecondsSinceEpoch,
    };
  }

  factory Order.fromSnapshot(DocumentSnapshot snapshot) {
    return Order(
      id: snapshot['id'],
      customerId: snapshot['customerId'],
      productIds: List<int>.from(snapshot['productIds']),
      deliveryFee: snapshot['deliveryFee'],
      subtotal: snapshot['subtotal'],
      total: snapshot['total'],
      isAccepted: snapshot['isAccepted'],
      isCanceled: snapshot["isCanceled"],
      isDelivered: snapshot['isDelivered'],
      createdAt: snapshot['createdAt'].toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      customerId,
      productIds,
      deliveryFee,
      subtotal,
      total,
      isAccepted,
      isCanceled,
      isDelivered,
      createdAt,
    ];
  }

  static List<Order> orders = [
    Order(
        id: 1,
        customerId: 23,
        productIds: const [1, 2, 3],
        deliveryFee: 10,
        subtotal: 30,
        total: 30,
        isAccepted: false,
        isDelivered: false,
        isCanceled: false,
        createdAt: DateTime.now()),
    Order(
        id: 2,
        customerId: 23,
        productIds: const [3, 4, 5],
        deliveryFee: 10,
        subtotal: 30,
        total: 30,
        isAccepted: false,
        isDelivered: false,
        isCanceled: false,
        createdAt: DateTime.now()),
  ];
}
