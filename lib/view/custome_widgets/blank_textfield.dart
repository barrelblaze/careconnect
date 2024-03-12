import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Widget BlankTextField(
    {context,
    bool enabled = true,
    TextEditingController? controller,
    hintText,
    double? fielSize,
    maxline,
    String? Function(String?)? validator,
    maxLength}) {
  return SizedBox(
    // color: Colors.red,
    height: 50,
    width: fielSize ?? MediaQuery.of(context).size.width * .4,
    child: TextFormField(
  
      enabled: enabled,
      // maxLength: maxLength,

      validator: validator,
      maxLines: maxline??1,
      controller: controller,
      decoration: InputDecoration(
          hintStyle: GoogleFonts.jua(),
          hintText: hintText,
          // errorBorder:OutlineInputBorder(),
          enabledBorder: InputBorder.none,
          focusedBorder: const UnderlineInputBorder()),
    ),
  );
}
