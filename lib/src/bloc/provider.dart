import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/login_bloc.dart';
//exportamos para que podamos usar el final loginBloc
export 'package:formvalidation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  //ESTAMOS CREANDO UN SINGLETON PARA QUE NO SE PIERDAN LOS DATOS
  static Provider _instancia;

  //la idea del factory es ver si se debe retornar una nueva instancia de la clase o la que ya está instanciada, si lo está
  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(
        key: key,
        child: child,
      );
    }
    return _instancia;
  }

  //el key es un identificador único del widget
  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  //estamos inicializando nuestro LoginBlock, el que servirá para validar el login
  final loginBloc = LoginBloc();

  //el key es un identificador único del widget
  //Provider({Key key, Widget child}) : super(key: key, child: child);

  //este overrride indica que al actualizarte ¿debemos notificar a los hijos nodos? en la gran mayoría de casos True
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  //el login bloc tomará el contexto(que es todo el arbol de widgets) va a buscar el widget del tipo `<Provider>`
  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}
