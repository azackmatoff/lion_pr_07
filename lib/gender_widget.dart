import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const GenderWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 82,
            ),
            const SizedBox(height: 5.0),
            Text(
              text.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
