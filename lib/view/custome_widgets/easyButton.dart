import 'package:flutter/material.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';

Widget easyButton(
    {String? text,
    FontWeight? fontWeight,
    double? bordRadius,
    context,
    borderColor,
    image,
    bordersideWidth,
    void Function()? onpressed,
    MaterialStateProperty<Color?>? bgColor,
    textcolor}) {
  Orientation orientation = MediaQuery.of(context).orientation;
  const landScapeMode = Orientation.landscape;
  final width = MediaQuery.of(context).size.width;
  final hight = MediaQuery.of(context).size.height;
  return SizedBox(
    width: width * .90,
    height: orientation == landScapeMode ? hight * .1 : hight * .07,
    child: ElevatedButton(
      onPressed: onpressed,
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        side: MaterialStateProperty.all(BorderSide(
            color: borderColor ?? black, width: bordersideWidth ?? 0)),
        backgroundColor: bgColor,
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(bordRadius ?? 10))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
              // width: MediaQuery.of(context).size.width * .05,
              ),
          customeText(
              text: text,
              textcolor: textcolor,
              size: 22,
              fontWeight: fontWeight ?? FontWeight.w600),
          image ?? const SizedBox()
        ],
      ),
    ),
  );
}
