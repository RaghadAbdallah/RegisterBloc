import 'package:firebase_auth/firebase_auth.dart';
import 'package:equatable/equatable.dart';



abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends RegisterState {}

class LoginLoading extends RegisterState {}

class LoginSucced extends RegisterState {
  User user;
  LoginSucced({required this.user});
}

class LoginFailed extends RegisterState {
  String message;
  LoginFailed({required this.message});
}