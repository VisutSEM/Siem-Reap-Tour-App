import 'package:flutter/material.dart';
import 'package:siem_reap_tour/view/start_page3.dart';

import '../const/colors.dart';

class StartPage2 extends StatelessWidget {
  const StartPage2({super.key});

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
              'assets/images/Group 6932.png',
              width: 406,
              height: 306,
            ),
            Text(
              "Customize your\n High-end travel",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                "  Countless high-end\nentertainment facilities",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            SizedBox(height: 90),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StartPage3()),
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
