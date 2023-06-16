import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stores/main.dart';
import 'package:stores/model/store.dart';
import 'package:stores/widget/listed_store.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class PageDisplay extends StatelessWidget {
  const PageDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    var pageRouterState = context.watch<AppState>();
    Widget page;
    switch (pageRouterState.pageIndex) {
      case 0:
        page = const MapView();
        break;
      case 1:
        page = const StoresList();
        break;
      case 2:
        page = const Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 12),
              child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.store),
                      border: OutlineInputBorder(),
                      hintText: "store name"))),
        ]);
        break;
      default:
        page = const Placeholder();
    }
    return page;
  }
}

class StoresList extends StatelessWidget {
  const StoresList({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var stores = appState.getStores();
    return FutureBuilder<List<Store>>(
        future: stores,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
                padding: const EdgeInsets.all(4),
                children: snapshot.data!
                    .map((store) => ListedStore(store: store))
                    .toList());
          }
          return const Text("Loading data...");
        });
  }
}

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    const ACCESS_TOKEN = String.fromEnvironment("ACCESS_TOKEN");

    return MapboxMap(
        accessToken: ACCESS_TOKEN,
        initialCameraPosition: const CameraPosition(target: LatLng(0.0, 0.0)));
  }
}
