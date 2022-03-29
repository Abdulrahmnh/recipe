import 'package:flutter/cupertino.dart';
import '../utils/AppColor.dart';

class BottomGradientWidget extends StatelessWidget {
  const BottomGradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(gradient: AppColor.bottomShadow),
      ),
    );
  }
}