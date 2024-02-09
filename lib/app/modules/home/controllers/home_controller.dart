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

   var pickedCoverImage = Rx<XFile?>(null);
   var _coverImageFile = Rx<File?>(null);


   RxString locallySavedImage = ''.obs;
   RxString locallySavedCoverImage = ''.obs;

   Future<void> pickImageAndSave() async {
     final imagePicker = ImagePicker();
     pickedImage.value = await imagePicker.pickImage(source: ImageSource.gallery);
     if (pickedImage.value == null){
       Get.snackbar('Nothing Selected', '',titleText: const Center(child:Text('Nothing Selected'),),snackPosition: SnackPosition.BOTTOM);
       return;
     }
     if (pickedImage.value != null) {
       _imageFile.value = File(pickedImage.value!.path);
     }

     final appDir = await getApplicationDocumentsDirectory();
     final fileName = 'bg_image.jpg';
     final savedImage = await _imageFile.value!.copy('${appDir.path}/$fileName');
     locallySavedImage.value= savedImage.path;
     SharedPreferences prefs =await  SharedPreferences.getInstance();
     prefs.setString('SavedImage', savedImage.path);

     Get.snackbar('Profile Updated', '',titleText: const Center(child:Text('Profile Updated'),),snackPosition: SnackPosition.BOTTOM);
   }

   Future<void> pickCoverImageAndSave() async {
    final imagePicker = ImagePicker();
    pickedCoverImage.value = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedCoverImage.value == null){
      Get.snackbar('Nothing Selected', '',titleText: const Center(child:Text('Nothing Selected'),),snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (pickedCoverImage.value != null) {
        _coverImageFile.value = File(pickedCoverImage.value!.path);
    }

    final appDir = await getApplicationDocumentsDirectory();
    final fileName = 'cover_image.jpg';
    final savedImage = await _coverImageFile.value!.copy('${appDir.path}/$fileName');
    locallySavedCoverImage.value= savedImage.path;
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    prefs.setString('SavedCoverImage', savedImage.path);

     Get.snackbar('Cover Photo Updated', '',titleText: const Center(child:Text('Cover Photo Updated'),),snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onInit() async {
     SharedPreferences prefs =await  SharedPreferences.getInstance();
     String? savedImagePath = prefs.getString('SavedImage');
     if(savedImagePath != null ){
        locallySavedImage.value = savedImagePath!;
     }
     String? savedCoverPath = prefs.getString('SavedCoverImage');
     if(savedCoverPath != null){
       locallySavedCoverImage.value = savedCoverPath;
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
