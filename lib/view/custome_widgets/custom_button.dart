import 'package:flutter/material.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';

Widget customeButton(
    {String? text,
    FontWeight? fontWeight,
    required context,
    image,
    double? bordersideWidth,
    void Function()? onpressed,
    Color? bgColor,
    textcolor}) {
  Orientation orientation = MediaQuery.of(context).orientation;
  const landScapeMode = Orientation.landscape;
  final hight = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return SizedBox(
    width: width * .90,
    height: orientation == landScapeMode ? hight * .08 : hight * .06,
    child: ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          side: BorderSide(color: black, width: bordersideWidth ?? 0.0),
          backgroundColor: bgColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image ?? const SizedBox(),
          customeText(
              text: text,
              textcolor: textcolor,
              size: 20,
              fontWeight: fontWeight ?? FontWeight.w600)
        ],
      ),
    ),
  );
}
