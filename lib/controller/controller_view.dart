import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recipe/views/screens/splash_view.dart';

import '../core/viewModel/auth_view_model.dart';
import '../core/viewModel/control_view_model.dart';
import '../views/cards_view/buttonNaviBar.dart';
import '../views/utils/AppColor.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? SplashView()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: ButtonNaviBar(),
              ),
            );
    });
  }
}

