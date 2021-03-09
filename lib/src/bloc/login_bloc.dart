import 'dart:async';

class LoginBloc {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Recuperar los datos del Stream
  Stream<String> get emailStream =>
      _emailController.stream; //para escuchar cuando algo salga de ahí
  Stream<String> get passwordStream =>
      _passwordController.stream; //para escuchar cuando algo salga de ahí

  //insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //agregamos los signos de interrogación para que no se ejecute el close si es null
  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
