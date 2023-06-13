import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stores/main.dart';

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
      default:
        page = const Placeholder();
    }
    return page;
  }
}
