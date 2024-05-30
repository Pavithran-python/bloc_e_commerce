import 'package:bloc_test_practise/Model/ProductItem.dart';

class Cart{
  int? cartId;
  int? userId;
  List<ProductItem>? cartItem;

  Cart({
    required this.cartId,
    required this.userId,
    required this.cartItem
  });

  Cart.fromJson({required Map<String,dynamic> cartJson}){
    cartId = cartJson["cart_id"];
    userId = cartJson["user_id"];
    cartItem = getProductItemList(getProductItemJson:cartJson["items"]);
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> cartJson = {};
    cartJson["cart_id"] = cartId;
    cartJson["user_id"] = userId;
    cartJson["items"] = cartItem;
    return cartJson;
  }

  List<ProductItem> getProductItemList({required List getProductItemJson}){
    List<ProductItem> convertProductItem = [];
    for(int i = 0 ; i < getProductItemJson.length ; i++){
      Map<String,dynamic> getProductItemMap = getProductItemJson[i];
      convertProductItem.add(ProductItem.fromJson(productItemJson: getProductItemMap));
    }
    return convertProductItem;
  }

}