import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
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

            Obx(() => SizedBox(
                    height: 191,
                    width: Get.width,
                    child: _controller.imageUrl.value == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    if (_controller.imageUrl.value == null) {
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
                        : Image.network(_controller.imageUrl.value!))
                // Image.file(
                //         File(_controller.locallySavedCoverImage.value))),
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
                        Obx(() =>
                            // ProfilePic()
                            Container(
                              height: 108,
                              width: 108,
                              decoration: BoxDecoration(
                                  color: const Color(0xffF3F7FF),
                                  borderRadius: BorderRadius.circular(20)),
                              child: _controller.profileUrl.value == null
                                  ? Stack(
                                      children: [
                                        Center(
                                          child: Image.asset(
                                              'assets/images/shop.png'),
                                        ),
                                        Positioned(
                                            right: 0,
                                            bottom: 0,
                                            child: Center(
                                                child: Icon(
                                              Icons.add_circle,
                                              color: Color(0xff7D23E0),
                                              size: 30,
                                            )))
                                      ],
                                    )
                                  : Stack(
                                      children: [
                                        Center(
                                            child: Image.network(
                                                _controller.profileUrl.value!)
                                            // Image.file(File(_controller.locallySavedImage.value)),
                                            ),
                                      ],
                                    ),
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(
                              () => SizedBox(
                                height: 100,
                                width: 100,
                                child: AutoSizeText(
                                  _controller.coachingName.value != null
                                      ? _controller.coachingName.value!
                                      : 'Aakash',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22,
                                    fontFamily: 'Avenir',
                                    color: Color(0xff181818),
                                    letterSpacing: -0.5,
                                  ),
                                  minFontSize: 14,
                                  // maxLines: 4,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),

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
