part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterCanged extends CounterState {
  final int counterValue;

  CounterCanged({required this.counterValue});
}
