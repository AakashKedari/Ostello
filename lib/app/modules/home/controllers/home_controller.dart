import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

   var pickedImage = Rx<XFile?>(null);

   var _imageFile = Rx<File?>(null);

   RxString locallySavedImage = ''.obs;

   Future<void> pickImageAndSave() async {
    final imagePicker = ImagePicker();
    pickedImage.value = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage.value != null) {
        _imageFile.value = File(pickedImage.value!.path);
    }

    final appDir = await getApplicationDocumentsDirectory();
    final fileName = 'bg_image.jpg';
    final savedImage = await _imageFile.value!.copy('${appDir.path}/$fileName');
    SharedPreferences prefs =await  SharedPreferences.getInstance();
    prefs.setString('SavedImage', savedImage.path);

     Get.snackbar('Profile Updated', '',titleText: const Center(child:Text('Profile Updated')));
  }

  @override
  void onInit() async {
     SharedPreferences prefs =await  SharedPreferences.getInstance();
     String? savedImagePath = prefs.getString('SavedImage');
     if(savedImagePath != null){
        locallySavedImage.value = savedImagePath;
     }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
