import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';
import 'package:formvalidation/src/pages/producto_page.dart';
import 'package:formvalidation/src/pages/registro_page.dart';
import 'package:formvalidation/src/preferencias_usuario/preferencias_usuario.dart';
//para leer .env
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  // NOTE: The filename will default to .env and doesn't need to be defined in this case
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        //initialRoute: 'login',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'producto': (BuildContext context) => ProductoPage(),
          'registro': (BuildContext context) => RegistroPage(),
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
