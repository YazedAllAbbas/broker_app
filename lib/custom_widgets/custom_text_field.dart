import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText,
    required this.prefixIcon,
    required this.controller,
    required this.inputkeyboardType,
  });
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final TextInputType? inputkeyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return "لا يمكن ترك الحقل فارغ";
          }
          if ((!value.contains('@') || !value.contains('.')) &&
              widget.inputkeyboardType == TextInputType.emailAddress) {
            return "البريد الإلكتروني المدخل غير صحيح ,أعد كتابته";
          }
          return null;
        },
        controller: widget.controller,
        keyboardType: widget.inputkeyboardType,
        maxLines: 1,
        minLines: 1,
        obscureText: widget.inputkeyboardType == TextInputType.visiblePassword
            ? _obscureText
            : false,
        decoration: InputDecoration(
          isDense: false,
          constraints: const BoxConstraints(minHeight: 110, maxHeight: 110),
          // errorMaxLines: 1,
          // contentPadding: const EdgeInsets.only(bottom: 1),
          suffixIcon: widget.inputkeyboardType == TextInputType.visiblePassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(
                      size: 25,
                      color: const Color(0xff7D7D7D),
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ))
              : null,
          errorStyle: const TextStyle(
              fontSize: 10, fontFamily: "Cairo", fontWeight: FontWeight.bold),
          filled: true,
          fillColor: const Color(0xffEFF1F1).withOpacity(0.8),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
              fontSize: 15, color: Color(0xff7D7D7D), fontFamily: "Cairo"),
          focusColor: Constants.KprimaryColor,
          floatingLabelStyle: const TextStyle(
              color: Constants.KprimaryColor,
              fontSize: 21,
              fontFamily: "Cairo"),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: Constants.KprimaryColor,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              fontSize: 18, color: Color(0xff7D7D7D), fontFamily: "Cairo"),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Constants.KprimaryColor),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 3, color: Color(0xffC3C6C5)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 3, color: Color(0xffC3C6C5)),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 3, color: Color(0xffC3C6C5)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 3, color: Color(0xffC3C6C5)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 3, color: Constants.KprimaryColor),
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldToAddFeatures extends StatelessWidget {
  const CustomTextFieldToAddFeatures({
    super.key,
    required this.controller,
    required this.inputkeyboardType,
  });

  final TextEditingController controller;
  final TextInputType? inputkeyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          return null;
        },
        controller: controller,
        keyboardType: inputkeyboardType,
        maxLines: 1,
        decoration: const InputDecoration(
          focusColor: Constants.KprimaryColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0xffC3C6C5)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0xffC3C6C5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0xffC3C6C5)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0xffC3C6C5)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Constants.KprimaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Constants.KprimaryColor),
          ),
          errorStyle: TextStyle(
            fontSize: 0, // تعيين حجم الخط لأقل ما يمكن
            height: 0, // لتقليل المسافة بين النص وخطأ الرسالة
          ),
        ),
      ),
    );
  }
}
