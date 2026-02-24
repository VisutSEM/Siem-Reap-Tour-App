import 'dart:convert';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:siem_reap_tour/api/fetch_api.dart';
import 'package:siem_reap_tour/const/colors.dart';
import 'package:siem_reap_tour/models/image_model.dart';

import 'detail_screen.dart';

class FrontPage extends StatefulWidget {
  FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

List<ImageModel> allProducts = [];
List<ImageModel> filterProducts = [];
bool isLoading = true;

class _FrontPageState extends State<FrontPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
    allProducts = (await FetchApi()) as List<ImageModel>;
    setState(() {
      filterProducts = allProducts;
      isLoading = false;
    });
  }

  void search(String query) async {
    List<ImageModel> results = [];
    if (query.isEmpty) {
      results = allProducts;
    } else {
      results = allProducts
          .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      filterProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(radius: 25, backgroundColor: Colors.black),
                Icon(Icons.person, color: Colors.white),
              ],
            ),
            SizedBox(width: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: TextField(
                  onChanged: search,
                  autocorrect: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.qr_code_scanner),
                    ),
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              //borderRadius: BorderRadiusGeometry.circular(30),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                  border: Border.all(color: Colors.green.withOpacity(0.5)),
                ),
                child: Icon(Icons.notifications_none, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: FetchApi.fetchApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final data = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  Get.to(DetailScreen(data: data));
                },
                child: Card(
                  color: Colors.white60,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Hero(
                          tag: data.id,
                          child: Image.network(data.image),
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        data.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        data.description,
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "\$${data.price.toString()}",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
