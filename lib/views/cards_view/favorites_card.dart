import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recipe/controller/home_controller.dart';
import '../utils/AppColor.dart';

class FavoriteCard extends GetWidget<HomeController> {
  const FavoriteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: controller.obx(
          (data) => ListView.separated(
            itemCount: data!.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 90,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.whiteSoft,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      // Recipe Photo
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey,
                          image: const DecorationImage(
                              image: AssetImage('assets/images/list2.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      // Recipe Info
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Recipe title
                              Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  data[index]['name'].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'inter'),
                                ),
                              ),
                              // Recipe Calories and Time
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/fire-filled.svg',
                                    color: Colors.black,
                                    width: 12,
                                    height: 12,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      data[index]['kCal'].toString(),
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, int index) => const SizedBox(
              width: 20,
            ),
          ),
        ));
  }
}
