import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/providers/authProvider.dart';
import 'package:news_app/screens/auth/login/login.dart';
import 'package:news_app/tabs/user/customButton.dart';
import 'package:provider/provider.dart';

class UserTab extends StatelessWidget {
  UserTab({super.key});
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var authProvider = Provider.of<AuthProviders>(context, listen: false);
    return Container(
      color: AppTheme.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Profile",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                ),
                Spacer(
                  flex: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authProvider.currrentUser?.username ?? "",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      authProvider.currrentUser?.email ?? "",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Spacer(
                  flex: 8,
                ),
              ],
            ),
            Spacer(
              flex: 10,
            ),
            CustomButton(
                width: double.infinity,
                hieght: screenHeight * 0.1,
                buttonText: "Edit Profile",
                icon: Icons.arrow_forward_ios_sharp),
            Spacer(
              flex: 2,
            ),
            CustomButton(
                width: double.infinity,
                hieght: screenHeight * 0.1,
                buttonText: "Terms & Conditions",
                icon: Icons.arrow_forward_ios_sharp),
            Spacer(
              flex: 2,
            ),
            CustomButton(
                width: double.infinity,
                hieght: screenHeight * 0.1,
                buttonText: "change password",
                icon: Icons.arrow_forward_ios_sharp),
            Spacer(
              flex: 2,
            ),
            CustomButton(
                onTap: () {
                  authProvider.currrentUser = null;
                  signOut();
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                },
                width: double.infinity,
                hieght: screenHeight * 0.1,
                buttonText: "Signout",
                icon: Icons.exit_to_app),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
