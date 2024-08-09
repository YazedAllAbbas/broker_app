import 'dart:async';

import 'package:broker/constants.dart';
import 'package:broker/models/wanted_model.dart';
import 'package:broker/service/wanted_server.dart';
// import 'package:broker/service/wanted_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WantedPage extends StatefulWidget {
  final Function updateWantedList;
  const WantedPage({super.key, required this.updateWantedList});

  @override
  State<WantedPage> createState() => _WantedPageState();
}

class _WantedPageState extends State<WantedPage> {
  @override
  void initState() {
    super.initState();
    // Initialize the list in initState to ensure proper initialization
    // allWanted = WantedService().getAllWanted();
  }

  // Function to update allWanted when the data changes
  void updateWantedList() {
    setState(() {
      // allWanted = WantedService.getAllWanted();
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WantedService().getAllWanted(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("An error occurred"));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 7,
                        color: Colors.black26,
                        offset: Offset(0, 0))
                  ],
                  color: const Color(0xffEFF3F2).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(22)),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 8),
              margin: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "مطلوب عقار ",
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        snapshot.data![index].type,
                        style: const TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        " في ",
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        snapshot.data![index].city!,
                        style: const TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
                        Icons.place_outlined,
                        size: 17,
                        color: Constants.KtitleColor,
                      ),
                      const Text("منطقة  ",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 14,
                            color: Constants.KtitleColor,
                            fontWeight: FontWeight.w500,
                          )),
                      Text(snapshot.data![index].region,
                          style: const TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 14,
                            color: Constants.KprimaryColor,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
                        Icons.price_change_rounded,
                        size: 16,
                        color: Constants.KtitleColor,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text("الميزانية",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 13,
                            color: Constants.KtitleColor,
                            fontWeight: FontWeight.w500,
                          )),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(Constants.formatPrice(snapshot.data![index].budget),
                          style: const TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 14,
                            color: Constants.KprimaryColor,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(width: 3),
                      const Text("ل.س",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 11,
                            color: Constants.KtitleColor,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    snapshot.data![index].descriptionOfWanted,
                    style: const TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 17,
                      color: Constants.KtitleColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 5, top: 3, right: 3),
                        child: Icon(
                          Icons.timer_outlined,
                          size: 18,
                          color: Constants.KprimaryColor,
                        ),
                      ),
                      Text(
                        snapshot.data![index].date,
                        style: const TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () =>
                              _makePhoneCall(snapshot.data![index].phoneNumber),
                          child: const Row(
                            children: [
                              Text(
                                "للتواصل",
                                style: TextStyle(
                                  fontFamily: "Cairo",
                                  fontSize: 18,
                                  color: Constants.KprimaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.add_call,
                                size: 22,
                                color: Constants.KprimaryColor,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text("No data found"));
        }
      },
    );
  }
}
