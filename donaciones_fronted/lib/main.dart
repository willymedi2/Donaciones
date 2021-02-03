import 'package:donaciones_fronted/providers/ui_provider.dart';
import 'package:donaciones_fronted/src/bloc/provider.dart';
import 'package:donaciones_fronted/src/pages/home_page.dart';
import 'package:donaciones_fronted/src/pages/login_page.dart';
import 'package:donaciones_fronted/src/pages/register_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: LoginPage.id,
          routes: {
            LoginPage.id: (context) => LoginPage(),
            HomePage.id: (context) => HomePage(),
            RegisterPage.id: (context) => RegisterPage(),
          },
        ),
      ),
    );
  }
}
