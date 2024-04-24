import 'package:flutter/material.dart';
import 'package:lion_project_07/common/widgets/buttons/custom_button.dart';
import 'package:lion_project_07/services/bmi_services.dart';

class ResultView extends StatelessWidget {
  final String result;
  final String description;
  const ResultView({
    super.key,
    required this.result,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(title: const Text('Results')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        result,
                        style: const TextStyle(fontSize: 42),
                      ),
                      const SizedBox(height: 26),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: 'Restart',
                onPressed: () {
                  bmiServices.restart();
                  Navigator.pop(context, true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
