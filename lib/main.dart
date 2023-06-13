import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stores/model/store.dart';

import 'widget/navigation_bar.dart';
import 'widget/page_display.dart';
import 'package:stores/service/stores_api.dart';

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
        create: (context) => AppState(),
        child: const Scaffold(
            bottomNavigationBar: NavBar(),
            body: SafeArea(child: PageDisplay())));
  }
}

class AppState extends ChangeNotifier {
  var pageIndex = 0;
  var api = StoresApi();
  List<Store>? cachedStores;

  void setCurrentPage(int newIndex) {
    pageIndex = newIndex;
    notifyListeners();
  }

  Future<List<Store>> getStores() async {
    if (cachedStores == null) {
      var stores = await api.fetchStores();
      cachedStores = stores;
      return stores;
    } else {
      return Future<List<Store>>.value(cachedStores);
    }
  }
}
