import 'package:flutter/material.dart';
import 'package:lion_project_07/common/contants/enum/app_enums.dart';
import 'package:lion_project_07/common/widgets/buttons/custom_button.dart';
import 'package:lion_project_07/common/widgets/custom_circular_button.dart';
import 'package:lion_project_07/common/widgets/gender_widget.dart';
import 'package:lion_project_07/common/widgets/weight_age_widget.dart';
import 'package:lion_project_07/services/bmi_services.dart';
import 'package:lion_project_07/set_state/view/result_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _height = 170.0;
  int _age = 18;
  int _weigth = 48;
  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    _maleAndFemaleContainers(),
                    const SizedBox(height: 12),
                    _heightContainer(context),
                    const SizedBox(height: 12),
                    _weightAndAgeContainer(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            CustomButton(
              text: 'Calculate',
              onPressed: () async {
                bmiServices.calculateBMI(weight: _weigth, height: _height.toInt());
                final bool restart = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (cntxt) {
                    return ResultView(
                      result: bmiServices.getResult(),
                      description: bmiServices.getInterpretation(),
                    );
                  }),
                );

                if (restart) {
                  _restart();
                }
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _maleAndFemaleContainers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GenderWidget(
          icon: Icons.male,
          text: 'male',
          onTap: () {
            setState(() {
              _gender = Gender.male;
            });
          },
          bgColor: _gender == Gender.male
              ? Theme.of(context).primaryColorDark.withOpacity(0.4)
              : Theme.of(context).colorScheme.background,
        ),
        const SizedBox(width: 12),
        GenderWidget(
          icon: Icons.female,
          text: 'female',
          onTap: () {
            setState(() {
              _gender = Gender.female;
            });
          },
          bgColor: _gender == Gender.female
              ? Theme.of(context).primaryColorDark.withOpacity(0.4)
              : Theme.of(context).colorScheme.background,
        ),
      ],
    );
  }

  Widget _heightContainer(BuildContext context) {
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
              '${_height.toStringAsFixed(1)} cm', // Display height with 1 decimal place
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
                value: _height,
                min: 50.0, // Minimum height
                max: 300.0, // Maximum height
                onChanged: (double newHeight) {
                  setState(() {
                    _height = newHeight;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _weightAndAgeContainer() {
    return Row(
      children: [
        WeightAgeWidget(
          text: 'WEIGHT',
          value: _weigth.toString(),
          child1: CustomCircularButton(
            heroTag: 'w_tag1',
            icon: Icons.add,
            onPressed: () {
              setState(() {
                _weigth++;
              });
            },
          ),
          child2: CustomCircularButton(
            heroTag: 'w_tag2',
            icon: Icons.remove,
            onPressed: () {
              setState(() {
                _weigth--;
              });
            },
          ),
        ),
        const SizedBox(width: 12),
        WeightAgeWidget(
          text: 'AGE',
          value: _age.toString(),
          child1: CustomCircularButton(
            heroTag: 'a_tag1',
            icon: Icons.add,
            onPressed: () {
              setState(() {
                _age++;
              });
            },
          ),
          child2: CustomCircularButton(
            heroTag: 'a_tag2',
            icon: Icons.remove,
            onPressed: () {
              setState(() {
                _age--;
              });
            },
          ),
        ),
      ],
    );
  }

  void _restart() {
    _height = 170.0;
    _age = 18;
    _weigth = 48;
    _gender = Gender.male;

    setState(() {});
  }
}
