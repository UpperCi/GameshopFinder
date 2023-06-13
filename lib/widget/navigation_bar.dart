import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stores/main.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var pageRouterState = context.watch<AppState>();
    return NavigationBar(
      selectedIndex: pageRouterState.pageIndex,
      onDestinationSelected: (int i) {
        pageRouterState.setCurrentPage(i);
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
