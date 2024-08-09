import 'package:broker/components/snack_bar.dart';
import 'package:broker/constants.dart';
import 'package:broker/custom_widgets/custom_text_field.dart';
import 'package:broker/custom_widgets/custom_button.dart';
import 'package:broker/auth/register_page.dart';
import 'package:broker/helper/api.dart';
import 'package:broker/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../custom_widgets/text_title_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = "LoginID";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  bool remeber = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 26, right: 26, top: 20),
              children: [
                Image.asset(
                  "assets/images/BrokerOnlineAppLogo.png",
                  height: 140,
                ),
                SizedBox(
                  height: screenWidth < 450 ? 50 : 20,
                ),
                const Center(
                  child: TextTitleAuth(
                    title: "تسجيل الدخول",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    controller: userEmail,
                    inputkeyboardType: TextInputType.emailAddress,
                    labelText: "البريد الإلكتروني",
                    hintText: " أدخل بريدك الإلكتروني",
                    prefixIcon: Icons.email),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    controller: userPassword,
                    inputkeyboardType: TextInputType.visiblePassword,
                    labelText: "كلمة المرور",
                    hintText: " أدخل كلمة المرور الخاصة بك",
                    prefixIcon: Icons.lock_person),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        // materialTapTargetSize: ,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                          // side: BorderSide(width: 4,color: Colors.yellow)
                        ),
                        value: remeber,
                        onChanged: (value) {
                          setState(() {
                            remeber = value!;
                          });
                        },
                        activeColor: const Color(0xffF98951),
                      ),
                    ),
                    const Text("تذكرني",
                        style: TextStyle(
                          fontSize: 15,
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
                    const Spacer(),
                    TextButton(
                      child: const Text(
                        "هل نسيت كلمة المرور ؟",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cairo",
                          color: Color(0xffF98951),
                          shadows: [
                            Shadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(3, 3))
                          ],
                        ),
                      ),
                      onPressed: () {
                        if (userEmail.text.isNotEmpty) {
                          try {
                            FirebaseAuth.instance
                                .sendPasswordResetEmail(email: userEmail.text);
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => AlertDialog(
                                title: const Text(
                                    "لقد تم إرسال رابط من أجل تعيين كلمة مرور جديدة الرجاء الذهاب والضغط على الرابط ومن ثم تعيين كلمة المرور "),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("تم")),
                                ],
                              ),
                            );
                          } catch (e) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => AlertDialog(
                                title: const Text(
                                    "الرجاء التأكد من أن البريد اللذي قمت بأدخاله صحيح"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("تم")),
                                ],
                              ),
                            );
                          }
                        } else {
                          CustomSnackBar.showSnackBar(
                              context, "الرجاء إضافة بريدك الإلكتروني", false);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: CustomButton(
                    text: "تسجيل دخول",
                    width: 220,
                    fun: () async {
                      isLoading = true;
                      setState(() {});
                      if (formKey.currentState!.validate()) {
                        try {
                          UserService userService = UserService();
                          String result = await userService.loginUser(
                            email: userEmail.text,
                            password: userPassword.text,
                          );

                          if (result == 'success') {
                            Navigator.of(context)
                                .pushReplacementNamed(HomePage.id);
                          } else {
                            if (context.mounted) {
                              CustomSnackBar.showSnackBar(
                                  context, result, false);
                            }
                          }
                        } catch (e) {
                          print("Login error: ${e.toString()}");

                          if (context.mounted) {
                            CustomSnackBar.showSnackBar(
                                context, "خطأ غير متوقع", false);
                          }
                        }
                      } else {
                        CustomSnackBar.showSnackBar(context,
                            "لتسجيل الدخول عليك ملئ جميع الحقول ", false);
                      }
                      isLoading = false;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("لا تملك حساب ؟ ",
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
                      child: const Text("أنشئ حساب الآن",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Cairo",
                            color: Constants.KprimaryColor,
                            shadows: [
                              Shadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(3, 3))
                            ],
                          )),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterPage.id);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> loginUser() {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: userEmail.text,
      password: userPassword.text,
    );
  }
}
//  try {
//                           await loginUser();
//                           if (FirebaseAuth
//                               .instance.currentUser!.emailVerified) {
//                             if (context.mounted) {
//                               Navigator.of(context)
//                                   .pushReplacementNamed(HomePage.id);
//                               _showSnackBar(context,
//                                   "تم تسجيل الدخول بنجاح , أهلاً وسهلاً", true);
//                             }
//                           }
//                         } on FirebaseAuthException catch (e) {
//                           if (e.code == 'user-not-found') {
//                             if (context.mounted) {
//                               _showSnackBar(
//                                   context,
//                                   "لا يوجد مستخدم بهذا البريد اللإلكتروني",
//                                   false);
//                             }
//                             print(
//                                 '********************************No user found for that email.');
//                           } else if (e.code == 'wrong-password') {
//                             if (context.mounted) {
//                               _showSnackBar(
//                                   context, "كلمة السر غير صحيحة", false);
//                             }
//                             print(
//                                 '*************************Wrong password provided for that user.');
//                           }
//                         }
//                       } 