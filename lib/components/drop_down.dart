import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDown extends StatefulWidget {
  DropDown({
    super.key,
    required this.selectedView,
    required this.mylist,
    required this.icon,
    required this.onChanged,
  });
  final List<String> mylist;
  String? selectedView;
  final Icon icon;
  final void Function(String? value)? onChanged;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
        child: DropdownButton(
            value: widget.selectedView,
            iconEnabledColor: Constants.KprimaryColor,
            // iconSize: 25,
            icon: widget.icon,
            items: widget.mylist
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: const TextStyle(
                            shadows: [
                              BoxShadow(blurRadius: 10, color: Colors.black26),
                            ],
                            fontSize: 14,
                            color: Constants.KprimaryColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.bold),
                      ),
                    ))
                .toList(),
            onChanged: widget.onChanged));
  }
}
