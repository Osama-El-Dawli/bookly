import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
        textTheme:
            GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                )),
      ),
      home: const SplashView(),
    );
  }
}

