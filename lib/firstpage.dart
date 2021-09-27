import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'SignUpPage.dart';
import 'loginBloc/loginEvent.dart';
import 'loginBloc/loginState.dart';
import 'loginBloc/loginbloc.dart';
import 'loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class RegisterPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register Page',
      home: RegisterHome(),
      theme: ThemeData.dark(),
    );
  }
}

class RegisterHome extends StatefulWidget {


  @override
  _RegisterHomeState createState() => _RegisterHomeState();
}

class _RegisterHomeState extends State<RegisterHome> {
  final _formKey = GlobalKey<FormState>();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  bool _obscureText = true;
  final _auth = FirebaseAuth.instance;
  late RegisterBloc registerBloc;
  @override
  Widget build(BuildContext context) {
    registerBloc=BlocProvider.of<RegisterBloc>(context);
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.white24,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            registerBloc.add(SignUpPressed(email: emailEditingController.text,password: passwordEditingController.text));
           // signIn(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
     // backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            //color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    BlocListener<RegisterBloc,RegisterState>(
                      listener:(context, state){
                        if(state is LoginSucced){
                              Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) =>EditPage()));
                        }
                      },


                    child: BlocBuilder<RegisterBloc,RegisterState>(
                      builder: (context, state){
                        if(state is LoginLoading){return Center(child: CircularProgressIndicator());
                        }
                        else if(state is LoginFailed){
                          return buildError(state.message);
                        }
                        else if( state is LoginSucced){
                          emailEditingController.text='';
                          passwordEditingController.text='';
                          return Container();
                        }
                        return Container();
                      },
                    ),),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SingUpHome()));
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.white24,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildError(String message){
    return Text(message);
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => EditPage())),
      })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
