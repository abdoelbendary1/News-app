import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MyUser {
  String id;
  String username;
  String email;
  String password;
  MyUser({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });
  static const String collectionName = "Users";

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory MyUser.fromJson(Map<String, dynamic> json) {
    return MyUser(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}
