import 'package:broker/constants.dart';
import 'package:broker/custom_widgets/custom_button.dart';
import 'package:broker/auth/login_page.dart';
import 'package:flutter/material.dart';

class StartingPage extends StatelessWidget {
  static String id = "StartingID";
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      Constants.logo,
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 0),
                      child: Image.asset(
                        "assets/images/HoseOnHand.png",
                        height: 320,
                        fit: BoxFit.cover,
                      )),
                ],
              ),
              const Spacer(),
              const Text(
                "  وفر  وقتك",
                style: TextStyle(
                  fontSize: 35,
                  color: Color(0xff778899),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                  shadows: [
                    Shadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(3, 3))
                  ],
                ),
              ),
              const Text(
                "  مع  سمسار  أونلاين",
                style: TextStyle(
                  fontSize: 35,
                  color: Color(0xff778899),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                  shadows: [
                    Shadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(3, 3))
                  ],
                ),
              ),
              const Spacer(flex: 2),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 22),
                  child: CustomButton(
                      text: "ابدأ الآن",
                      width: screenWidth,
                      fun: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginPage.id);
                      })),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
