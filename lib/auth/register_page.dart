import 'dart:convert';

import 'package:broker/auth/login_page.dart';
import 'package:broker/components/snack_bar.dart';
import 'package:broker/constants.dart';
import 'package:broker/custom_widgets/custom_button.dart';
import 'package:broker/custom_widgets/custom_text_field.dart';
import 'package:broker/custom_widgets/text_title_auth.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:broker/helper/api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = "RegisterID";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userFirstName = TextEditingController();
  TextEditingController userLastName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userPhoneNumber = TextEditingController();
  TextEditingController userPasswordConfirmation = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              children: [
                const Image(height: 70, image: AssetImage(Constants.logo)),
                const SizedBox(
                  height: 10,
                ),
                const Center(child: TextTitleAuth(title: "إنشاء حساب")),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: CustomTextField(
                      controller: userFirstName,
                      labelText: "الأسم الأول",
                      prefixIcon: Icons.person,
                      inputkeyboardType: TextInputType.text,
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: CustomTextField(
                          controller: userLastName,
                          inputkeyboardType: TextInputType.text,
                          labelText: "الأسم الأخير",
                          prefixIcon: Icons.person),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: userPhoneNumber,
                    inputkeyboardType: TextInputType.number,
                    labelText: "رقم الهاتف",
                    hintText: "أدخل رقم هاتفك المحمول",
                    prefixIcon: Icons.phone_enabled),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: userEmail,
                    inputkeyboardType: TextInputType.emailAddress,
                    labelText: "البريد الإلكتروني",
                    hintText: " أدخل بريدك الإلكتروني",
                    prefixIcon: Icons.email),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: userPassword,
                    inputkeyboardType: TextInputType.visiblePassword,
                    labelText: "كلمة المرور",
                    hintText: " أدخل كلمة المرور الخاصة بك",
                    prefixIcon: Icons.lock_person),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: userPasswordConfirmation,
                    inputkeyboardType: TextInputType.visiblePassword,
                    labelText: "تأكيد كلمة المرور",
                    hintText: "أعد كتابة كلمة المرور",
                    prefixIcon: Icons.lock_person),
                const SizedBox(height: 20),
                Center(
                    child: CustomButton(
                  text: "إنشاء حساب",
                  width: 220,
                  fun: () async {
                    isLoading = true;
                    setState(() {});
                    if (formKey.currentState!.validate()) {
                      if (userPassword.text == userPasswordConfirmation.text) {
                        try {
                          UserService userService = UserService();
                          dynamic result = await userService.registerUser(
                            firstName: userFirstName.text,
                            lastName: userLastName.text,
                            phone: userPhoneNumber.text,
                            email: userEmail.text,
                            password: userPassword.text,
                          );
                          if (result == "success") {
                            CustomSnackBar.showSnackBar(
                                context,
                                "تم إنشاء الحساب بنجاح , قم بتسجيل الدخول",
                                true);
                            Navigator.of(context)
                                .pushReplacementNamed(LoginPage.id);
                          } else {
                            CustomSnackBar.showSnackBar(context, result, true);
                          }
                        } catch (e) {
                          print("ewwqqqew wqqqqqqqq ${e.toString()}");

                          if (context.mounted) {
                            CustomSnackBar.showSnackBar(
                                context, e.toString(), false);
                          }
                        }
                      } else {
                        CustomSnackBar.showSnackBar(
                            context, "لا يوجد تطابق بكلمة المرور", false);
                      }
                    } else {
                      CustomSnackBar.showSnackBar(
                          context, "لأنشاء حساب عليك ملئ جميع الحقول ", false);
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("هل تملك حساب ؟ ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cairo",
                          color: Color(0xff7D7D7D),
                          shadows: [
                            Shadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(3, 3))
                          ],
                        )),
                    TextButton(
                      child: const Text("تسجيل دخول",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Cairo",
                            color: Constants.KprimaryColor,
                            shadows: [
                              Shadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(3, 3)),
                            ],
                          )),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginPage.id);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




//   Future<UserCredential> userRegister() {
//     return FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: userEmail.text,
//       password: userPassword.text,
//     );
//   }



// CustomButton(
//                   text: "إنشاء حساب",
//                   width: 220,
//                   fun: () async {
//                     isLoading = true;
//                     setState(() {});
//                     if (formKey.currentState!.validate()) {
//                       if (userPassword.text == userPasswordConfirmation.text) {
//                         try {
//                           UserService userService = UserService();
//                           dynamic response = await userService.registerUser(
//                               firstName: userFirstName.text,
//                               lastName: userLastName.text,
//                               phone: userPhoneNumber.text,
//                               email: userEmail.text,
//                               password: userPassword.text);

//                           // await userRegister();
//                           // if (context.mounted) {
//                           //   showDialog(
//                           //     context: context,
//                           //     barrierDismissible: false,
//                           //     builder: (context) => AlertDialog(
//                           //       title: const Text(
//                           //           "تم إرسال رابط لبريدك الإلكتروني  , إذهب  لبريدك الإلكتروني وقم بتأكيد الحساب من خلال الضغط على الرابط ومن ثم قم بتسجيل الدخول"),
//                           //       actions: [
//                           //         ElevatedButton(
//                           //             onPressed: () {
//                           //               FirebaseAuth.instance.currentUser!
//                           //                   .sendEmailVerification();
//                           //               Navigator.of(context).pop();
//                           //               Navigator.of(context)
//                           //                   .pushReplacementNamed(LoginPage.id);
//                           //             },
//                           //             child: const Text("تحقق")),
//                           //       ],
//                           //     ),
//                           //   );
//                           // }
//                           // if (FirebaseAuth
//                           //     .instance.currentUser!.emailVerified) {
//                           if (context.mounted) {
//                             Navigator.of(context)
//                                 .pushReplacementNamed(HomePage.id);
//                           }
//                           // }
//                         } catch (e) {
//                           print(e.toString());
//                           if (context.mounted) {
//                             CustomSnackBar.showSnackBar(
//                                 context, e.toString(), false);
//                           }
//                         }
//                       } else {
//                         CustomSnackBar.showSnackBar(
//                             context, "لا يوجد تطابق بكلمة المرور", false);
//                       }
//                     } else {
//                       CustomSnackBar.showSnackBar(
//                           context, "لأنشاء حساب عليك ملئ جميع الحقول ", false);
//                     }
//                     isLoading = false;
//                     setState(() {});
//                   },
//                 )),