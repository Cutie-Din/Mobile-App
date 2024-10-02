import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        onPressed: () {},
        icon: Icon(Icons.no_cell),
      ),
    );
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTabItem(
            index: 0,
            icon: Icon(CupertinoIcons.sum),
            label: 'Sum',
          ),
          buildTabItem(
            index: 1,
            icon: Icon(CupertinoIcons.rectangle),
            label: 'Up/Down',
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
                  color: isSelected ? Colors.pink.shade200 : Colors.black),
              child: icon),
          Text(
            label,
            style: TextStyle(
                color: isSelected ? Colors.pink.shade200 : Colors.black,
                fontSize: 12),
          )
        ],
      ),
    );
  }
}
