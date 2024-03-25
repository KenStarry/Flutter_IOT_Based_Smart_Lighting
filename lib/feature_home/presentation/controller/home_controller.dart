import 'package:get/get.dart';

class HomeController extends GetxController {
  final manualMode = false.obs;
  final activeLed = "Led 1".obs;
  final activeLedMode = "Low".obs;
  final bulbOn = false.obs;

  final ledLowLevel = 0.0.obs;
  final ledMediumLevel = 100.0.obs;
  final ledHighLevel = 255.0.obs;

  void setManualMode({required bool manualMode}) =>
      this.manualMode.value = manualMode;

  void setBulbOn({required bool isOn}) => bulbOn.value = isOn;

  void setActiveLed({required String led}) => activeLed.value = led;

  void setActiveLedMode({required String ledMode}) =>
      activeLedMode.value = ledMode;

  void setIntensityLevels({double? low, double? medium, double? high}) {
    ledLowLevel.value = low ?? ledLowLevel.value;
    ledMediumLevel.value = medium ?? ledMediumLevel.value;
    ledHighLevel.value = high ?? ledHighLevel.value;
  }
}
