import 'package:flutter/material.dart';

import 'package:pick_n_go/src/services/auth_service.dart';

class HomePage extends StatelessWidget {
  HomePage({@required this.auth});
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton(
            disabledTextColor: Colors.white60,
            textColor: Colors.white,
            onPressed: _signOut,
            child: Text(
              'Logout',
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Text('Homa Page'),
        ),
      ),
    );
  }
}
