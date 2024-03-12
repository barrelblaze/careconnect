// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/model/other_models/login_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custom_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';
import 'package:orphanagemanagement/view/modules/orphanage/login_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/sign_page_2.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';

class SignPageOrphanage extends StatelessWidget {
  SignPageOrphanage({super.key});
  FirebaseAuths firebaseAuths = FirebaseAuths();

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    const landScapeMode = Orientation.landscape;
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPageOrphanage())), 
            icon: Icon(Icons.keyboard_backspace_sharp))
          ],
        ),
      ),
      body: SizedBox(
        height: hight,
        width: width,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(50),
                customeText(
                    text: "Careconnect", size: 36, fontWeight: FontWeight.w500),
                Column(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customeTextField(
                        hintText: "Your Email Id",
                        radius: 30,
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Email Id";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Enter Correct Email Address";
                          }
                          return null;
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: customeText(
                              text: "Create username", textcolor: appThemeGrey),
                        ),
                        customeTextField(
                            hintText: "Username",
                            radius: 30,
                            controller: userNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your Username Id";
                              }
                              return null;
                            }),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                         padding: const EdgeInsets.only(left: 20),
                          child: customeText(
                              text: "Create password", textcolor: appThemeGrey),
                        ),
                        customeTextField(
                            hintText: "Password",
                            radius: 30,
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter a Password";
                              }
                              if (value.length < 6) {
                                return "Password Should Minimum 6 Digit";
                              }
                              return null;
                            }),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                          child: customeText(
                              text: "Re-enter password",
                              textcolor: appThemeGrey),
                        ),
                        customeTextField(
                            hintText: "Password",
                            radius: 30,
                            controller: rePasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Confirm Your Password";
                              }
                              if (passwordController.text !=
                                  rePasswordController.text) {
                                return "Enter Correct  Password";
                              }
                              return null;
                            }),
                      ],
                    ),
                  ],
                ),
                Gap(20),
                SizedBox(
                  width: width * .45,
                  height:
                      orientation == landScapeMode ? hight * .08 : hight * .05,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                 await       Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NextSignPageOrphanage(
                                      email: emailController,
                                      // uid: firebaseAuths.uid!,
                                      passwordController: passwordController,
                                    )),
                            (route) => false);

                        // Get.to(NextSignPageOrphanage(
                        //   email: emailController,
                        //   uid: firebaseAuths.uid!,
                        //   passwordController: passwordController,
                        // ));
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(black),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    child:
                        customeText(text: "Next", textcolor: white, size: 20),
                  ),
                ),
                const Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customeText(
                        text: "Already have an account ?",
                        size: 14,
                        fontWeight: FontWeight.w600),
                    customeButton(
                        onpressed: () {
                          Get.to(LoginPageOrphanage());
                        },
                        bordersideWidth: 2,
                        context: context,
                        text: "Login",
                        textcolor: black,
                        bgColor: white)
                  ],
                ),
                TextButton(
                    onPressed: () {
                      //to do termsa and condition..
                    },
                    child: Text(
                      "Terms & Conditions ",
                      style: GoogleFonts.jua(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: black,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
