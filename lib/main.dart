import 'package:flutter/material.dart';
import 'package:meal_planner/screens/weekly_plan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeeklyPlan(),
    );
  }
}
