import 'package:bloc_test_practise/Model/Cart.dart';
import 'package:bloc_test_practise/Model/Order.dart';
import 'package:bloc_test_practise/Model/Product.dart';
import 'package:bloc_test_practise/Model/ProductItem.dart';
import 'package:bloc_test_practise/Model/User.dart';
import 'package:bloc_test_practise/Repositories/APICallRepositories.dart';
import 'package:dio/dio.dart';

class APICallMethod{

  Future<Map<String,dynamic>> getUserAPIData() async{
    Map<String,dynamic> getAllUserDataResponse = {
      "status":false,
      "message":"",
      "data":[],
    };
    try{
      String userAPIUrl = APICallRepositories().baseUrl+APICallRepositories().userEntity;
      print("User API Url : ${userAPIUrl}");
      Response getUserApiResponse = await Dio().get(userAPIUrl);
      if(getUserApiResponse.statusCode==200){
        List getUserData = getUserApiResponse.data;
        getAllUserDataResponse["status"] = true;
        getAllUserDataResponse["message"] = "";
        List<User> getUserList = [];
        for(int i = 0 ; i < getUserData.length ; i++){
          Map<String,dynamic> getUserJson = getUserData[i];
          getUserList.add(User.formJson(userJson: getUserJson));
        }
        getAllUserDataResponse["data"] = getUserList;
      }
      else{
        getAllUserDataResponse["status"] = false;
        getAllUserDataResponse["message"] = getUserApiResponse.data.toString();
        getAllUserDataResponse["data"] = [];
      }
    }
    catch(e){
      getAllUserDataResponse["status"] = false;
      getAllUserDataResponse["message"] = e.toString();
      getAllUserDataResponse["data"] = [];
    }
    return getAllUserDataResponse;
  }

  Future<Map<String,dynamic>> getProductAPIData() async{
    Map<String,dynamic> getAllProductDataResponse = {
      "status":false,
      "message":"",
      "data":[],
    };
    try{
      String productAPIUrl = APICallRepositories().baseUrl+APICallRepositories().productEntity;
      print("Product API Url : ${productAPIUrl}");
      Response getProductApiResponse = await Dio().get(productAPIUrl);
      if(getProductApiResponse.statusCode==200){
        List getProductData = getProductApiResponse.data;
        getAllProductDataResponse["status"] = true;
        getAllProductDataResponse["message"] = "";
        List<Product> getProductList = [];
        for(int i = 0 ; i < getProductData.length ; i++){
          Map<String,dynamic> getProductJson = getProductData[i];
          getProductList.add(Product.fromJson(productJson: getProductJson));
        }
        getAllProductDataResponse["data"] = getProductList;
      }
      else{
        getAllProductDataResponse["status"] = false;
        getAllProductDataResponse["message"] = getProductApiResponse.data.toString();
        getAllProductDataResponse["data"] = [];
      }
    }
    catch(e){
      getAllProductDataResponse["status"] = false;
      getAllProductDataResponse["message"] = e.toString();
      getAllProductDataResponse["data"] = [];
    }
    return getAllProductDataResponse;
  }

  Future<Map<String,dynamic>> getCartAPIData() async{
    Map<String,dynamic> getAllCartDataResponse = {
      "status":false,
      "message":"",
      "data":[],
    };
    try{
      String cartAPIUrl = APICallRepositories().baseUrl+APICallRepositories().cartEntity;
      print("Cart API Url : ${cartAPIUrl}");
      Response getCartApiResponse = await Dio().get(cartAPIUrl);
      if(getCartApiResponse.statusCode==200){
        List getCartData = getCartApiResponse.data;
        getAllCartDataResponse["status"] = true;
        getAllCartDataResponse["message"] = "";
        List<Cart> getCartList = [];
        for(int i = 0 ; i < getCartData.length ; i++){
          Map<String,dynamic> getCartJson = getCartData[i];
          getCartList.add(Cart.fromJson(cartJson: getCartJson));
        }
        getAllCartDataResponse["data"] = getCartList;
      }
      else{
        getAllCartDataResponse["status"] = false;
        getAllCartDataResponse["message"] = getCartApiResponse.data.toString();
        getAllCartDataResponse["data"] = [];
      }
    }
    catch(e){
      getAllCartDataResponse["status"] = false;
      getAllCartDataResponse["message"] = e.toString();
      getAllCartDataResponse["data"] = [];
    }
    return getAllCartDataResponse;
  }

