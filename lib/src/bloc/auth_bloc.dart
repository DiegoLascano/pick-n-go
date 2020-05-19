import 'dart:async';

import 'package:pick_n_go/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc with Validators {
  // Stream controllers changed to BehaviorSubject in order to use rxdart combine2
  final _nameController = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Fetch data from stream
  Stream<String> get nameStream =>
      _nameController.stream.transform(validateName);
  Stream<String> get lastNameStream =>
      _lastNameController.stream.transform(validateLastName);
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);

  // Combine streams
  Stream<bool> get loginValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);
  Stream<bool> get registerValidStream => Rx.combineLatest4(nameStream,
      lastNameStream, emailStream, passwordStream, (n, l, e, p) => true);

  // Insert values to the stream
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeLastName => _lastNameController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Get last value of the streams
  String get name => _nameController.value;
  String get lastName => _lastNameController.value;
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _nameController?.close();
    _lastNameController?.close();
    _emailController?.close();
    _passwordController?.close();
  }
}
