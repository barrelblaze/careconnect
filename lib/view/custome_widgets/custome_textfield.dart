
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/utils/colors.dart';

Widget customeTextField(
    {controller,
  //  required BuildContext context,
    String? labelText,
    String? hintText,
    Widget? icon,
    required double? radius,
    prefixicon,
    fillcolor,
    obsecure,
    TextInputType? keyboardType,
    Function()?onTap,
    String? Function(String?)? validator,
    void Function(String)? onSubmitted}) {
    //     final hight = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
  return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
    //               height:
    // hight * .5,
    child: TextFormField(
      keyboardType: keyboardType,
      onTap:onTap ,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      obscureText: obsecure ?? false,
      controller: controller,
      decoration: InputDecoration(
          hintStyle: GoogleFonts.jua(fontSize: 18, fontWeight: FontWeight.w400),
          fillColor: fillcolor ?? appThemeGrey,
          filled: true,
          hintText: hintText,
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: .2, color: appThemeGrey),
              borderRadius: BorderRadius.all(Radius.circular(radius!))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: .2, color: appThemeGrey),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: .2, color: appThemeGrey),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          labelText: labelText,
          labelStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: black),
          suffixIcon: icon,
          prefixIcon: prefixicon),
    ),
  );
}
