import 'package:bloc_test_practise/bloc/increment_bloc.dart';
import 'package:bloc_test_practise/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class wrapper extends StatefulWidget{
  const wrapper({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WrapperState();
  }

}

class _WrapperState extends State<wrapper>{

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> IncrementBloc(),
      child: const MyHomePage(title: "Store"),
    );
  }

}