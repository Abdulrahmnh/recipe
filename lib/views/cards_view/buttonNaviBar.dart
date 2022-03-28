import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../core/viewModel/control_view_model.dart';
import '../utils/AppColor.dart';

class ButtonNaviBar extends StatelessWidget {
  const ButtonNaviBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => Container(
        padding: const EdgeInsets.only(left: 60, right: 60, bottom: 20),
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5000),
          child: SizedBox(
            height: 100,
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset('assets/icons/home-filled.svg',
                        color: AppColor.primary),
                    label: '',
                    icon: SvgPicture.asset(
                      'assets/icons/home.svg',
                      color: Colors.grey[600],
                    )),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset('assets/icons/discover-filled.svg',
                      color: AppColor.primary, height: 28, width: 26),
                  label: '',
                  icon: SvgPicture.asset('assets/icons/discover.svg',
                      color: Colors.grey[600], height: 28, width: 26),
                ),
              ],
              currentIndex: controller.navigatorValue,
              onTap: (index) {
                controller.changeSelectedValue(index);
              },
              selectedItemColor: Colors.black,
              backgroundColor: Colors.grey.shade50,
            ),
          ),
        ),
      ),
    );
  }
}
