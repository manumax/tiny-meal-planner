import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _dayNumberFormatter = DateFormat('dd');
final _dayNameFormatter = DateFormat('EEE');
final _monthFormatter = DateFormat('MMM');

class CalendarList extends StatefulWidget {
  const CalendarList({Key? key}) : super(key: key);

  @override
  State<CalendarList> createState() => _CalendarListState();
}

class _CalendarListState extends State<CalendarList> {
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

class Meal extends StatelessWidget {
  const Meal({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 8.0,
            ),
            child: Text(
              name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const EmptyRecipe(),
        ],
      ),
    );
  }
}

class EmptyRecipe extends StatelessWidget {
  const EmptyRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 60,
      ),
      color: Colors.grey[300],
      alignment: Alignment.center,
      child: const Text('You haven\'t selected a recipe yet'),
    );
  }
}
