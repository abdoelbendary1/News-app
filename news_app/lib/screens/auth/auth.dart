// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/FireBaseUtils/FireBaseUtils.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/providers/authProvider.dart';
import 'package:provider/provider.dart';

class AppAuth {
  FirebaseAuth _db = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
    required BuildContext context,
  }) async {
    try {
      UserCredential credential = await _db.createUserWithEmailAndPassword(
          email: email, password: password);
      var myUser = MyUser(
          id: credential.user?.uid ?? "",
          username: username,
          email: email,
          password: password);
      var authProvider = Provider.of<AuthProviders>(context, listen: false);
      authProvider.updateUser(myUser);

      await FireBaseUtils.addUserToFireStore(myUser);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print("Exception : $e");
    }
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential credential = await _db.signInWithEmailAndPassword(
          email: email, password: password);

      var user =
          await FireBaseUtils.readUserFormFireStore(credential.user?.uid ?? "");
      var authProvider = Provider.of<AuthProviders>(context, listen: false);
      authProvider.updateUser(user!);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'invalid-email') {
        print('No user found for that email.');
      } else if (e.code == 'invalid-credential') {
        print('wrong password.');
      } else if (e.code == 'too-many-requests') {
        print("too-many-requests");
      }
    } catch (e) {
      print("exception:$e");
    }
  }
}
