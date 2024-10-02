import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final List<String> items = List<String>.generate(20, (i) => "Items $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${items[index]}"),
            );
          }),
    );
  }
}
