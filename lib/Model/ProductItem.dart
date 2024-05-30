
class ProductItem{
  int? productId;
  int? quantity;

  ProductItem({
    required this.productId,
    required this.quantity,
  });

  ProductItem.fromJson({required Map<String,dynamic> productItemJson}){
    productId = productItemJson["product_id"];
    quantity = productItemJson["quantity"];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> productItemJson = {};
    productItemJson["product_id"] = productId;
    productItemJson["quantity"] = quantity;
    return productItemJson;
  }

}