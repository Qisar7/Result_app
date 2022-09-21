import 'package:flutter/material.dart';
import 'package:result_app/views/util/border_st.dart';
import 'package:result_app/views/util/color.dart';

class Form_field {
  Border_style border_style = Border_style();

  sign_up({
    String label,
    IconData prefixicon,
    validat,
    TextEditingController controller,
    bool pass = false,
    TextInputType textInputType,
    Widget suffixicon,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: pass,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixicon,
          color: Colors.white,
        ),
        hintText: label,

        // labelStyle: border_style.lablestyle(),
        // enabledBorder: border_style.border(),
        // focusedBorder: border_style.fborder(),
        suffixIcon: suffixicon,
      ),

      // onFieldSubmitted: (_) {
      //   FocusScope.of(context).requestFocus(emailfocsenode);
      // },
      textInputAction: TextInputAction.next,
      validator: validat,
    );
  }
////////////////
/////////////
  ///
  ///
//////////////

  // sign_in(
  //     {String? label,
  //     IconData? prefixicon,
  //     vali,
  //     TextEditingController? controller,
  //     bool pass = false,
  //     Widget? widget,
  //     TextInputType? textInputType}) {
  //   return TextFormField(
  //     controller: controller,
  //     obscureText: pass,
  //     keyboardType: textInputType,
  //     decoration: InputDecoration(
  //       prefixIcon: Icon(
  //         prefixicon,
  //         color: Colors.lightBlue[300],
  //       ),
  //       label: Text(label!),
  //       labelStyle: border_style.lablestyle(),
  //       enabledBorder: border_style.border(),
  //       focusedBorder: border_style.fborder(),
  //       suffixIcon: widget,
  //     ),

  //     // onFieldSubmitted: (_) {
  //     //   FocusScope.of(context).requestFocus(emailfocsenode);
  //     // },
  //     textInputAction: TextInputAction.next,
  //     validator: vali,
  //   );
  // }
}
