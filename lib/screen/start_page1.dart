import 'package:flutter/material.dart';
import 'package:siem_reap_tour/const/colors.dart';
import 'package:siem_reap_tour/screen/start_page2.dart';

class StartPage1 extends StatelessWidget {
  const StartPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Image.asset(
            'assets/images/Traveling_Monochromatic 1.png',
            width: 406,
            height: 306,
          ),
          Text(
            "Make your own private \n             travel plan",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Formulate your strategy to receive \n                 wonderful gift packs",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 90),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return StartPage2();
                  },
                ),
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
    );
  }
}
