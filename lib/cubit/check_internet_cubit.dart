import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_internet_state.dart';

class CheckInternetCubit extends Cubit<CheckInternetState> {
  StreamSubscription? _connectivitySubscription;
  CheckInternetCubit() : super(CheckInternetInitial());

  void getConnected() {
    emit(ConnectedState(message: "Connected"));
  }

  void getNotConnected() {
    emit(NotConnectedState(message: "Not Connected"));
  }

  void checkSubscriptionConnectivity() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          getConnected();
        } else {
          getNotConnected();
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
