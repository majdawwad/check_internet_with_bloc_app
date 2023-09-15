// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'check_internet_bloc.dart';

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
