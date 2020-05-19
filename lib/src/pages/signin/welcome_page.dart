import 'package:flutter/material.dart';

import 'package:pick_n_go/src/services/auth_service.dart';
import 'package:pick_n_go/src/widgets/signin/signin_button.dart';
import 'package:pick_n_go/src/widgets/signin/social_signin_button.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({@required this.auth});
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAninomously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _createLoginButton(context),
              _createCardSwiper(),
              _createRegisterButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createLoginButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          'Ingresar',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        onPressed: () => Navigator.pushNamed(context, 'signIn'),
      ),
    );
  }

  Widget _createCardSwiper() {
    return SizedBox(
      height: 400.0,
    );
  }

  Widget _createRegisterButtons(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          width: double.infinity,
          child: SignInButton(
            text: 'Registrar Nueva Cuenta',
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            disabledColor: Theme.of(context).primaryColorLight,
            onPressed: () => Navigator.pushNamed(context, 'signUp'),
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          width: double.infinity,
          child: SocialSignInButton(
            text: 'Continuar con Facebook',
            color: Colors.grey[350],
            imagePath: 'assets/logos/facebook-logo.png',
            disabledColor: Theme.of(context).disabledColor,
            onPressed: () {},
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          width: double.infinity,
          child: SocialSignInButton(
            text: 'Continuar con Google',
            color: Colors.grey[350],
            imagePath: 'assets/logos/google-logo.png',
            disabledColor: Theme.of(context).disabledColor,
            onPressed: _signInWithGoogle,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          width: double.infinity,
          child: SignInButton(
            text: 'Anonimamente',
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            disabledColor: Theme.of(context).primaryColorLight,
            onPressed: _signInAnonymously,
          ),
        ),
      ],
    );
  }
}
