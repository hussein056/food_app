import 'package:flutter/material.dart';
import '../onBoarding/constant.dart';
import '/modles/categories_modle.dart';
import '/modles/food_categories_modle.dart';
import '/modles/food_modle.dart';
import '/provider/my_provider.dart';
import '/screen/categories.dart';
import '/screen/detail_page.dart';
import '/screen/widget/bottom_Contianer.dart';
import 'package:provider/provider.dart';

import 'home_page_screens/options.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1st
  List<CategoriesModle> burgerList = [];

  ///2nd
  List<CategoriesModle> recipeList = [];
  //3rd
  List<CategoriesModle> pizzaList = [];
  //4th
  List<CategoriesModle> drinkList = [];

  List<FoodModle> singleFoodList = [];

  // All  Food
  List<FoodCategoriesModle> allFoodList = [];

  List<FoodCategoriesModle> burgerCategoriesList = [];
  List<FoodCategoriesModle> recipeCategoriesList = [];
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  List<FoodCategoriesModle> drinkCategoriesList = [];

  List<FoodCategoriesModle> kfcCategoriesList = [];
  List<FoodCategoriesModle> burgerkingCategoriesList = [];
  List<FoodCategoriesModle> wendyCategoriesList = [];
  List<FoodCategoriesModle> papaCategoriesList = [];
  List<FoodCategoriesModle> dominoCategoriesList = [];
  List<FoodCategoriesModle> yumCategoriesList = [];
  List<FoodCategoriesModle> macCategoriesList = [];
  List<FoodCategoriesModle> starCategoriesList = [];
  List<FoodCategoriesModle> hutCategoriesList = [];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    // 1st
    provider.getBurgerCategory();
    burgerList = provider.throwBurgerList;
    //2nd
    provider.getRecipeCategory();
    recipeList = provider.throwRecipeList;
    // //3rd
    provider.getDrinkCategory();
    drinkList = provider.throwDrinkList;
    // // 4th
    provider.getPizzaCategory();
    pizzaList = provider.throwPizzaList;
    // //////////////single food list/////////
    provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;

    provider.getBurgerCategoriesList();
    burgerCategoriesList = provider.throwBurgerCategoriesList;
    provider.getrecipeCategoriesList();
    recipeCategoriesList = provider.throwRecipeCategoriesList;
    provider.getPizzaCategoriesList();
    pizzaCategoriesList = provider.throwPizzaCategoriesList;
    provider.getDrinkCategoriesList();
    drinkCategoriesList = provider.throwDrinkCategoriesList;
//
    provider.getkfcCategoriesList();
    kfcCategoriesList = provider.throwkfcCategoriesList;
    provider.getburgerkingCategoriesList();
    burgerkingCategoriesList = provider.throwburgerkingCategoriesList;
    provider.getwendyCategoriesList();
    wendyCategoriesList = provider.throwwendyCategoriesList;
    provider.getpapaCategoriesList();
    papaCategoriesList = provider.throwpapaCategoriesList;
    provider.getdominoCategoriesList();
    dominoCategoriesList = provider.throwdominoCategoriesList;
    provider.getyumCategoriesList();
    yumCategoriesList = provider.throwyumCategoriesList;
    provider.getmacCategoriesList();
    macCategoriesList = provider.throwmacCategoriesList;
    provider.getstarCategoriesList();
    starCategoriesList = provider.throwstarCategoriesList;
    provider.gethutCategoriesList();
    hutCategoriesList = provider.throwhutCategoriesList;

    allFoodList = []
      ..addAll(burgerCategoriesList)
      ..addAll(pizzaCategoriesList)
      ..addAll(recipeCategoriesList)
      ..addAll(drinkCategoriesList)
      ..addAll(kfcCategoriesList)
      ..addAll(burgerkingCategoriesList)
      ..addAll(wendyCategoriesList)
      ..addAll(papaCategoriesList)
      ..addAll(dominoCategoriesList)
      ..addAll(yumCategoriesList)
      ..addAll(macCategoriesList)
      ..addAll(starCategoriesList)
      ..addAll(hutCategoriesList);
    return Scaffold(
      backgroundColor: lightgreenshede,
      endDrawer: MyDrawer(context, provider),
      appBar: MyAppBar(),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'كل الوجبات ',
                    style: TextStyle(
                      color: primarygreen,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.food_bank_outlined,
                    size: 35,
                  )
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: primarygreen,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 510,
                child: GridView.count(
                    shrinkWrap: false,
                    primary: false,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: allFoodList
                        .map(
                          (e) => BottomContainer(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    image: e.image,
                                    name: e.name,
                                    price: e.price,
                                    isFavourite: e.isFavourite,
                                    description: e.description,
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
            )
          ],
        ),
      ),
    );
  }
}
