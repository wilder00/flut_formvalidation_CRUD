import 'dart:async';

import 'package:formvalidation/src/bloc/validator.dart';

//estamos usando un mixin con Validators
class LoginBloc with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Recuperar los datos del Stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  //insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //agregamos los signos de interrogación para que no se ejecute el close si es null
  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
