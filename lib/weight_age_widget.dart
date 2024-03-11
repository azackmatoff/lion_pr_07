import 'package:flutter/material.dart';
import 'package:lion_project_07/custom_circular_button.dart';

class WeightAgeWidget extends StatelessWidget {
  final String text;
  final String value;
  final VoidCallback? increment;
  final VoidCallback? decrement;
  const WeightAgeWidget({
    required this.text,
    required this.value,
    required this.decrement,
    required this.increment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 250,
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(fontSize: 36.0),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCircularButton(
                  icon: Icons.add,
                  onPressed: increment,
                ),
                const SizedBox(width: 12),
                CustomCircularButton(
                  icon: Icons.remove,
                  onPressed: decrement,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
