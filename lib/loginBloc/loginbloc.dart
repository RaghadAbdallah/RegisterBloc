import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:weather/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'loginEvent.dart';
import 'loginState.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository userRepository;

  RegisterBloc({required this.userRepository}) : super(LoginInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is SignUpPressed) {
      yield LoginLoading();

      try {
        var user = await userRepository.signUp(event.email, event.password);
        yield LoginSucced(user: user!);
      } catch (e) {
        yield LoginFailed(message: e.toString());
      }
    }
  }
}
