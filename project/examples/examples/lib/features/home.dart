import 'package:examples/features/widgets/tabitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen_one.dart';
import 'screen_two.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  late final List<Widget> pages;
  int _currentIndex = 0;
  late PageController _pageController;

  void _onChangeTab(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);

    pages = [
      ScreenOne(),
      ScreenTwo(),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Tabitem(
        index: _currentIndex,
        onChangedTab: _onChangeTab,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: pages,
      ),
    );
  }
}
