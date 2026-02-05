import '../entity/order_summary_entity.dart';

class CalculateOrderSummaryUseCase{
 static const double taxRate = 0.14;
 static const double deliveryFee = 25.0;

 call(double orderPrice){
 final tax = orderPrice * taxRate;
    final total = orderPrice + tax + deliveryFee;
    return OrderSummaryEntity(
      orderPrice: orderPrice,
       tax: tax, 
       deliveryFee: deliveryFee, 
       total: total);
}


}
  

 