import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/core/viewModel/auth_view_model.dart';
import 'package:recipe/views/screens/register_view.dart';
import 'package:recipe/views/utils/AppColor.dart';
import 'login_view.dart';
import '../widget/custom_text.dart';

class SplashView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash.jpg'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 60 / 100,
              decoration: BoxDecoration(gradient: AppColor.linearBlackBottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Welcome',
                            style: GoogleFonts.balsamiqSans(
                              textStyle: const TextStyle(
                                fontSize: 45,
                                color: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: OutlinedButton(
                            child: Text('Log in',
                                style: TextStyle(
                                    color: AppColor.secondary,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'inter')),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return LoginView();
                                  });
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              side: BorderSide(
                                  color: AppColor.secondary.withOpacity(0.5),
                                  width: 1),
                              primary: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomText(
                        text: 'OR',
                        fontsize: 18,
                        color: Colors.white,
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                child: Text('Sign in with Google',
                                    style: TextStyle(
                                        color: AppColor.secondary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        )
                                ),
                                onPressed: () {
                                  controller.googleSignInMethod();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  primary: AppColor.primarySoft,
                                ),
                              ),
                              ElevatedButton(
                                child: Text('Sign in with Facebook',
                                    style: TextStyle(
                                        color: AppColor.secondary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        )
                                ),
                                onPressed: () {
                                  controller.facebookSignInMethod();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  primary: AppColor.primarySoft,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'You do not have an account?',
                              color: Colors.white,
                            ),
                            TextButton(
                              child: const Text(
                                'Register',
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return RegisterView();
                                    });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
