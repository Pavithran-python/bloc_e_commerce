
import 'package:equatable/equatable.dart';

abstract class IncrementEvent extends Equatable{
  @override
  List<Object?> get props =>[];
}

class AddEvent extends IncrementEvent{
  @override
  List<Object?> get props =>[];
}

class SubtractEvent extends IncrementEvent{
  @override
  List<Object?> get props =>[];
}