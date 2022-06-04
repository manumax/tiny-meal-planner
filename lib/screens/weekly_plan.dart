import 'package:flutter/material.dart';
import 'package:meal_planner/widgets/day.dart';

class WeeklyPlan extends StatefulWidget {
  const WeeklyPlan({Key? key}) : super(key: key);

  @override
  State<WeeklyPlan> createState() => _WeeklyPlanState();
}

class _WeeklyPlanState extends State<WeeklyPlan> {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return Day(date: today.add(Duration(days: index)));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => debugPrint('Add a new recipe ...'),
      ),
    );
  }
}
