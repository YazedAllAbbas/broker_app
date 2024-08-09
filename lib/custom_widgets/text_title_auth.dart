import 'package:flutter/material.dart';

class TextTitleAuth extends StatelessWidget {
  const TextTitleAuth({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Text(title ,style:const TextStyle(fontSize: 34,fontWeight:FontWeight.bold,fontFamily: "Cairo",color: Color(0xff818181),
      shadows: [Shadow(color: Colors.black12,blurRadius:2,offset: Offset(2, 2) )],
    ),
    );
  }
}