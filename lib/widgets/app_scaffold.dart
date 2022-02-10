import 'package:flutter/material.dart';
import 'package:tailboard_app/widgets/app_drawer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.actions = const [],
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.endDrawer,
    this.scaffoldKey,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final List<Widget> actions;
  final Key? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      drawer: const AppDrawer(),
      endDrawer: endDrawer,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: body,
    );
  }
}
