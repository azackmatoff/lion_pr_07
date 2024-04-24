import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lion_project_07/common/widgets/buttons/custom_button.dart';
import 'package:lion_project_07/getx/controller/home_view_controller.dart';

class GetxResultView extends StatelessWidget {
  GetxResultView({
    super.key,
  });

  final HomeViewController _homeViewController = Get.find<HomeViewController>();

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
                        _homeViewController.getResult(),
                        style: const TextStyle(fontSize: 42),
                      ),
                      const SizedBox(height: 26),
                      Text(
                        _homeViewController.getInterpretation(),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: 'Restart',
                onPressed: () {
                  _homeViewController.restart();
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
