import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal_planner/widgets/meal.dart';

final _dayNumberFormatter = DateFormat('dd');
final _dayNameFormatter = DateFormat('EEE');
final _monthFormatter = DateFormat('MMM');

class Day extends StatelessWidget {
  const Day({Key? key, required this.date}) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  _dayNameFormatter.format(date).toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  _dayNumberFormatter.format(date),
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                Text(
                  _monthFormatter.format(date),
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: const [
                  Meal(name: 'Lunch'),
                  Meal(name: 'Dinner'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}