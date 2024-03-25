import 'package:get/get.dart';

class HomeController extends GetxController {
  final activeLed = "Led 1".obs;

  void setActiveLed({required String led}) => activeLed.value = led;
}
