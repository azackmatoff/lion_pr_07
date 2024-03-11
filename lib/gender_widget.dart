import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  final Color bgColor;

  const GenderWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 250,
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: bgColor,
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
      ),
    );
  }
}
