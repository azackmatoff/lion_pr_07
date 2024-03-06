import 'package:flutter/material.dart';
import 'package:lion_project_07/gender_widget.dart';

/// DRY - Don't Repeat Yourself
/// UI, 1. method (funksiya), 2. widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 170.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// widget versiyasi
                  GenderWidget(
                    icon: Icons.male,
                    text: 'male',
                  ),
                  SizedBox(width: 12),
                  GenderWidget(
                    icon: Icons.female,
                    text: 'female',
                  ),

                  /// method versiyasi
                  // buildBox(
                  //   icon: Icons.male,
                  //   text: 'Male',
                  // ),
                  // SizedBox(width: 12),
                  // buildBox(
                  //   icon: Icons.female,
                  //   text: 'Female',
                  // ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'HEIGHT',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '${height.toStringAsFixed(1)} cm', // Display height with 1 decimal place
                        style: TextStyle(fontSize: 36.0),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.redAccent,
                          trackShape: const RectangularSliderTrackShape(),
                          trackHeight: 2.0,
                          thumbColor: Colors.redAccent,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                          overlayColor: Colors.red.withAlpha(32),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 18.0),
                        ),
                        child: Slider(
                          value: height,
                          min: 50.0, // Minimum height
                          max: 300.0, // Maximum height
                          onChanged: (double newHeight) {
                            setState(() {
                              height = newHeight;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Salmagy',
                    style: TextStyle(fontSize: 42),
                  ),
                  Text(
                    'Jashy',
                    style: TextStyle(fontSize: 42),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBox({
    required IconData icon,
    required String text,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
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
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
