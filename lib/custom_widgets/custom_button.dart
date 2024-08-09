import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.fun,
  });
  final String text;
  final double width;
  final VoidCallback fun;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(blurRadius: 7, color: Colors.black26, offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(colors: [
          Color(0xffFEAB89),
          Color(0xffF98951),
        ]),
      ),
      child: ElevatedButton(
        onPressed: fun,
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            minimumSize: Size(width, 60),
          ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo"),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    required this.text,
    required this.fun,
  });
  final String text;
  final VoidCallback fun;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // padding: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: const Color(0xffEFF3F2).withOpacity(0.9),

        boxShadow: const [
          BoxShadow(blurRadius: 7, color: Colors.black38, offset: Offset(0, 0)),
        ],
        borderRadius: BorderRadius.circular(22),

        // gradient: LinearGradient(colors: [
        //   Colors.grey.shade400,
        //   Colors.grey.shade600,
        // ]),
      ),
      child: ElevatedButton(
        onPressed: fun,
        style: ElevatedButton.styleFrom(
          // backgroundColor: Colors.black12,

          // shadowColor: Colors.transparent,
          // backgroundColor: Constants.KtitleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(double.infinity, 70),
          maximumSize: const Size(double.infinity, 70),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 24,
              color: Constants.KprimaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo"),
        ),
      ),
    );
  }
}

class CustomButton3 extends StatelessWidget {
  const CustomButton3({
    super.key,
    required this.text,
    required this.fun,
    required this.primaryColor,
  });
  final String text;
  final VoidCallback fun;
  final bool primaryColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 45),
            elevation: 5,
            backgroundColor: primaryColor ? Constants.KprimaryColor : null,
          ),
          onPressed: fun,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: primaryColor ? Colors.white : Constants.KprimaryColor,
            ),
          )),
    );
  }
}
