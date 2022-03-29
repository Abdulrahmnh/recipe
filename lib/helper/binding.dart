import 'package:get/get.dart';
import 'package:recipe/controller/home_controller.dart';
import '../core/viewModel/auth_view_model.dart';
import '../core/viewModel/control_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies(){
    Get.put((AuthViewModel()));
    Get.put((HomeController()));
    Get.put((ControlViewModel()));
  }
}