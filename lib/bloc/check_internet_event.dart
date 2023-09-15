part of 'check_internet_bloc.dart';

abstract class CheckInternetEvent {}

class ConnectedEvent extends CheckInternetEvent{}

class NotConnectedEvent extends CheckInternetEvent{}
