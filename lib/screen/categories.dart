import 'package:flutter/material.dart';
import 'package:oreed/onBoarding/constant.dart';
import '/modles/food_categories_modle.dart';
import '/screen/detail_page.dart';
import '/screen/home_page.dart';
import '/screen/widget/bottom_Contianer.dart';
import 'home_page_screens/options.dart';

class Categories extends StatelessWidget {
  List<FoodCategoriesModle> list = [];
  Categories({required this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: lightgreenshede,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primarygreen,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (contet) => OptionsPage()));
          },
        ),
      ),
      body: Container(
        color: lightgreenshede,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.count(
              shrinkWrap: false,
              primary: false,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: list
                  .map(
                    (e) => BottomContainer(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              image: e.image,
                              name: e.name,
                              price: e.price,
                              description: e.description,
                              isFavourite: e.isFavourite,
                              restName: e.restName,
                            ),
                          ),
                        );
                      },
                      image: e.image,
                      price: e.price,
                      name: e.name,
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
