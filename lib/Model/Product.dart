import 'package:bloc_test_practise/Model/Review.dart';

class Product{
  int? productId;
  String? productName;
  String? productDescription;
  double? productPrice;
  String? productUnit;
  String? productImageUrl;
  int? productDiscount;
  bool? productAvailability;
  String? productBrand;
  String? productCategory;
  double? productRating;
  List<Review>? productReviews;

  Product({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productUnit,
    required this.productImageUrl,
    required this.productDiscount,
    required this.productAvailability,
    required this.productBrand,
    required this.productCategory,
    required this.productRating,
    required this.productReviews
  });

  Product.fromJson({required Map<String,dynamic> productJson}){
    productId = productJson["product_id"];
    productName = productJson["name"];
    productDescription = productJson["description"];
    productPrice = productJson["price"];
    productUnit = productJson["unit"];
    productImageUrl = productJson["image"];
    productDiscount = productJson["discount"];
    productAvailability = productJson["availability"];
    productBrand = productJson["brand"];
    productCategory = productJson["category"];
    productRating = productJson["rating"];
    productReviews = productJson["reviews"];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> productJson = {};
    productJson["product_id"] = productId;
    productJson["name"] = productName;
    productJson["description"] = productDescription;
    productJson["price"] = productPrice;
    productJson["unit"] = productUnit;
    productJson["image"] = productImageUrl;
    productJson["discount"] = productDiscount;
    productJson["availability"] = productAvailability;
    productJson["brand"] = productBrand;
    productJson["category"] = productCategory;
    productJson["rating"] = productRating;
    productJson["reviews"] = productReviews;
    return productJson;
  }

}