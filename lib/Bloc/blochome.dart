import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'eventhome.dart';
import 'statehome.dart';
import 'package:weather/repositories.dart';

class AuthBloc extends Bloc <BlocEvent,BlocState>{
  UserRepository userRepository;

  AuthBloc({required this.userRepository}): super (BlocInitial());

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async*{
    if(event is AppLoaded){
      try{
     var isSignedIn = await userRepository.isSignedIn();
     if(isSignedIn){
      var user = await  userRepository.getCurrentUser();
      yield AuthenticateState( user: user!);
     }
     else{UnAuthenticateState();}
      } catch(e){
        yield UnAuthenticateState();
      }
    }
    throw UnimplementedError();
  }


}