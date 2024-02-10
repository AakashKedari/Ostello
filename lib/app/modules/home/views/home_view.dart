import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ostello/app/data/constants.dart';

import 'package:ostello/app/data/profile_data.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../customWidgets.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _controller = Get.put(HomeController());

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            /* The upper SizedBox which will have Cover Image */

            Obx(
              () => SizedBox(
                  height: 191,
                  width: Get.width,
                  child: _controller.locallySavedCoverImage.value == ''
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  if (_controller
                                          .locallySavedCoverImage.value ==
                                      '') {
                                    _controller.pickCoverImageAndSave();
                                  } else {
                                    _controller.locallySavedImage.value = '';
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('SavedCoverImage', '');
                                  }
                                },
                                icon: const Icon(
                                  Icons.add_circle_sharp,
                                  color: Color(0xff7329D8),
                                  size: 34,
                                )),
                            Text(
                              'Add Institute Cover',
                              style: titleSmall?.copyWith(
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                                width: 265,
                                child: Text(
                                  'Browser your Gallery or take a picture from the phone Camera to Upload',
                                  textAlign: TextAlign.center,
                                  style: bodySmall,
                                )),
                          ],
                        )
                      : Image.file(
                          File(_controller.locallySavedCoverImage.value))),
            ),
            Container(
              height: 1580,
              width: Get.width,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, // Shadow color
                      spreadRadius: 0, // Spread radius
                      blurRadius: 28, // Blur radius
                      offset: Offset(0, -5), // Offset from the border
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /* First Row containing Profile pic and Name*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(() => InkWell(
                            onTap: () async {
                              if (_controller.locallySavedImage.value == '') {
                                _controller.pickImageAndSave();
                              } else {
                                _controller.locallySavedImage.value = '';
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('SavedProfileImage', '');
                              }
                            },
                            child: ProfilePic())),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Aakash Institute',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                                fontFamily: 'Avenir',
                                color: Color(0xff181818),
                                letterSpacing: -0.5,
                              ),
                            ),
                            Text('------')
                          ],
                        )
                      ],
                    ),
                    SubContainer(),
                    ProfileContainer(),
                    OfferContainer()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
