import 'dart:async';

class Validators{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (String email, EventSink<String> sink){
      email.contains('@') ? sink.add(email) : sink.addError('Enter a valid email');
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (String password, EventSink<String> sink){
      password.length > 3 ? sink.add(password) : sink.addError('Password must be at least 4 characters');
    }
  );
}
