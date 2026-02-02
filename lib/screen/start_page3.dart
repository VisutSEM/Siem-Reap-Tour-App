import 'package:flutter/material.dart';
import 'package:siem_reap_tour/screen/front_page.dart';

import '../const/colors.dart';

class StartPage3 extends StatelessWidget {
  const StartPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Image.asset(
              'assets/images/Beach_Monochromatic 1.png',
              width: 406,
              height: 306,
            ),
            Text(
              "High-end leisure projects\n          to choose from",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                "The world's first-class modern leisure\n            and entertainment method",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            SizedBox(height: 90),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FrontPage()),
                );
              },
              child: CircleAvatar(
                radius: 35,
                backgroundColor: kBgColor,
                child: Image.asset("assets/icons/Group 183.png"),
              ),
            ),
            SizedBox(height: 140),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/Zaps.png"),
                Text("Nordic Vacation Sponsor"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
