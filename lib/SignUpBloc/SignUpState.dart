import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSucced extends SignUpState {
  User user;
  SignUpSucced({required this.user});
}

class SignUpFailed extends SignUpState {
  String message;
  SignUpFailed({required this.message});
}