import 'package:broker/constants.dart';
import 'package:broker/pages/add_real_eastate_peages/choose_type_real_eastate_page.dart';
import 'package:broker/pages/add_wanted_pages/add_wanted_page.dart';
import 'package:broker/pages/wanted_page.dart';
import "package:flutter/material.dart";
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'my_drawer.dart';
import 'pages/real_esatate_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "HomeID";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  // ignore: prefer_final_fields
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  // void _onPageChanged(int index) {
  //   setState(() {
  //     _page = index;
  //   });
  // }

  // void _onTap(int index) {
  //   _bottomNavigationKey.currentState?.setPage(index);
  // }

  void updateList() {
    setState(() {}); // تحديث الصفحة عندما يتم إضافة عنصر جديد
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      RealEsatatePage(
        updateRealEstateList: updateList,
      ),
      WantedPage(updateWantedList: updateList), // تمرير دالة التحديث
      const ChooseTypeRealEastatePage(),
      const AddWantedPage(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          getTitlePage(_page),
          style: const TextStyle(
              fontFamily: "Cairo",
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: Constants.KprimaryColor),
        ),
        actions: [
          Image.asset(
            height: 55,
            width: 70,
            Constants.logo,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 6,
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black54, size: 35),
        backgroundColor: Colors.white,
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: const [
          CurvedNavigationBarItem(
              child: Icon(Icons.home_outlined),
              label: 'العقارات',
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          CurvedNavigationBarItem(
              child: Icon(Icons.assignment_outlined),
              label: "مطلوب",
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          CurvedNavigationBarItem(
              child: Icon(Icons.add_home_work_outlined),
              label: 'إضافة عقار',
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          CurvedNavigationBarItem(
              child: Icon(Icons.add_card_sharp),
              label: "إضافة طلب",
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            print(index);
          });
        },
        color: Constants.KprimaryColor,
        buttonBackgroundColor: Constants.KprimaryColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 280),
      ),
      body: pages.elementAt(_page),
    );
  }

  String getTitlePage(int index) {
    if (index == 1) {
      return "مطلوب";
    } else if (index == 2) {
      return "إضافة عقار";
    } else if (index == 3) {
      return "إضافة طلب";
    }
    return "العقارات";
  }
}
