import 'package:donaciones_fronted/providers/ui_provider.dart';
import 'package:donaciones_fronted/src/bloc/provider.dart';
import 'package:donaciones_fronted/src/pages/campana_page.dart';
import 'package:donaciones_fronted/src/pages/home_page.dart';
import 'package:donaciones_fronted/src/pages/login_page.dart';
import 'package:donaciones_fronted/src/pages/register_page.dart';
import 'package:donaciones_fronted/src/preferencias_usuario/preferencias_usuario.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Providerr(
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => new UiProvider())],
        child: MaterialApp(
          title: 'Donaciones',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: HomePage.id,
          routes: {
            LoginPage.id: (context) => LoginPage(),
            HomePage.id: (context) => HomePage(),
            RegisterPage.id: (context) => RegisterPage(),
            CampanaPage.id: (context) => CampanaPage()
          },
        ),
      ),
    );
  }
}
