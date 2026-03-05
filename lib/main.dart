import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(AmbulanceDispatchApp());
}

class AmbulanceDispatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambulance Dispatch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DashboardScreen(),
    );
  }
}
