import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ostello/app/modules/home/controllers/home_controller.dart';
import 'data/constants.dart';
import 'data/profile_data.dart';

HomeController _controller = HomeController();

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

Container SubContainer() {
  return Container(
    padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
    height: 710,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xffD3ACFF), width: 1),
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xff7D23E0).withOpacity(0.1),
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
          Text(
            'Become a Verified OstelloAI Institute!',
            style: titleMedium?.copyWith(fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₹3500',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
              ),
              Text('/year')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: PriceButton(
                  '₹2500',
                  'Changes to verify',
                ),
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
                leading: Text( '\u2022',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.55,
                  ),),
                title: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              ListTile(
                leading: Text( '\u2022',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.55,
                  ),),
                title: Text(
                  'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              ListTile(
                leading: Text( '\u2022',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.55,
                  ),),
                title: Text(
                  'when an unknown printer took a galley ',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          ExtendedButton('Subscibe to Ostello Now', const Color(0xff7D23E0),
              Colors.white)
        ]),
  );
}


Container ProfilePic() {
  return Container(
    height: 108,
    width: 108,
    decoration: BoxDecoration(
        color: const Color(0xffF3F7FF),
        borderRadius: BorderRadius.circular(20)),
    child: _controller.locallySavedImage.value == ''
        ? Stack(
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
    )
        : Stack(
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
    ),
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
            style: bodyMedium?.copyWith(color: textColor),
          ),
        )),
  );
}

Container ProfileContainer() {
  return Container(
    padding: const EdgeInsets.all(16.0),
    height: 508,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey,width: 0.2),
      borderRadius: BorderRadius.circular(12),
      color: const Color.fromARGB(1, 238, 238, 238),
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
                      fontSize: 16,
                      fontFamily: 'Avenir'),
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
                    style: bodySmall?.copyWith(
                        letterSpacing: -0.5, fontWeight: FontWeight.w500,),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 5),
        ExtendedButton(
            "You're all set", const Color(0xffECFFE3), Color(0xff10B921))
      ],
    ),
  );
}

Container OfferContainer() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
        color: Color.fromARGB(1, 238, 238, 238),
        border: Border.all(color: Colors.grey,width: 0.2),
        borderRadius: BorderRadius.circular(12)),
    child: Stack(
      children: [
        Positioned(
            right: 0, child: Image.asset('assets/images/tricolor.png')),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Double Dhamaka Offer!',
              style: titleMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 215,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Accept payment on Google Pay for Business QR to win weekly cashbacks!',
                          style:
                          bodyMedium?.copyWith(color: Color(0xffADADAD))),
                      TextButton(
                          autofocus: true,
                          onPressed: () {},
                          child: Text(
                            'Check Out!',
                            style: titleSmall?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: const Color(0xff7329D8)),
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
  );
}
