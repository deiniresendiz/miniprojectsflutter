import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  List<String> _pages = ['Home', 'About', 'Pricing', 'Contract', 'Location'];
  int _currentIndex = 0;
  createScrollController(String routeName) {
    this.scrollController =
        PageController(initialPage: getPageIndex(routeName));

    html.document.title = _pages[getPageIndex(routeName)];

    this.scrollController.addListener(() {
      final currentPage = scrollController.page!.round();
      final routeName = _pages[currentPage].toLowerCase();
      if (_currentIndex != currentPage) {
        html.window.history.pushState(null, 'none', '/#/$routeName');
        _currentIndex = currentPage;
        html.document.title = routeName;
      }
    });
  }

  int getPageIndex(String routeName) {
    return (_pages.indexOf(routeName) == -1) ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
