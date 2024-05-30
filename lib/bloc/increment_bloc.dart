import 'package:bloc/bloc.dart';
import 'package:bloc_test_practise/bloc/increment_event.dart';
import 'package:bloc_test_practise/bloc/increment_state.dart';

class IncrementBloc extends Bloc<IncrementEvent,IncrementState>{
  IncrementBloc(): super(const IncrementState()){
    on<AddEvent>((event,emit) => _mapAddLogic(event,emit));
    on<SubtractEvent>((event,emit) => _mapSubtractLogic(event,emit));
  }

  void _mapAddLogic(AddEvent event,Emitter<IncrementState> emit){
    final updateData = state.counter+1;
    print(updateData);
    try{
      emit(state.copyWith(counter: updateData));
    }
    catch(e){
      print(e);
    }
  }

  void _mapSubtractLogic(SubtractEvent event,Emitter<IncrementState> emit){
    final updateData = state.counter-1;
    print(updateData);
    emit(state.copyWith(counter: updateData));
  }
}