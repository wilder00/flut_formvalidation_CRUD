import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/login_bloc.dart';
//exportamos para que podamos usar el final loginBloc
export 'package:formvalidation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  //estamos inicializando nuestro LogiBlock, el que servirá para validar el login
  final loginBloc = LoginBloc();

  //el key es un identificador único del widget
  Provider({Key key, Widget child}) : super(key: key, child: child);

  //este overrride indica que al actualizarte ¿debemos notificar a los hijos nodos? en la gran mayoría de casos True
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  //el login bloc tomará el contexto(que es todo el arbol de widgets) va a buscar el widget del tipo `<Provider>`
  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}
