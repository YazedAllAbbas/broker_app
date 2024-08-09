import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

class ListTileDrawer extends StatelessWidget {
  const ListTileDrawer({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onTap,
  });
  final String title;
  final IconData leadingIcon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: SizedBox(
        height: 70,
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(
                fontFamily: "Cairo",
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Constants.KtitleColor),
          ),
          leading: Icon(
            leadingIcon,
            size: 20,
            color: Constants.KprimaryColor,
          ),
        ),
      ),
    );
  }
}
