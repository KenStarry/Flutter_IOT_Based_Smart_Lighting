import 'package:get/get.dart';

class HomeController extends GetxController {
  final activeLed = "Led 1".obs;
  final ledLowLevel = 0.0.obs;
  final ledMediumLevel = 100.0.obs;
  final ledHighLevel = 255.0.obs;

  void setActiveLed({required String led}) => activeLed.value = led;

  void setIntensityLevels({double? low, double? medium, double? high}) {
    ledLowLevel.value = low ?? ledLowLevel.value;
    ledMediumLevel.value = medium ?? ledMediumLevel.value;
    ledHighLevel.value = high ?? ledHighLevel.value;
  }
}
