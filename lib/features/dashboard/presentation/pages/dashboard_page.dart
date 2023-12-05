import 'package:bas_clean_architecture/core/mixins/index.dart';
import 'package:bas_clean_architecture/features/login/index.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = '/';
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with LoadingMixin {
  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
