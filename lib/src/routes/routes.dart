import 'package:flutter/material.dart';

import 'package:pick_n_go/src/pages/home_page.dart';
import 'package:pick_n_go/src/pages/landing_page.dart';
import 'package:pick_n_go/src/pages/signin/signin_page.dart';
import 'package:pick_n_go/src/pages/signin/signup_page.dart';
import 'package:pick_n_go/src/pages/signin/welcome_page.dart';
import 'package:pick_n_go/src/services/auth_service.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'landing': (BuildContext context) => LandingPage(auth: Auth()),
    // 'home': (BuildContext context) => HomePage(),
    // 'welcome': (BuildContext context) => WelcomePage(),
    'signIn': (BuildContext context) => SignInPage(),
    'signUp': (BuildContext context) => SignUpPage(),
  };
}
