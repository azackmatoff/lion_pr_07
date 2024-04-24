import 'package:flutter/material.dart';

class WeightAgeWidget extends StatelessWidget {
  final String text;
  final String value;
  final Widget child1;
  final Widget child2;
  const WeightAgeWidget({
    required this.text,
    required this.value,
    required this.child1,
    required this.child2,
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
              style: const TextStyle(fontSize: 36.0),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child1,
                const SizedBox(width: 9),
                child2,
              ],
            )
          ],
        ),
      ),
    );
  }
}
