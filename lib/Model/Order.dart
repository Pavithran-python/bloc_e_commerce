import 'package:bloc_test_practise/Model/ProductItem.dart';

class Order{
  int? orderId;
  int? userId;
  List<ProductItem>? productItem;

  Order({
    required this.orderId,
    required this.userId,
    required this.productItem
  });

  Order.fromJson({required Map<String,dynamic> orderJson}){
    orderId = orderJson["order_id"];
    userId = orderJson["user_id"];
    productItem = orderJson["items"];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> orderJson = {};
    orderJson["order_id"] = orderId;
    orderJson["user_id"] = userId;
    orderJson["items"] = productItem;
    return orderJson;
  }

}