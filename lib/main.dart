import 'dart:async';
//import 'dart:math';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blochome.dart';
import 'package:weather/SignUpBloc/SignUpbloc.dart';
import 'package:weather/loginBloc/loginbloc.dart';
import 'package:weather/ui/SplashScreen.dart';
import 'Bloc/blochome.dart';
import 'Bloc/statehome.dart';
import 'ui/homeScreen.dart';
import 'repositories.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserRepository userRepository =UserRepository(firebaseAuth: FirebaseAuth.instance);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(userRepository: userRepository),),
        BlocProvider(
          create: (context) => RegisterBloc(userRepository: userRepository),),
        BlocProvider(
          create: (context) => SignUpBloc(userRepository: userRepository),)

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Splash Screen',
        home:SplashScreen() ,
        //theme: ThemeData.dark(),
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc,BlocState>(builder: (context,state){
      if(state is UnAuthenticateState){
        return SplashScreen();
      } else if(state is AuthenticateState){
        return HomeScreen();
      }
      return Container();
    });
  }
}



