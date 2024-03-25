import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int value = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is CounterIncrement) {
        value++;
        emit(CounterCanged(counterValue: value));
      } else if (event is CounterDecrement) {
        value--;
        emit(CounterCanged(counterValue: value));
      } else if (event is CounterReset) {
        value = 0;
        emit(CounterCanged(counterValue: value));
      }
    });
  }
}
