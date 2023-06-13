import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stores/main.dart';
import 'package:stores/model/store.dart';
import 'package:stores/widget/listed_store.dart';

class PageDisplay extends StatelessWidget {
  const PageDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    var pageRouterState = context.watch<AppState>();
    Widget page;
    switch (pageRouterState.pageIndex) {
      case 0:
        page = const Text("First page");
        break;
      case 1:
        page = const Icon(Icons.tsunami);
        break;
      case 2:
        page = const ListView();
        break;
      default:
        page = const Placeholder();
    }
    return page;
  }
}

class ListView extends StatelessWidget {
  const ListView({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var stores = appState.getStores();
    return FutureBuilder<List<Store>>(
        future: stores,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListedStore(store: snapshot.data!.first);
          }
          return Text("Error");
        });
  }
}
