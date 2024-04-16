part of 'internet_cubit.dart';

@immutable
sealed class InternetState {}

final class InternetInitial extends InternetState {}

final class ConnectedState extends InternetState {
  final String message;

  ConnectedState({required this.message});
}

final class NotConnectedState extends InternetState {
  final String message;

  NotConnectedState({required this.message});
}
