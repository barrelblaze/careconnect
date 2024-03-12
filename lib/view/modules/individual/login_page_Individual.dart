import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custom_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';
import 'package:orphanagemanagement/view/modules/individual/signup_page.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';

class LoginPageIndividual extends StatelessWidget {
  LoginPageIndividual({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuths firebaseAuths = FirebaseAuths();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // color: Colors.red,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(50),
                customeText(
                    text: "Careconnect", size: 36, fontWeight: FontWeight.w500),
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/login_page.png"))),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ),
                const Gap(100),
                customeGradientButtom(
                    onpressed: () {
                      if (_formKey.currentState!.validate()) {
                        firebaseAuths.login(emailController.text,
                            passwordController.text, context, 1);
                      }
                    },
                    context: context,
                    text: "Login",
                    textcolor: white,
                    bgColor: const MaterialStatePropertyAll(black)),
                const Gap(60),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customeText(
                        text: "Don't have an account ?",
                        size: 14,
                        fontWeight: FontWeight.w600),
                    customeButton(
                        bordersideWidth: 1.5,
                        onpressed: () {
                          Get.to(SignPageIndividual());
                        },
                        context: context,
                        text: "Sign Up",
                        textcolor: black,
                        bgColor: white)
                  ],
                ),
                const Gap(20),
                // customeText(text: "Or login using"),
                // const Gap(20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         firebaseAuths.signWithGoogle(context, 1);
                //       },
                //       child: Container(
                //         decoration: BoxDecoration(
                //             border: Border.all(color: grey600!),
                //             borderRadius: BorderRadius.circular(50)),
                //         child: Padding(
                //           padding: const EdgeInsets.all(6.0),
                //           child: Image.asset(
                //             "assets/ggogle.png",
                //             scale: 15,
                //           ),
                //         ),
                //       ),
                //     ),
                //     const Gap(10),
                //     InkWell(
                //       onTap: () {
                //         firebaseAuths.signInWithFacebook(context, 1);
                //       },
                //       child: Container(
                //         decoration: BoxDecoration(
                //             border: Border.all(color: grey600!),
                //             borderRadius: BorderRadius.circular(50)),
                //         child: Padding(
                //           padding: const EdgeInsets.all(6.0),
                //           child: Image.asset(
                //             "assets/facebook.png",
                //             scale: 15,
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
