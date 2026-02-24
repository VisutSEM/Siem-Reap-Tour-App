import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:siem_reap_tour/api/fetch_api.dart';
import 'package:siem_reap_tour/models/image_model.dart';
import 'package:siem_reap_tour/view/detail_screen.dart';
import 'package:siem_reap_tour/widgets/nav_bottom_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ImageModel> allProducts = [];
  List<ImageModel> filteredProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
    allProducts = await FetchApi.fetchApi();
    setState(() {
      filteredProducts = allProducts;
      isLoading = false;
    });
  }

  void search(String query) {
    List<ImageModel> results = [];

    if (query.isEmpty) {
      results = allProducts;
    } else {
      results = allProducts
          .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      onChanged: search,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          padding: EdgeInsets.all(10),
                          onPressed: () {},
                          icon: Icon(Icons.document_scanner_outlined),
                        ),
                        hintText: "Search product...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: filteredProducts.isEmpty
                        ? const Center(child: Text("No products found"))
                        : ListView.builder(
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) {
                              final p = filteredProducts[index];
                              return ListTile(
                                onTap: () {
                                  Get.to(DetailScreen(data: p));
                                },
                                leading: Hero(
                                  tag: p.id,
                                  child: Image.network(p.image, width: 50),
                                ),
                                title: Text(p.title),
                                subtitle: Text("\$${p.price}"),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
    );
  }
}
