/// This widget/page has no UI. It only evaluates if the user is signed in or not,
/// and based on that, redirects to the corresponding page, Home or SignIn

import 'package:flutter/material.dart';

import 'package:pick_n_go/src/pages/home_page.dart';
import 'package:pick_n_go/src/pages/signin/welcome_page.dart';
import 'package:pick_n_go/src/services/auth_service.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return WelcomePage(
              auth: auth,
            );
          } else {
            return HomePage(
              auth: auth,
            );
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
