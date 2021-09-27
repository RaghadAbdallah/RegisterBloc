import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable{
  const RegisterEvent();

  @override
  List<Object> get props =>[];

}

class SignUpPressed extends RegisterEvent{
  late String email, password;
  SignUpPressed({ required this.email,  required this.password});
}