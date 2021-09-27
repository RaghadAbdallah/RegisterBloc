
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignInButtonPressed extends SignUpEvent {
  String email, password;
  SignInButtonPressed({required this.email, required this.password});
}