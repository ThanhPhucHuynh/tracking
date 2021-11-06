import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState extends Equatable {
  AuthenticationState();
  @override
  List<Object> get props => [];
  // List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  AuthenticationInitial(bool orderSuccess) : super();
}

class AuthenticationSuccess extends AuthenticationState {
  final User firebaseUser;

  AuthenticationSuccess(this.firebaseUser) : super();

  @override
  List<Object> get props => [];
}

class AuthenticationFailure extends AuthenticationState {
  AuthenticationFailure() : super();
  // @override
  // List<Object> get props => [orderSuccess];
}
