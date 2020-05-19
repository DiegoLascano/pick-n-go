import 'package:flutter/material.dart';

import 'package:pick_n_go/src/bloc/bloc_provider.dart';
import 'package:pick_n_go/src/widgets/signin/signin_button.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _createForm(context, bloc),
          SafeArea(
            child: _createNavigation(context),
          ),
        ],
      ),
    );
  }

  Widget _createNavigation(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, 'welcome');
          },
        ),
      ),
    );
  }

  Widget _createHeader(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Ingresa a tu',
            style: TextStyle(
                fontSize: 40.0,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'cuenta',
            style: TextStyle(
                fontSize: 40.0,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _createForm(BuildContext context, AuthBloc bloc) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(30.0, 80.0, 30.0, 0.0),
          child: Column(
            children: <Widget>[
              _createHeader(context),
              SizedBox(height: 40.0),
              _createEmailInput(bloc),
              SizedBox(height: 20.0),
              _createPassInput(bloc),
              SizedBox(height: 40.0),
              _createSubmit(context, bloc),
              SizedBox(height: 60.0),
              _createRegisterButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createEmailInput(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          // padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              // icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
              hintText: 'ejemplo@correo.com',
              labelText: 'Email',
              // counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            // onChanged: (value) => bloc.changeEmail(value),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _createPassInput(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          // padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              fillColor: Colors.red,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              // icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
              labelText: 'Contraseña',
              // counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _createSubmit(BuildContext context, AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.loginValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          // margin: EdgeInsets.symmetric(horizontal: 40.0),
          width: double.infinity,
          child: SignInButton(
            text: 'Ingresar',
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            disabledColor: Theme.of(context).primaryColorLight,
            onPressed: snapshot.hasData ? () => _submit(context, bloc) : null,
          ),
        );
      },
    );
  }

  void _submit(BuildContext context, AuthBloc bloc) async {
    return null;
  }

  Widget _createRegisterButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Aún no tienes cuenta?'),
        FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Text(
            'Registrate aquí',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onPressed: () => Navigator.pushNamed(context, 'register'),
        ),
      ],
    );
  }
}
