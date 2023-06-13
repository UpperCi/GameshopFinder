import 'package:flutter/material.dart';
import 'package:stores/model/store.dart';

class ListedStore extends StatelessWidget {
  final Store store;
  const ListedStore({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Material(
              child: ListTile(
                  title: Text(store.name),
                  subtitle: Text(store.email),
                  trailing: const Icon(Icons.arrow_forward))))
    ]);
  }
}
