// ignore_for_file: file_names

import 'dart:convert';
import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

class RealEstateImageBox extends StatefulWidget {
  final List<String> imagePaths;

  const RealEstateImageBox({super.key, required this.imagePaths});

  @override
  State<RealEstateImageBox> createState() => _RealEstateImageBoxState();
}

class _RealEstateImageBoxState extends State<RealEstateImageBox> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 7, color: Colors.black45, offset: Offset(0, 0))
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              )),
          height: 290,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imagePaths.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) => Image.memory(
              base64Decode(widget.imagePaths[index]),
              height: 290,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios,
                color: Colors.white, size: 40),
            onPressed: () {
              if (_currentIndex < widget.imagePaths.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
        Positioned(
          right: 10,
          child: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, color: Colors.white, size: 40),
            onPressed: () {
              if (_currentIndex > 0) {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.imagePaths.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Constants.KprimaryColor
                      : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
