import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? _subscription;

  InternetCubit() : super(InternetInitial());
  void connected() {
    emit(ConnectedState(message: 'Connected'));
  }

  void notConnected() {
    emit(NotConnectedState(message: 'Not Connected'));
  }

  void checkConnection() {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile)) {
        connected();
      } else {
        notConnected();
      }
    });
    Future<void> close() {
      _subscription?.cancel();
      return super.close();
    }
  }
}
