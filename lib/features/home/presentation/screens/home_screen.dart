import 'package:dr_purple/features/home/presentation/screens/widgets/dr_purple_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.navigationShell}) : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: DrPurpleNavigationBar(
          navigationShell: widget.navigationShell,
        ),
      );
}
