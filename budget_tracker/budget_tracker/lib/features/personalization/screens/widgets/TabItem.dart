// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:budget_tracker/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../utils/constants/colors.dart';

class Tabitem extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;
  const Tabitem({
    super.key,
    required this.index,
    required this.onChangedTab,
  });

  @override
  State<Tabitem> createState() => _TabitemState();
}

class _TabitemState extends State<Tabitem> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(
        onPressed: null,
        icon: Icon(Icons.no_cell),
      ),
    );
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildTabItem(
            index: 0,
            icon: Icon(CupertinoIcons.home),
          ),
          buildTabItem(
            index: 1,
            icon: Icon(CupertinoIcons.graph_circle_fill),
          ),
          placeholder,
          buildTabItem(
            index: 2,
            icon: Icon(CupertinoIcons.gift),
          ),
          buildTabItem(
            index: 3,
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required Icon icon,
  }) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? AppColors.primary : AppColors.black,
      ),
      child: IconButton(
        icon: icon,
        onPressed: () => widget.onChangedTab(index),
      ),
    );
  }
}
