import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/views/screens/splash_view.dart';
import '../core/viewModel/auth_view_model.dart';
import '../core/viewModel/control_view_model.dart';
import '../views/cards_view/ButtonGround.dart';
import '../views/cards_view/buttonNaviBar.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? SplashView()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: Stack(
                  children: [
                    controller.currentScreen,
                    BottomGradientWidget(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [ButtonNaviBar()],
                    )
                  ],
                ),
                // bottomNavigationBar: ButtonNaviBar(),
              ),
            );
    });
  }
}
