import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custom_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';
import 'package:orphanagemanagement/view/modules/orphanage/main_page_orphanage.dart';
import 'package:orphanagemanagement/view/modules/orphanage/sign_page.dart';
import 'package:orphanagemanagement/view/modules/user_selection_page.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';

class LoginPageOrphanage extends StatelessWidget {
  LoginPageOrphanage({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuths firebaseAuths = FirebaseAuths();

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    const landScapeMode = Orientation.landscape;
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var singleChildScrollView = SingleChildScrollView(
      child: SizedBox(
        height: orientation == landScapeMode ? width : hight,
        width: width,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(100),
                customeText(
                    text: "Careconnect", size: 36, fontWeight: FontWeight.w500),
                Gap(70),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customeTextField(
                        hintText: "Your Email Id",
                        radius: 30,
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Registerd Email Id";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Enter Correct Email Address";
                          }
                          return null;
                        }),
                        Gap(30),
                    customeTextField(
                        hintText: "Password",
                        radius: 30,
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Password";
                          }
                          return null;
                        }),
                  ],
                ),
                Gap(100),
                customeButton(
                    onpressed: () {
                      if (_formKey.currentState!.validate()) {
                        firebaseAuths.login(emailController.text,
                            passwordController.text, context, 0);
                      }
                    },
                    context: context,
                    text: "Login",
                    textcolor: white,
                    bgColor: black),
                Gap(30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customeText(
                        text: "Don't have an account ?",
                        size: 14,
                        fontWeight: FontWeight.w600),
                    customeButton(
                        bordersideWidth: 2,
                        onpressed: () {
                          Get.to(SignPageOrphanage());
                        },
                        context: context,
                        text: "Sign Up",
                        textcolor: black,
                        bgColor: white)
                  ],
                ),
                Gap(hight*.07),
                // Gap(200),
                TextButton(
                    onPressed: () {
                      Get.to(UserSelectionPageIndividualAndOrganization());

                      //to do go to user login option
                    },
                    child: Text(
                      "User login ",
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
    return Scaffold(
      body: singleChildScrollView,
    );
  }
}
