import 'package:flutter/material.dart';
import 'widgets/menu.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Center(),
        // bottomNavigationBar: BottomMenu(),
      ),
    );
  }
}
