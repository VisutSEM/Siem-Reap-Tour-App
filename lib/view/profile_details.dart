import 'package:flutter/material.dart';
import 'package:siem_reap_tour/models/image_model.dart';
import 'package:siem_reap_tour/models/user_model.dart';

class ProfileDetails extends StatelessWidget {
  final UserModel profile;
  ProfileDetails({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 50,
                backgroundImage: NetworkImage(profile.avatar),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  Text(
                    profile.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.verified, color: Colors.blue),
                  ),
                ],
              ),
              Text(
                "Last update: ${profile.updatedAt}",
                style: TextStyle(fontSize: 10),
              ),
              ListTile(
                // leading: CircleAvatar(
                //   backgroundImage: NetworkImage(profile.avatar),
                // ),
                title: Text(
                  profile.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Role: ${profile.role}"),
                    Text("Email: ${profile.email}"),
                    Text("ID: ${profile.password}"),
                    Text("Joined: ${profile.creationAt}"),
                  ],
                ),
                trailing: Icon(Icons.safety_check, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
