import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/viewModel/auth_view_model.dart';
import '../views/widget/custom_button.dart';
import '../views/widget/custom_text.dart';
import '../views/widget/custom_text_form_field.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 85 / 100,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            physics: BouncingScrollPhysics(),
            children: [
            Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 35 / 100,
              margin: EdgeInsets.only(bottom: 20),
              height: 6,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
            ),
          ),
           Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  border: UnderlineInputBorder(),
                  text: 'email',
                  hint: 'Enter Your Email',
                  validator: (value) {
                    if(value == null){
                      print('Error');
                    }
                  },
                  onsave: (value) {
                    controller.email = value.toString();
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: 'Password',
                  hint: 'Enter Your Password',
                  obsecureText: true,
                  border: UnderlineInputBorder(),
                  validator: (value) {
                    if(value == null){
                      print('Error');
                    }
                  },
                  onsave: (value) {
                    controller.password = value.toString();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Forget Password?',
                  fontsize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(onPressed: () {
                  _formKey.currentState?.save();
                  if (_formKey.currentState?.validate() != null) {
                    controller.signInWithEmailAndPassword();
                  }
                },
                    text: 'Log In',
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ]
          )
        ),
      ],
      );
  }
}
