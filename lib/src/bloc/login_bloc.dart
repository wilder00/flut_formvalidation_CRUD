import 'dart:async';

import 'package:formvalidation/src/bloc/validator.dart';

import 'package:rxdart/rxdart.dart';

//estamos usando un mixin con Validators
class LoginBloc with Validators {
  //parece ser que los stream controlers son los que emiten el stream por medio de .stream y reciben por medio de .sink
  // pero para usar rxdart, que es una forma reactiva de react?? no entendi, la cosa es que no usa StreamController.
  // utiliza BehaviorSubject<String>(), que de por sí ya emite en broadcast por lo que no es necesario ponerle .broadcast();
  // es 100% compatible con un stramController por lo que acepta el .sink y el .stream
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  /* // esto es de versiones antiguas
  Stream<bool> get formValidStream => 
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true );
   */
  // Rx.combineLatest2(stream1, stream2, callback:(stream1, stream2) => true);
  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  //insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //agregamos los signos de interrogación para que no se ejecute el close si es null
  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
