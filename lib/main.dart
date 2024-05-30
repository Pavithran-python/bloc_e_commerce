import 'dart:async';

import 'package:bloc_test_practise/Model/Cart.dart';
import 'package:bloc_test_practise/Model/Order.dart';
import 'package:bloc_test_practise/Model/Product.dart';
import 'package:bloc_test_practise/Model/User.dart';
import 'package:bloc_test_practise/Repositories/APICallMethod.dart';
import 'package:bloc_test_practise/bloc/increment_bloc.dart';
import 'package:bloc_test_practise/bloc/increment_event.dart';
import 'package:bloc_test_practise/bloc/increment_state.dart';
import 'package:bloc_test_practise/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: wrapper(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  callUserAPI() async {
    print("Call User API");
    Map<String,dynamic> getUserData = await APICallMethod().getUserAPIData();
    if(getUserData["status"]){
      print("Success");
      List<User> getUserList = getUserData["data"];
      for(int i = 0 ; i < getUserList.length ; i++){
        print("User(${i+1}) : ${getUserList[i].userName}");
      }
    }
    else{
      print("Failure");
      print(getUserData["message"]);
    }
  }

  callProductAPI() async {
    print("Call Product API");
    Map<String,dynamic> getProductData = await APICallMethod().getProductAPIData();
    if(getProductData["status"]){
      print("Success");
      List<Product> getProductList = getProductData["data"];
      for(int i = 0 ; i < getProductList.length ; i++){
        print("Product(${i+1}) : ${getProductList[i]}");
      }
    }
    else{
      print("Failure");
      print(getProductData["message"]);
    }
  }

  callCartAPI() async {
    print("Call Cart API");
    Map<String,dynamic> getCartData = await APICallMethod().getCartAPIData();
    if(getCartData["status"]){
      print("Success");
      List<Cart> getCartList = getCartData["data"];
      for(int i = 0 ; i < getCartList.length ; i++){
        print("Cart(${i+1}) : ${getCartList[i]}");
      }
    }
    else{
      print("Failure");
      print(getCartData["message"]);
    }
  }

  callOrderAPI() async {
    print("Call Order API");
    Map<String,dynamic> getOrderData = await APICallMethod().getOrderAPIData();
    if(getOrderData["status"]){
      print("Success");
      List<Order> getOrderList = getOrderData["data"];
      for(int i = 0 ; i < getOrderList.length ; i++){
        print("Order(${i+1}) : ${getOrderList[i]}");
      }
    }
    else{
      print("Failure");
      print(getOrderData["message"]);
    }
  }

  callOrderByIdAPI() async {
    print("Call Order By Id API");
    Map<String,dynamic> getOrderByIdData = await APICallMethod().getOrderByIdAPIData(getOrderId: 1);
    if(getOrderByIdData["status"]){
      print("Success");
      Order getOrderByIdList = getOrderByIdData["data"];
      print("Order : ${getOrderByIdList}");
    }
    else{
      print("Failure");
      print(getOrderByIdData["message"]);
    }
  }

  /*callUpdateOrderAPI() async {
    print("Call Update Order API");
    var getOrderData = [{ "product_id": 1, "quantity": 2 }, { "product_id": 3, "quantity": 1 }];
    Map<String,dynamic> getOrderByIdData = await APICallMethod().updateOrderAPIData(getUserId: 1, getProductItemList: getOrderData);
    if(getOrderByIdData["status"]){
      print("Success");
      Order getOrderByIdList = getOrderByIdData["data"];
      print("Order : ${getOrderByIdList}");
    }
    else{
      print("Failure");
      print(getOrderByIdData["message"]);
    }
  }*/

  _incrementCounter() async {
    print("click");
    //BlocProvider.of<IncrementBloc>(context).add(AddEvent());
    await callUserAPI();
    await callProductAPI();
    await callCartAPI();
    await callOrderAPI();
    await callOrderByIdAPI();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: BlocBuilder<IncrementBloc,IncrementState>(
        builder:(conetxt,state){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${state.counter}',
                ),
              ],
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
