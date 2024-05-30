
import 'package:equatable/equatable.dart';

class IncrementState extends Equatable{
  final int counter;
  final bool loading;
  const IncrementState({this.counter=0,this.loading=false});

  IncrementState copyWith({int? counter,bool? loading}){
    return IncrementState(
      counter: counter?? this.counter,
      loading: loading?? this.loading,
    );
  }

  @override
  List<Object?> get props => [counter,loading];
}