import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pc_build_assistant/arguments/login_screen_arguments.dart';
import 'package:pc_build_assistant/components/rounded_button_widget.dart';
import 'package:pc_build_assistant/util/constants.dart';
import 'package:pc_build_assistant/util/decoration.dart';
import 'package:pc_build_assistant/views/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "/registrationScreenId";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Controllers For The TextFields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();

  // Temporary Holders For The TextFields' Changes
  String _email = "";
  String _password = "";
  String _passwordCheck = "";

  // Controls The Circular Loading
  bool _busy = false;
  String _message = "";

  @override
  void initState() {
    setState(() {
      _message = "Sign Up With Email and Password";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: TyperAnimatedTextKit(
        isRepeatingAnimation: false,
        duration: Duration(milliseconds: 600),
        text: ["Registering"],
        textStyle: loadingAnimationStyle,
      ),
      color: kLoginButtonColor,
      inAsyncCall: _busy,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Register",
            style: TextStyle(fontFamily: "Rodin"),
          ),
          centerTitle: true,
          iconTheme: ThemeData.dark().iconTheme.copyWith(color: Colors.black),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _message,
                    style: TextStyle(color: kRegisterButtonColor),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: kRegisterTextFieldDecoration.copyWith(
                      hintText: "Your Email"),
                  onChanged: (email) {
                    _email = email;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: kRegisterTextFieldDecoration.copyWith(
                      hintText: "Your Password"),
                  onChanged: (password) {
                    _password = password;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _passwordCheckController,
                  obscureText: true,
                  decoration: kRegisterTextFieldDecoration.copyWith(
                      hintText: "Re-type Password"),
                  onChanged: (passwordCheck) {
                    _passwordCheck = passwordCheck;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Hero(
                  tag: 'registerButton',
                  child: RoundedButton(
                    title: 'Register',
                    onPressed: () async {
                      setState(() {
                        _busy = true;
                      });
                      if (_password != _passwordCheck) {
                        setState(() {
                          _busy = false;
                          _message = "Your passwords don't match";
                        });
                      } else {
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: _email, password: _password);
                          if (newUser != null) {
                            FirebaseUser user = await _auth.currentUser();
                            user.sendEmailVerification();
                            _auth.signOut();
                            setState(() {
                              _busy = false;
                            });
                            Navigator.popAndPushNamed(
                              context,
                              LoginScreen.id,
                              arguments: LoginScreenArguments(
                                  "Please Verify Your Email, Then Log In"),
                            );
                          }
                        } catch (excp) {
                          print(excp.toString());
                          setState(() {
                            _busy = false;
                            if (excp is PlatformException) {
                              if (excp.code == kInvalidEmail) {
                                _message = "Email is not valid";
                              } else if (excp.code == kEmailAlreadyExists) {
                                _message = "Email already in use";
                              } else if (excp.code == kPasswordTooShort) {
                                _message =
                                    "Password must be atleast 6 characters";
                              } else {
                                _message = "Something went wrong";
                              }
                            }
                          });
                        }
                      }
                      _emailController.clear();
                      _passwordController.clear();
                      _passwordCheckController.clear();
                    },
                    color: kRegisterButtonColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
