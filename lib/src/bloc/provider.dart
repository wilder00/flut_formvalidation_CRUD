import 'dart:html';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
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