  Future<Map<String,dynamic>> getOrderAPIData() async{
    Map<String,dynamic> getAllOrderDataResponse = {
      "status":false,
      "message":"",
      "data":[],
    };
    try{
      String orderAPIUrl =  APICallRepositories().baseUrl+APICallRepositories().orderEntity;
      print("Order API Url : ${orderAPIUrl}");
      Response getOrderApiResponse = await Dio().get(orderAPIUrl);
      if(getOrderApiResponse.statusCode==200){
        List getOrderData = getOrderApiResponse.data;
        getAllOrderDataResponse["status"] = true;
        getAllOrderDataResponse["message"] = "";
        List<Order> getOrderList = [];
        for(int i = 0 ; i < getOrderData.length ; i++){
          Map<String,dynamic> getOrderJson = getOrderData[i];
          getOrderList.add(Order.fromJson(orderJson: getOrderJson));
        }
        getAllOrderDataResponse["data"] = getOrderList;
      }
      else{
        getAllOrderDataResponse["status"] = false;
        getAllOrderDataResponse["message"] =getOrderApiResponse.data.toString();
        getAllOrderDataResponse["data"] = [];
      }
    }
    catch(e){
      getAllOrderDataResponse["status"] = false;
      getAllOrderDataResponse["message"] = e.toString();
      getAllOrderDataResponse["data"] = [];
    }
    return getAllOrderDataResponse;
  }

  Future<Map<String,dynamic>> getOrderByIdAPIData({required int getOrderId}) async{
    Map<String,dynamic> getAllOrderByIdDataResponse = {
      "status":false,
      "message":"",
      "data":{},
    };
    try{
      String orderByIdUrl = "${APICallRepositories().baseUrl}${APICallRepositories().orderByIdEntity}$getOrderId";
      print("Order By Id : ${orderByIdUrl}");
      Response getOrderByIdApiResponse = await Dio().get(orderByIdUrl);
      if(getOrderByIdApiResponse.statusCode==200){
        List getOrderByIdData = getOrderByIdApiResponse.data;
        getAllOrderByIdDataResponse["status"] = true;
        getAllOrderByIdDataResponse["message"] = "";
        Order? finalOrder;
        for(int i = 0 ; i < getOrderByIdData.length ; i++){
          Map<String,dynamic> getOrderByIdJson = getOrderByIdData[i];
          Order getOrder = Order.fromJson(orderJson: getOrderByIdJson);
          if(getOrder.orderId==getOrderId){
            finalOrder = getOrder;
            break;
          }
        }
        getAllOrderByIdDataResponse["data"] = finalOrder;
      }
      else{
        getAllOrderByIdDataResponse["status"] = false;
        getAllOrderByIdDataResponse["message"] =getOrderByIdApiResponse.data.toString();
        getAllOrderByIdDataResponse["data"] = [];
      }
    }
    catch(e){
      getAllOrderByIdDataResponse["status"] = false;
      getAllOrderByIdDataResponse["message"] = e.toString();
      getAllOrderByIdDataResponse["data"] = [];
    }
    return getAllOrderByIdDataResponse;
  }

  Future<Map<String,dynamic>> updateOrderAPIData({required int getUserId,required List<ProductItem> getProductItemList}) async{
    Map<String,dynamic> updateOrderDataResponse = {
      "status":false,
      "message":"",
      "orderId":0,
    };
    try{
      Response getUpdateOrderApiResponse = await Dio().put(APICallRepositories().baseUrl+APICallRepositories().orderEntity);
      Map<String,dynamic> getUpdateOrderResponse = getUpdateOrderApiResponse.data;
      if(getUpdateOrderApiResponse.statusCode==200){
        updateOrderDataResponse["status"] = true;
        updateOrderDataResponse["message"] = getUpdateOrderResponse["message"];
        updateOrderDataResponse["orderId"] = getUpdateOrderResponse["order_id"];
      }
      else{
        updateOrderDataResponse["status"] = false;
        updateOrderDataResponse["message"] = getUpdateOrderResponse["message"]??getUpdateOrderResponse.toString();
        updateOrderDataResponse["orderId"] = getUpdateOrderResponse["order_id"]??0;
      }
    }
    catch(e){
      updateOrderDataResponse["status"] = false;
      updateOrderDataResponse["message"] = e.toString();
      updateOrderDataResponse["orderId"] = 0;
    }
    return updateOrderDataResponse;
  }

}