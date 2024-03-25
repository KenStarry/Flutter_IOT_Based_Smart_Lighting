import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_lighting/feature_home/presentation/controller/home_controller.dart';

//  setting up our Home controller to save the current state
void invokeControllers() {
  Get.lazyPut(() => HomeController(), fenix: true);
}
