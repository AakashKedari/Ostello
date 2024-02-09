import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostello/app/data/profile_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeController _controller = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
            () => SizedBox(
                  height: 191,
                  width: Get.width,
                  child:
                  _controller.locallySavedCoverImage.value == '' ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () async  {
                            if (_controller.locallySavedCoverImage.value == ''){
                              _controller.pickCoverImageAndSave();
                            }
                            else{
                              _controller.locallySavedImage.value = '';
                              SharedPreferences prefs = await  SharedPreferences.getInstance();
                              prefs.setString('SavedCoverImage', '');
                            }
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Color(0xff7329D8),
                          )),
                      const Text(
                        'Add Institute Cover',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                          width: 265,
                          child: Text(
                            'Browser your Gallery or take a picture from the phone Camera to Upload',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 14, color: Color(0xff848485)),
                          )),
                    ],
                  ) : Image.file(File(_controller.locallySavedCoverImage.value))),
            ),
            Container(
              height: 1580,
              width: Get.width,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 3), // Offset from the border
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(() =>  InkWell(
                            onTap: () async {
                              if (_controller.locallySavedImage.value == ''){
                                _controller.pickImageAndSave();
                              }
                              else{
                                _controller.locallySavedImage.value = '';
                                SharedPreferences prefs = await  SharedPreferences.getInstance();
                                prefs.setString('SavedImage', '');
                              }
                            },
                            child: ProfilePic())),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Aakash Institute',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                            Text('------')
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                      height: 710,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffD3ACFF),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/blue_tick.png',
                              height: 144,
                              width: 144,
                            ),
                            const Text(
                              'Become a Verified OstelloAI  Institute!',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '₹3500',
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text('/year')
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  child:
                                      PriceButton('₹2500', 'Changes to verify'),
                                ),
                                InkWell(
                                  child: PriceButton('₹1000', 'In your wallet'),
                                ),
                              ],
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    'when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            ExtendedButton('Subscibe to Ostello Now',
                                const Color(0xff7D23E0), Colors.white)
                          ]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      height: 508,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffEEEEEE),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset('assets/images/emoji.png'),
                              const Column(
                                children: [
                                  Text(
                                    '100% Profile Completed!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16),
                                  ),
                                  Text('5 of 5 tasks complete')
                                ],
                              )
                            ],
                          ),
                          const Text(
                            'Use this personalized guide to get your coaching centre up and running!',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 14),
                          ),
                          ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 48,
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.check_circle,
                                      color: Color(0xff7D23E0),
                                    ),
                                    tileColor: Colors.blue,
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    title: Text(
                                      profileData[index],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount: 5),
                          ExtendedButton("You're all set",
                              const Color(0xffECFFE3), Color(0xff10B921))
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: const Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(
                        children: [
                          Positioned(
                              right: 0,
                              child: Image.asset('assets/images/tricolor.png')),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Double Dhamaka Offer!',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 215,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Accept payment on Google Pay for Business QR to win weekly cashbacks!',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffADADAD)),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Check Out!',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w800),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Container PriceButton(String price, String descrip) {
    return Container(
      height: 64,
      width: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Color(0xffECD8Ff)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            price,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),
          Text(
            descrip,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          )
        ],
      ),
    );
  }

  Container ProfilePic() {
    return Container(
      height: 108,
      width: 108,
      decoration: BoxDecoration(
          color: const Color(0xffF3F7FF),
          borderRadius: BorderRadius.circular(20)),
      child: _controller.locallySavedImage.value == '' ?

      Stack(
        children: [
          Center(
            child: Image.asset('assets/images/shop.png'),
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
      ) : Stack(
        children: [
          Center(
            child: Image.file(File(_controller.locallySavedImage.value)),
          ),
          Positioned(
              right: 0,
              top: -5,
              child: Center(
                  child: Icon(
                    Icons.cancel,
                    color: Color(0xff7D23E0),
                    size: 30,
                  )))
        ],
      )

      ,
    );
  }

  InkWell ExtendedButton(String text, Color bgColor, Color textColor) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 49,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(8)),
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor),
            ),
          )),
    );
  }
}
