import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigosoft_interview_task/control/homescreen_controller/homescreen_controller.dart';
import 'package:sigosoft_interview_task/global_widgets/appbar_widgets.dart';
import 'package:sigosoft_interview_task/global_widgets/carousal_widgets.dart';
import 'package:sigosoft_interview_task/global_widgets/cutsom_searchbar.dart';
import 'package:sigosoft_interview_task/global_widgets/gridview_widget.dart';
import 'package:sigosoft_interview_task/global_widgets/listview_container_widget.dart';
import 'package:sigosoft_interview_task/global_widgets/listview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> imageList=["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdWKaaVQDBgt1cfdWYrRx1v2Ygi-iQW3p8ZFs6p_Q0iMy40jl8Mf3ap2lCYtiyuvLbVZo&usqp=CAU"];


  List<String> imageList2=["https://foodandbeverageknowledge.com/wp-content/uploads/2022/05/baked-salmon-photo-removebg-preview-min.png",
                          "https://udaipurmeathouse.com/wp-content/uploads/2022/02/rahu-cutting.jpg",
                          "https://cdn.urbanpiper.com/media/bizmedia/2021/10/15/Pangush_Curry_Cut.jpg",
                           "https://c8.alamy.com/comp/2D89HT3/indian-fish-fry-recipe-fresh-whole-pomfret-fish-or-butter-fish-cut-into-slices-cleaned-and-ready-for-frying-along-with-spices-2D89HT3.jpg",
                           "https://www.shutterstock.com/image-photo/raw-steaks-rohu-fish-yellow-260nw-1588799380.jpg" ,
                           "https://thumbs.dreamstime.com/b/popular-rohu-fish-sliced-over-white-background-popular-rohu-fish-sliced-246185098.jpg"  
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
            List priceList = productController.priceList;
            List nameList = productController.nameList;
            List categoryList = productController.categoryList;
            List todayList=productController.todayList;
            List netquantityList =productController.netquantityList;
            List mrpList=productController.mrpList;
            List offerPriceList=productController.offerPriceList;
            if (productList.isNotEmpty) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomSearchBar(),
                    ),
                    const CarouselSliderWidget(),
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
                            imageUrl: imageList2[index], // Populate with dynamic data
                            name: categoryList[index], // Use the name list
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                     const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Today's Deals",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 320,
                      child: ListView.builder(
                        itemCount: todayList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                        return ListViewContainer(imageUrl: imageList2[index], name: todayList[index], mrp:mrpList[index], netPrice: offerPriceList[index],netQuantity: netquantityList[index],);
                      },),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: Card(
        elevation: 10,
        child: Container(
          height: 50,
          color: Colors.white70,
          width: double.infinity,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
        Icon(Icons.home, color: Colors.black, size: 30),
        Icon(Icons.search, color: Colors.black, size: 30),
        Icon(Icons.notifications, color: Colors.black, size: 30),
        Icon(Icons.person, color: Colors.black, size: 30),
            ],
          ),
        ),
      ),

    );
  }
}
