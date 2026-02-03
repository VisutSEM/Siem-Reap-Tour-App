import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siem_reap_tour/const/colors.dart';
import 'package:siem_reap_tour/models/img_model.dart';
import '../controller/ImageController.dart';
import '../view/guide_screen.dart';
import '../view/wallet_screen.dart';
import '../widgets/nav_bottom_bar.dart';

class FrontPage extends StatefulWidget {
  FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int _currentIndex = 0;

  final ImageController imgControl = Get.put(ImageController());

  List lstScreens = [WalletScreen(), GuideScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Find your next trip",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Nordic scenery",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: kBgColor,
                        child: Image.asset("assets/icons/Group 104.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Popular locations",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              // Fixed horizontal list
              SizedBox(
                height: 138,
                child: Obx(() {
                  if (imgControl.isLoading.value) {
                    return CircularProgressIndicator(color: kBgColor);
                  }
                  if (imgControl.imgCtr.isEmpty) {
                    return Center(child: Text("No data"));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imgControl.imgCtr.length,
                    itemBuilder: (context, index) {
                      final ImgModel = imgControl.imgCtr[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 19),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(10),
                          child: Container(
                            width: 230,
                            height: 138,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  color: Colors.grey,
                                  offset: Offset(1, 4),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Image.asset(ImgModel.image, fit: BoxFit.cover),
                                Positioned(
                                  bottom: 26,
                                  left: 10,
                                  child: Text(
                                    ImgModel.title,
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 14,
                                  left: 10,
                                  child: Text(
                                    ImgModel.body,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 190,
                                  child: Text(
                                    "${ImgModel.rating.toString()} ⭐️",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Popular locations",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 200,
                child: Obx(() {
                  if (imgControl.isLoading.value) {
                    return CircularProgressIndicator(color: kBgColor);
                  }
                  if (imgControl.imgCtr.isEmpty) {
                    return Center(child: Text("No Data"));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imgControl.imgCtr.length,
                    itemBuilder: (context, index) {
                      final ImgModelV2 = imgControl.imgCtr[index];
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Container(
                                width: 142,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Image.asset(
                                  ImgModelV2.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 30,
                                left: 15,
                                child: Text(
                                  ImgModelV2.title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 45,
                                child: Text(
                                  ImgModelV2.body,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12,
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
