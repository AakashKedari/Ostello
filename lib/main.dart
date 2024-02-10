import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  const TextStyle defaultTextStyle =  TextStyle(
    fontFamily: 'Avenir', // Set your desired font family
    color: Colors.black, // Set your desired text color
  );
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: defaultTextStyle,
          bodyMedium: defaultTextStyle,
          titleMedium: defaultTextStyle,
          titleSmall: defaultTextStyle,
          bodySmall: defaultTextStyle,
          titleLarge: defaultTextStyle
        ),

      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
