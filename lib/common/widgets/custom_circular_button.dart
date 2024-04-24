import 'package:flutter/material.dart';

class CustomCircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String heroTag;
  const CustomCircularButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      shape: const CircleBorder(),
      backgroundColor: Theme.of(context).primaryColorDark.withOpacity(0.4),
      child: Icon(
        icon,
        size: 34,
      ),
    );
  }
}
