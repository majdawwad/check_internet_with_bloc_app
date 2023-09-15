import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_internet_event.dart';
part 'check_internet_state.dart';

class CheckInternetBloc extends Bloc<CheckInternetEvent, CheckInternetState> {
  StreamSubscription? _connectivitySubscription;
  CheckInternetBloc() : super(CheckInternetInitial()) {
    on<CheckInternetEvent>((event, emit) {
      if (event is ConnectedEvent) {
        emit(ConnectedState(message: "Connected"));
      } else if (event is NotConnectedEvent) {
        emit(NotConnectedState(message: "Not Connected"));
      }
    });

    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          add(ConnectedEvent());
        } else {
          add(NotConnectedEvent());
        }
      },
    );
  }
  @override
  Future<void> close() {
    _connectivitySubscription!.cancel();
    return super.close();
  }
}
