import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/FireBaseUtils/FireBaseUtils.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/providers/authProvider.dart';
import 'package:news_app/screens/auth/auth.dart';
import 'package:news_app/screens/auth/login/customTextField.dart';
import 'package:news_app/screens/auth/login/login.dart';
import 'package:news_app/screens/homeScreen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  static final String routeName = "/SignUpScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController =
      TextEditingController(text: "abdo@gmail.com");

  TextEditingController passwordController =
      TextEditingController(text: "1234567");

  TextEditingController usernameController =
      TextEditingController(text: "abdo");

  TextEditingController confirmPasswordController =
      TextEditingController(text: "1234567");

  AppAuth user = AppAuth();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProviders>(context);
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Center(
                      child: Text(
                        "Create Account",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppTheme.blackDarker, fontSize: 40),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "please enter a username";
                              }
                              return null;
                            },
                            hintText: "username",
                            controller: usernameController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "please enter an email";
                              }
                              final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(emailController.text);
                              if (emailValid == false) {
                                return "email is not valid";
                              }
                              return null;
                            },
                            hintText: "email",
                            controller: emailController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "please enter a password";
                              }
                              if (text.length < 6) {
                                return "password must be more than 6 letters";
                              }
                              return null;
                            },
                            hintText: "password",
                            controller: passwordController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "please fill confirm password";
                              }
                              if (text != passwordController.text) {
                                return "password doesn't match confirm password";
                              }
                              return null;
                            },
                            hintText: "confirm password",
                            controller: confirmPasswordController,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/google.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/facebook.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        signUp();
                        if (authProvider.currrentUser != null) {
                          Navigator.pushReplacementNamed(
                            context,
                            LoginScreen.routeName,
                          );
                        } else {
                          return;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        foregroundColor: AppTheme.whiteColor,
                        backgroundColor: AppTheme.blackDarker,
                      ),
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppTheme.whiteColor),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Already have an account",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp() {
    if (formKey.currentState?.validate() == true) {
      user.signUpWithEmailAndPassword(
        /*  username: usernameController.text, */
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text,
        context: context,
      );
      print("Sign Up success");
    }
  }
}
