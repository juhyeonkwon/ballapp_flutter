import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}


class _MainNavigationState extends State<MainNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const ChildWidget(),
    );
  }
}


class ChildWidget extends StatelessWidget {
  const ChildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Text('app bar Test')
      ),
      body: const Center(
        child: Text("dtd"),
      )
    );
  }
}
