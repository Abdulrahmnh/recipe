import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final UnderlineInputBorder border;
  final void Function(String?) onsave;
  final FormFieldValidator validator;
  final bool obsecureText;

  CustomTextFormField(
      {required this.text,
      required this.hint,
      required this.onsave,
      required this.validator,
      required this.border,
      this.obsecureText = false,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        children: [
          CustomText(
            text: text,
            fontsize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onsave,
            validator: validator,
            obscureText: obsecureText,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                fillColor: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
