import 'package:flutter/material.dart';
import 'package:scmia_eprom/Data/dummy_data.dart';
import 'package:scmia_eprom/Screens/login_page.dart';
import 'package:scmia_eprom/Screens/patient_questionnaire_screen.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(child: LoginPage()),
      ],
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }
}
