import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/views/cards_view/favorites_card.dart';
import 'package:recipe/views/profile_page.dart';
import 'package:recipe/views/utils/AppColor.dart';
import 'package:recipe/views/widget/custom_app_bar.dart';
import 'package:recipe/views/widget/dummy_search_bar.dart';
import '../controller/home_controller.dart';
import 'cards_view/Recipes_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Welcome in Recipe App',
            style: TextStyle(fontWeight: FontWeight.w700)),
        showProfilePhoto: true,
        profilePhoto: const AssetImage('assets/user.jpg'),
        profilePhotoOnPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ProfilePage()));
        },
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 420,
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
                    RecipesCard()
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Favorite recipe',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const FavoriteCard()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
