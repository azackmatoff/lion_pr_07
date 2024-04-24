import 'package:get/get.dart';
import 'package:lion_project_07/common/contants/enum/app_enums.dart';
import 'package:lion_project_07/services/bmi_services.dart';

class HomeViewController extends GetxController {
  RxDouble height = 170.0.obs;
  RxInt age = 18.obs;
  RxInt weight = 48.obs;
  Rx<Gender> gender = Gender.male.obs;

  void changeGender(Gender chosenGender) {
    gender.value = chosenGender;
  }

  void changeHeight(double chosenHeight) {
    height.value = chosenHeight;
  }

  void incrementWeight() {
    weight.value++;
  }

  void decrementWeight() {
    weight.value--;
  }

  void incrementAge() {
    age.value++;
  }

  void decrementAge() {
    age.value--;
  }

  void restart() {
    height.value = 170.0;
    age.value = 18;
    weight.value = 48;
    gender.value = Gender.female;
    bmiServices.restart();
  }

  String getResult() {
    bmiServices.calculateBMI(weight: weight.value, height: height.value.toInt());
    return bmiServices.getResult();
  }

  String getInterpretation() {
    return bmiServices.getInterpretation();
  }
}
