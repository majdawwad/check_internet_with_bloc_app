part of 'check_internet_cubit.dart';

abstract class CheckInternetState {}

final class CheckInternetInitial extends CheckInternetState {}

class ConnectedState extends CheckInternetState {
  final String message;
  ConnectedState({
    required this.message,
  });
}

class NotConnectedState extends CheckInternetState {
  final String message;
  NotConnectedState({
    required this.message,
  });
}
