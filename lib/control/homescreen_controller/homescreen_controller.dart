import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sigosoft_interview_task/model/home_screen_model/home_screen_model.dart';

class ProductController extends ChangeNotifier {
  List<ProductResponse> productList = [];
  List<String> nameList = [];
  List<String> imageList = [];
  List<String> priceList = [];
  List<String> categoryList=[];

  Future<void> fetchBackendData() async {
    try {
      String url = 'https://ourworks.co.in/sigofish-backend/public/customer/products/details?product_id=2&store_id=1';
      String token = "208|PSdgfNi58S1qupatJAGm8xzZYcY5zqjvVypQ6BK";
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print("API Response From Product Details Fetch: ${response.body}");
        productList.clear();
        nameList.clear();
        imageList.clear();
        priceList.clear();
        categoryList.clear();

        ProductResponse userModel = ProductResponse.fromJson(responseData);
        productList.add(userModel);
         nameList.add(userModel.data?.product?.name ?? "");
        imageList.add(userModel.data?.product?.image ?? "");
        priceList.add(userModel.data?.product?.price ?? "");
       


        for (var relatedProduct in userModel.data?.related ?? []) {
           categoryList.add(relatedProduct.type?? "");
        }

        print(nameList); // Log the list of product names
        print(imageList); // Log the list of product images
        print(priceList); // Log the list of product prices
      } else {
        print("Failed to fetch product details. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Unable to fetch Data From Backend: $e");
    }

    notifyListeners();
  }
}
