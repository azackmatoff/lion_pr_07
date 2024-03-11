import 'package:flutter/material.dart';
import 'package:lion_project_07/gender_widget.dart';
import 'package:lion_project_07/weight_age_widget.dart';

/// DRY - Don't Repeat Yourself
/// UI, 1. method (funksiya), 2. widget
/// enum

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 170.0;
  int age = 18;
  int weigth = 48;

  Gender gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// widget versiyasi
                        GenderWidget(
                          icon: Icons.male,
                          text: 'male',
                          onTap: () {
                            setState(() {
                              gender = Gender.male;
                            });
                          },
                          bgColor: gender == Gender.male
                              ? Theme.of(context).primaryColorDark.withOpacity(0.4)
                              : Theme.of(context).colorScheme.background,
                        ),
                        const SizedBox(width: 12),
                        GenderWidget(
                          icon: Icons.female,
                          text: 'female',
                          onTap: () {
                            setState(() {
                              gender = Gender.female;
                            });
                          },
                          bgColor: gender == Gender.female
                              ? Theme.of(context).primaryColorDark.withOpacity(0.4)
                              : Theme.of(context).colorScheme.background,
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
                    _heightWidget(context),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        WeightAgeWidget(
                          text: 'WEIGHT',
                          value: weigth.toString(),
                          increment: () {
                            setState(() {
                              weigth++;
                            });
                          },
                          decrement: () {
                            setState(() {
                              weigth--;
                            });
                          },
                        ),
                        const SizedBox(width: 12),
                        WeightAgeWidget(
                          text: 'AGE',
                          value: age.toString(),
                          increment: () {
                            setState(() {
                              age++;
                            });
                          },
                          decrement: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 88.0, vertical: 28.0),
            ),
            child: Text(
              'Calculate',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _heightWidget(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HEIGHT',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '${height.toStringAsFixed(1)} cm', // Display height with 1 decimal place
              style: const TextStyle(fontSize: 36.0),
            ),
            const SizedBox(height: 8),
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



  // bool maleChosen = true;
  // bool femaleChosen = false;

  // Color getMaleColor() {
  //   return maleChosen ? Theme.of(context).primaryColorDark.withOpacity(0.4) : Theme.of(context).colorScheme.background;

  //   // if (maleChosen == true) {
  //   //   return Theme.of(context).primaryColorDark.withOpacity(0.4);
  //   // } else {
  //   //   return Theme.of(context).colorScheme.background;
  //   // }
  // }

  // Color getFemaleColor() {
  //   if (femaleChosen == true) {
  //     return Theme.of(context).primaryColorDark.withOpacity(0.4);
  //   } else {
  //     return Theme.of(context).colorScheme.background;
  //   }
  // }