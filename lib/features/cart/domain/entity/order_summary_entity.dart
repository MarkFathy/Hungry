class OrderSummaryEntity {
  final double orderPrice;
  final double tax;
  final double deliveryFee;
  final double total;

  OrderSummaryEntity({
    required this.orderPrice,
    required this.tax,
    required this.deliveryFee,
    required this.total,
  });
}
