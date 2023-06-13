import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_router.dart';
import 'navigation_bar.dart';
import 'page_display.dart';

void main() {
  runApp(const Stores());
}

class Stores extends StatelessWidget {
  const Stores({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PageRouterState(),
        child: const Scaffold(
            bottomNavigationBar: NavBar(),
            body: SafeArea(child: PageDisplay())));
  }
}

class AppState extends ChangeNotifier {
  var pageIndex = 0;

  void setCurrentPage(int newIndex) {
    pageIndex = newIndex;
    notifyListeners();
  }
}
