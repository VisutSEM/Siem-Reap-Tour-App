import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/img_model.dart'; // Make sure this import is correct

class ImageController extends GetxController {
  var imgCtr = <ImgModel>[].obs; // Changed from <dynamic> to <ImgModel>
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    imageDataCtr();
  }

  Future<void> imageDataCtr() async {
    try {
      isLoading(true);

      final response = await rootBundle.loadString(
        "assets/data/image_data.json",
      );

      final List<dynamic> data = json.decode(response);

      // Convert each JSON map to ImgModel
      final List<ImgModel> images = data
          .map((json) => ImgModel.fromJson(json as Map<String, dynamic>))
          .toList();

      imgCtr.assignAll(images);

      print("✅ Loaded ${imgCtr.length} images");
    } catch (e, stackTrace) {
      print("❌ Error loading JSON: $e");
      print("Stack: $stackTrace");

      Get.snackbar(
        'Error',
        'Failed to load images: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
