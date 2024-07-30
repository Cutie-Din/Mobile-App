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
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTabItem(
            index: 0,
            icon: Icon(CupertinoIcons.home),
            label: 'Trang chủ',
          ),
          buildTabItem(
            index: 1,
            icon: Icon(CupertinoIcons.graph_circle_fill),
            label: 'Thống kê',
          ),
          placeholder,
          buildTabItem(
            index: 2,
            icon: Icon(CupertinoIcons.gift),
            label: 'Ngân sách',
          ),
          buildTabItem(
            index: 3,
            icon: Icon(CupertinoIcons.person),
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required Icon icon,
    required String label,
  }) {
    final isSelected = index == widget.index;

    return GestureDetector(
      onTap: () => widget.onChangedTab(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconTheme(
            data: IconThemeData(
              color: isSelected ? AppColors.primary : AppColors.black,
            ),
            child: icon,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primary : AppColors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
