import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lion_project_07/common/contants/enum/app_enums.dart';
import 'package:lion_project_07/common/widgets/buttons/custom_button.dart';
import 'package:lion_project_07/common/widgets/custom_circular_button.dart';
import 'package:lion_project_07/common/widgets/gender_widget.dart';
import 'package:lion_project_07/common/widgets/weight_age_widget.dart';
import 'package:lion_project_07/getx/controller/home_view_controller.dart';
import 'package:lion_project_07/getx/view/getx_result_view.dart';

class GetXHomeView extends StatelessWidget {
  GetXHomeView({super.key});

  final HomeViewController _controller = Get.put<HomeViewController>(HomeViewController());

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
                    _maleAndFemaleContainers(context),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (cntxt) {
                    return GetxResultView();
                  }),
                );
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _maleAndFemaleContainers(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => GenderWidget(
            icon: Icons.male,
            text: 'male',
            onTap: () {
              _controller.changeGender(Gender.male);
            },
            bgColor: _controller.gender.value == Gender.male
                ? Theme.of(context).primaryColorDark.withOpacity(0.4)
                : Theme.of(context).colorScheme.background,
          ),
        ),
        const SizedBox(width: 12),
        Obx(
          () => GenderWidget(
            icon: Icons.female,
            text: 'female',
            onTap: () => _controller.changeGender(Gender.female),
            bgColor: _controller.gender.value == Gender.female
                ? Theme.of(context).primaryColorDark.withOpacity(0.4)
                : Theme.of(context).colorScheme.background,
          ),
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
            Obx(
              () => Text(
                '${_controller.height.value.toStringAsFixed(1)} cm', // Display height with 1 decimal place
                style: const TextStyle(fontSize: 36.0),
              ),
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
              child: Obx(
                () => Slider(
                  value: _controller.height.value,
                  min: 50.0, // Minimum height
                  max: 300.0, // Maximum height
                  onChanged: (double newHeight) {
                    _controller.changeHeight(newHeight);
                  },
                ),
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
        Obx(
          () => WeightAgeWidget(
            text: 'WEIGHT',
            value: _controller.weight.value.toString(),
            child1: CustomCircularButton(
              heroTag: 'w_tag1',
              icon: Icons.add,
              onPressed: () => _controller.incrementWeight(),
            ),
            child2: CustomCircularButton(
              heroTag: 'w_tag2',
              icon: Icons.remove,
              onPressed: () => _controller.decrementWeight(),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Obx(
          () => WeightAgeWidget(
            text: 'AGE',
            value: _controller.age.value.toString(),
            child1: CustomCircularButton(
              heroTag: 'a_tag1',
              icon: Icons.add,
              onPressed: () => _controller.incrementAge(),
            ),
            child2: CustomCircularButton(
              heroTag: 'a_tag2',
              icon: Icons.remove,
              onPressed: () => _controller.decrementAge(),
            ),
          ),
        ),
      ],
    );
  }
}
