import 'package:flutter/material.dart';

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