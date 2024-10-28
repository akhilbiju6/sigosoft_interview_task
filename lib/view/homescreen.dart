import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigosoft_interview_task/control/homescreen_controller/homescreen_controller.dart';
import 'package:sigosoft_interview_task/global_widgets/appbar_widgets.dart';
import 'package:sigosoft_interview_task/global_widgets/carousal_widgets.dart';
import 'package:sigosoft_interview_task/global_widgets/cutsom_searchbar.dart';
import 'package:sigosoft_interview_task/global_widgets/gridview_widget.dart';
import 'package:sigosoft_interview_task/global_widgets/listview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> carouselItems = [
    Image.network('https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg'),
    Image.network('https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg'),
    Image.network('https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg'),
  ];

  getdata() async {
    await Provider.of<ProductController>(context, listen: false).fetchBackendData();
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(location: "WhiteField, Bengaluru"),
      body: SingleChildScrollView(
        child: Consumer<ProductController>(
          builder: (context, productController, child) {
            List productList = productController.productList;
            List imageList = productController.imageList;
            List priceList = productController.priceList;
            List nameList = productController.nameList;
            List categoryList = productController.categoryList;
            List categoryImageList = productController.categoryImageList;

            if (productList.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomSearchBar(),
                  ),
                  CarouselSliderWidget(carouselItems: carouselItems),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Grand Offer",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      itemCount: nameList.length, // Use productList length
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListviewWidget(
                          imageUrl: imageList[index], // Populate with dynamic data
                          name: nameList[index], // Use the name list
                          mrp: priceList[index], // Use the price list
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Categories",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      itemCount: categoryList.length, // Use imageList length
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GridViewWidget(
                          imageUrl: categoryImageList[index], // Populate with dynamic data
                          name: categoryList[index], // Use the name list
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
