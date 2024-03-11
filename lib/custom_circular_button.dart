import 'package:flutter/material.dart';

class CustomCircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomCircularButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
