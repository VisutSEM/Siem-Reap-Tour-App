import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siem_reap_tour/const/colors.dart';
import '../controller/ImageController.dart';

class FrontPage extends StatelessWidget {
  FrontPage({super.key});

  final ImageController imgControl = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: ListView(
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
        ],
      ),
    );
  }
}
