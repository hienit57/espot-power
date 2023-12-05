import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/extensions/app_context.dart';
import 'package:flutter/material.dart';

class Unknown404 extends StatelessWidget {
  static const String routeName = '/404';

  const Unknown404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "404",
                style: TextStyle(
                  fontSize: 120,
                ),
              ),
              const Text(
                "Page not exist",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      AppContext.navigatorKey.currentContext!, AppRoutes.login);
                },
                child: const Text(
                  "Go back",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
