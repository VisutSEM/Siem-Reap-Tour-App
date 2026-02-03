import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siem_reap_tour/screen/start_page1.dart';
import 'package:siem_reap_tour/widgets/nav_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: NavigateBottomBar(),
    );
  }
}
