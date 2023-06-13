import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stores/main.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    List<IconData> icons = [
      Icons.map,
      Icons.view_list,
      Icons.description,
      Icons.settings
    ];

    List<IconData> icons_outlined = [
      Icons.map_outlined,
      Icons.view_list_outlined,
      Icons.description_outlined,
      Icons.settings_outlined
    ];

    List<String> icons_labels = [
      "Kaart",
      "Locaties",
      "Notities",
      "Instellingen"
    ];

    return NavigationBar(
      selectedIndex: appState.pageIndex,
      onDestinationSelected: (int i) {
        appState.setCurrentPage(i);
      },
      destinations: icons_labels.asMap().entries.map((v) {
        var icon = (v.key == appState.pageIndex)
            ? icons[v.key]
            : icons_outlined[v.key];
        return NavigationDestination(icon: Icon(icon), label: v.value);
      }).toList(),
    );
  }
}
