import 'package:donaciones_fronted/providers/ui_provider.dart';
import 'package:donaciones_fronted/src/pages/campana_page.dart';
import 'package:donaciones_fronted/src/pages/donacion_page.dart';
import 'package:donaciones_fronted/src/pages/historial_page.dart';
import 'package:donaciones_fronted/widgets/custom_navigatorbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static String id = 'home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donaciones App"),
      ),
      body: Center(
        child: _HomePageBody(),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return DonacionPage();
      case 1:
        return CampanaPage();
      case 2:
        return HistorialPage();
      default:
        return DonacionPage();
    }
  }
}
