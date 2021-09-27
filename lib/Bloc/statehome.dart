import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BlocState extends Equatable{
  const BlocState();



  @override
  List<Object> get props => [];
}

class BlocInitial extends BlocState{}
class AuthenticateState extends BlocState{
  User user;
  AuthenticateState({required this.user});

}
class UnAuthenticateState extends BlocState{}