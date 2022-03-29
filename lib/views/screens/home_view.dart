import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/views/cards_view/favorites_card.dart';
import 'package:recipe/views/screens/profile_page.dart';
import 'package:recipe/views/utils/AppColor.dart';
import 'package:recipe/views/widget/custom_app_bar.dart';
import 'package:recipe/views/cards_view/dummy_search_bar.dart';
import '../../controller/home_controller.dart';
import '../cards_view/Recipes_card.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Welcome',
            style: TextStyle(fontWeight: FontWeight.w700)),
        showProfilePhoto: true,
        profilePhoto: const AssetImage('assets/images/user.jpg'),
        profilePhotoOnPressed: () {
          Get.to(() => ProfilePage());
        },
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 320,
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    height: 245,
                    color: AppColor.primary,
                  ),
                  Column(
                    children: [
                      DummySearchBar(
                        routeTo: () {},
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'All Recipes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const RecipesCard(),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Favorite recipes',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                FavoriteCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
