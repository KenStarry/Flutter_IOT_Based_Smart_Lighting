import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final db = FirebaseFirestore.instance;

  final manualMode = false.obs;
  final activeLed = "Led 1".obs;
  final activeLedMode = "Low".obs;
  final bulbOn = false.obs;

  final ledLowLevel = 0.0.obs;
  final ledMediumLevel = 100.0.obs;
  final ledHighLevel = 255.0.obs;

  final customLed1 = 30.0.obs;
  final customLed2 = 30.0.obs;
  final customLed3 = 30.0.obs;

  @override
  void onInit() {
    super.onInit();

    updateDataonFirestore(key: 'is_manual', value: manualMode.value);
    updateDataonFirestore(key: 'is_on', value: bulbOn.value);
    updateDataonFirestore(key: 'custom_led_1', value: customLed1.value);
    updateDataonFirestore(key: 'custom_led_2', value: customLed2.value);
    updateDataonFirestore(key: 'custom_led_3', value: customLed3.value);

    //  listen to the data
    ever(ledLowLevel, (lowLevel) async {
      await updateDataonFirestore(key: 'low', value: lowLevel.ceil());
    });

    ever(ledMediumLevel, (mediumLevel) async {
      await updateDataonFirestore(key: 'medium', value: mediumLevel.ceil());
    });

    ever(ledHighLevel, (highLevel) async {
      await updateDataonFirestore(key: 'high', value: highLevel.ceil());
    });

    ever(manualMode, (isManual) async {
      await updateDataonFirestore(key: 'is_manual', value: isManual);
    });

    ever(bulbOn, (isOn) async {
      await updateDataonFirestore(key: 'is_on', value: isOn);
    });

    ever(customLed1, (value) async {
      await updateDataonFirestore(key: 'custom_led_1', value: value.ceil());
    });

    ever(customLed2, (value) async {
      await updateDataonFirestore(key: 'custom_led_2', value: value.ceil());
    });

    ever(customLed3, (value) async {
      await updateDataonFirestore(key: 'custom_led_3', value: value.ceil());
    });
  }

  Future<void> updateDataonFirestore(
      {required String key, required dynamic value}) async {
    final nodeMCUDocument = db.collection('smart-document').doc('node');

    await nodeMCUDocument.update({key: value}).then((value) {
      print("----------DOCUMENT UPDATED SUCCESSFULLY!!!!");
    }, onError: (error) => print("----$error"));
  }

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

  void setCustomLevels({double? led1, double? led2, double? led3}) {
    customLed1.value = led1 ?? customLed1.value;
    customLed2.value = led2 ?? customLed2.value;
    customLed3.value = led3 ?? customLed3.value;
  }
}
