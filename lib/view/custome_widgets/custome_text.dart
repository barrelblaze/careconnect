import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customeText({String? text, Color? textcolor, double? size,
FontWeight ?fontWeight,TextOverflow ?overflow,int?maxLines}) {
  return Text(
    "$text",
    maxLines: maxLines??null,
    overflow:overflow??null ,
    style:GoogleFonts.jua(
      color: textcolor,
      fontWeight:fontWeight,
      fontSize: size,
      
      
    ),
  );
}


