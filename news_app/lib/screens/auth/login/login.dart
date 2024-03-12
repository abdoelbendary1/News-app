import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/FireBaseUtils/FireBaseUtils.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/providers/authProvider.dart';
import 'package:news_app/screens/auth/auth.dart';
import 'package:news_app/screens/auth/login/customTextField.dart';
import 'package:news_app/screens/auth/signUp/signUp.dart';
import 'package:news_app/screens/homeScreen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static final String routeName = "/LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var user = AppAuth();

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
                    Text(
                      "Welcome  back",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppTheme.blackDarker, fontSize: 40),
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
                                return "please enter email";
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
                              return null;
                            },
                            hintText: "password",
                            controller: passwordController,
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
                        login();
                        if (authProvider.currrentUser != null) {
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.routeName);
                        } else {
                          return;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                        foregroundColor: AppTheme.whiteColor,
                        backgroundColor: AppTheme.blackDarker,
                      ),
                      child: Text(
                        "login",
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
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        child: Text(
                          "Create account",
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

  void login() async {
    if (formKey.currentState?.validate() == true) {
      var currentuUser = user.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
        context: context,
      );
      print("login  success");
    }
  }
}
