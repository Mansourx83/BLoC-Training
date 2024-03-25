part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterIncrement extends CounterEvent {}

class CounterDecrement extends CounterEvent {}

class CounterReset extends CounterEvent {}
