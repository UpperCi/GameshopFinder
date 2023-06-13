import 'package:flutter/material.dart';
import 'package:stores/model/store.dart';

class ListedStore extends StatelessWidget {
  final Store store;
  const ListedStore({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    final adressRe = RegExp(r'(\n|\r|, )+');
    final adressData = store.adress.split(adressRe);
    // TODO: show street instead of place when store is close by
    // final street = adressData[0];
    final place = adressData[1];
    return Row(children: [
      Expanded(
          child: InkWell(
              onTap: () {
                print("TODO");
              },
              child: ListTile(
                  title: Text(store.name),
                  subtitle: Text(place),
                  leading: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.location_pin), Text("5.1km")]),
                  trailing: null)))
    ]);
  }
}
