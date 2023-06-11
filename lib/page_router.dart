import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stores/navigation_bar.dart';
import 'package:stores/page_display.dart';

class PageRouter extends StatelessWidget {
  const PageRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PageRouterState(),
        child: const Column(children: [PageDisplay(), NavBar()]));
  }
}

class PageRouterState extends ChangeNotifier {
  var pageIndex = 0;

  void setCurrentPage(int newIndex) {
    pageIndex = newIndex;
    notifyListeners();
  }
}
