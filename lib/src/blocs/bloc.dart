import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get email =>
      _emailController.stream.transform(this.validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(this.validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password,
          (e, p)=> true);


  submit(){
    print(_emailController.value + ' ' + _passwordController.value);
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}