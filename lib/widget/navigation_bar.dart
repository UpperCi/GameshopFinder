import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stores/main.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    return NavigationBar(
      selectedIndex: appState.pageIndex,
      onDestinationSelected: (int i) {
        appState.setCurrentPage(i);
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.map), label: "Kaart"),
        NavigationDestination(icon: Icon(Icons.list), label: "Locaties"),
        NavigationDestination(icon: Icon(Icons.notes), label: "Notities"),
        NavigationDestination(
            icon: Icon(Icons.settings), label: "Instellingen"),
      ],
    );
  }
}
