import 'package:dr_purple/app/app_management/theme/color_manager.dart';
import 'package:dr_purple/core/widgets/dr_purple_scaffold.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return DrPurpleScaffold(
      body: const Center(child: Text("Dashboard screen")),
    );
  }
}
