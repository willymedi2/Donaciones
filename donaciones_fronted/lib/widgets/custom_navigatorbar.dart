import 'package:donaciones_fronted/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      elevation: 0,
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism), label: "Hacer Donacion"),
        BottomNavigationBarItem(
            icon: Icon(Icons.foundation), label: "Crear Campaña"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "Historial")
      ],
    );
  }
}
