import 'package:flutter/material.dart';

import 'package:pick_n_go/src/bloc/auth_bloc.dart';
export 'package:pick_n_go/src/bloc/auth_bloc.dart';

// import 'package:crud/src/bloc/products_bloc.dart';
// export 'package:crud/src/bloc/products_bloc.dart';

class BlocProvider extends InheritedWidget {
  final _authBloc = new AuthBloc();
  // final _productsBloc = new ProductsBloc();

  static BlocProvider _instance;

  factory BlocProvider({Key key, Widget child}) {
    if (_instance == null) {
      _instance = new BlocProvider._internal(key: key, child: child);
    }

    return _instance;
  }
  BlocProvider._internal({Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AuthBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<BlocProvider>())
        ._authBloc;
  }

  // static ProductsBloc productsBloc(BuildContext context) {
  //   return (context.dependOnInheritedWidgetOfExactType<BlocProvider>())
  //       ._productsBloc;
  // }
}
