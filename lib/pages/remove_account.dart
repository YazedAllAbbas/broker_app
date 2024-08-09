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

class RemoveAccount extends StatefulWidget {
  const RemoveAccount({super.key});

  @override
  State<RemoveAccount> createState() => _RemoveAccountState();
}

class _RemoveAccountState extends State<RemoveAccount> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  bool remeber = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 26, right: 26, top: 20),
              children: [
                const Icon(
                  Icons.delete_outline,
                  size: 120,
                  color: Constants.KprimaryColor,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: TextTitleAuth(
                    title: "حذف الحساب",
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
                const Spacer(),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: CustomButton(
                    text: "حذف",
                    width: 220,
                    fun: () async {
                      isLoading = true;
                      setState(() {});
                      if (formKey.currentState!.validate()) {
                        try {
                          UserService userService = UserService();
                          String result = await userService.removeAccount(
                            email: userEmail.text,
                            password: userPassword.text,
                          );

                          if (result == "success") {
                            Navigator.of(context)
                                .pushReplacementNamed(HomePage.id);
                            CustomSnackBar.showSnackBar(
                                context, "تم حذف الحساب", false);
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
                        CustomSnackBar.showSnackBar(
                            context, " عليك ملئ جميع الحقول ", false);
                      }
                      isLoading = false;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        )));
  }
}
