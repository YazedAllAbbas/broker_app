import 'package:broker/auth/login_page.dart';
import 'package:broker/components/snack_bar.dart';
import 'package:broker/constants.dart';
import 'package:broker/helper/api.dart';
import 'package:broker/pages/remove_account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components_for_Drawer/list_tile_drawer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Constants.KprimaryColor,
                ),
                accountName: Text("يازد العباس"),
                accountEmail: Text("yazedallabbas01@gmail.com")),
            const SizedBox(
              height: 5,
            ),
            ListTileDrawer(
              leadingIcon: Icons.person,
              onTap: () {},
              title: "عقاراتي",
            ),
            ListTileDrawer(
              leadingIcon: Icons.person,
              onTap: () {},
              title: "إعلاناتي",
            ),
            ListTileDrawer(
              leadingIcon: Icons.person_add_alt,
              onTap: () {},
              title: "دعوة أصدقاء",
            ),
            ListTileDrawer(
              leadingIcon: Icons.delete_outline_outlined,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RemoveAccount(),
                    ));
              },
              title: "حذف الحساب",
            ),
            ListTileDrawer(
              leadingIcon: Icons.info_outline,
              onTap: () {},
              title: "معلومات حول التطبيق",
            ),
            ListTileDrawer(
              leadingIcon: Icons.person,
              onTap: () {},
              title: "معلومات حسابي",
            ),
            ListTileDrawer(
              leadingIcon: Icons.person_remove_alt_1_outlined,
              onTap: () async {
                isLoading = true;
                setState(() {});
                try {
                  UserService userService = UserService();
                  String result = await userService.logoutUser();
                  if (result == 'success') {
                    await FirebaseAuth.instance.signOut();
                    CustomSnackBar.showSnackBar(
                        context, "تم تسجيل الخروج", true);
                    if (context.mounted) {
                      Navigator.of(context).pushReplacementNamed(LoginPage.id);
                    }
                  } else {
                    CustomSnackBar.showSnackBar(
                        context, "خطأ في الخادم", false);
                  }
                } on Exception catch (e) {
                  if (context.mounted) {
                    CustomSnackBar.showSnackBar(context, "خطأغير متوقع", false);
                  }
                }
                isLoading = false;
                setState(() {});
              },
              title: "تسجيل خروج من الحساب",
            ),
            ListTileDrawer(
              leadingIcon: Icons.exit_to_app_rounded,
              onTap: () {
                Navigator.of(context).pop();
              },
              title: "خروج من التطبيق",
            ),
          ],
        ),
      ),
    );
  }
}
