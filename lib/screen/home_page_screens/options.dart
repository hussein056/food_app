import 'package:flutter/material.dart';
import '../../modles/categories_modle.dart';
import '../../modles/food_categories_modle.dart';
import '../../modles/food_modle.dart';
import '../../onBoarding/constant.dart';
import '../categories.dart';
import '/provider/my_provider.dart';
import '/screen/home_page.dart';
import 'package:provider/provider.dart';

class OptionsPage extends StatefulWidget {
  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
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

  Widget categoriesContainer(
      {required VoidCallback onTap,
      required String image,
      required String name}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: lightgreenshede1,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(textDirection: TextDirection.rtl, children: [
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: primarygreen,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover),
                    color: lightgreenshede,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  ////1st
  Widget burger() {
    return Row(
      children: burgerList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: burgerCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

////2nd
  Widget recipe() {
    return Row(
      children: recipeList
          .map((e) => categoriesContainer(
                image: e.image,
                name: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: recipeCategoriesList),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  //3rd
  Widget pizza() {
    return Row(
      children: pizzaList
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(list: pizzaCategoriesList),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }

  /////4th
  Widget drink() {
    return Row(
      children: drinkList
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(list: drinkCategoriesList),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }

// **************************************************
//
  List<CategoriesModle> kfcList = [];
  List<FoodCategoriesModle> kfcCategoriesList = [];
  Widget kfc() {
    return Row(
      children: kfcList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: kfcCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  // kfc
  List<CategoriesModle> burgerkingList = [];
  List<FoodCategoriesModle> burgerkingCategoriesList = [];
  Widget burgerking() {
    return Row(
      children: burgerkingList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: burgerkingCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  // burgerking
  List<CategoriesModle> wendyList = [];
  List<FoodCategoriesModle> wendyCategoriesList = [];
  Widget wendy() {
    return Row(
      children: wendyList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: wendyCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  // wendy
  List<CategoriesModle> papaList = [];
  List<FoodCategoriesModle> papaCategoriesList = [];
  Widget papa() {
    return Row(
      children: papaList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: papaCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  // papa
  List<CategoriesModle> dominoList = [];
  List<FoodCategoriesModle> dominoCategoriesList = [];
  Widget domino() {
    return Row(
      children: dominoList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: dominoCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  // domino
  List<CategoriesModle> yumList = [];
  List<FoodCategoriesModle> yumCategoriesList = [];
  Widget yum() {
    return Row(
      children: yumList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: yumCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  // yum
  List<CategoriesModle> macList = [];
  List<FoodCategoriesModle> macCategoriesList = [];
  Widget mac() {
    return Row(
      children: macList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: macCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  // mac
  List<CategoriesModle> starList = [];
  List<FoodCategoriesModle> starCategoriesList = [];
  Widget star() {
    return Row(
      children: starList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: starCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

  // star
  List<CategoriesModle> hutList = [];
  List<FoodCategoriesModle> hutCategoriesList = [];
  Widget hut() {
    return Row(
      children: hutList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: hutCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

// hut
// *********************************************************
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
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

// *****************************************
// 1
    provider.getkfcCategory();
    kfcList = provider.throwkfcList;
    provider.getkfcCategoriesList();
    kfcCategoriesList = provider.throwkfcCategoriesList;
    // 2
    provider.getburgerkingCategory();
    burgerkingList = provider.throwburgerkingList;
    provider.getburgerkingCategoriesList();
    burgerkingCategoriesList = provider.throwburgerkingCategoriesList;
    // 3
    provider.getwendyCategory();
    wendyList = provider.throwwendyList;
    provider.getwendyCategoriesList();
    wendyCategoriesList = provider.throwwendyCategoriesList;
    // 4
    provider.getpapaCategory();
    papaList = provider.throwpapaList;
    provider.getpapaCategoriesList();
    papaCategoriesList = provider.throwpapaCategoriesList;
    // 5
    provider.getdominoCategory();
    dominoList = provider.throwdominoList;
    provider.getdominoCategoriesList();
    dominoCategoriesList = provider.throwdominoCategoriesList;
    // 6
    provider.getyumCategory();
    yumList = provider.throwyumList;
    provider.getyumCategoriesList();
    yumCategoriesList = provider.throwyumCategoriesList;
    // 7
    provider.getmacCategory();
    macList = provider.throwmacList;
    provider.getmacCategoriesList();
    macCategoriesList = provider.throwmacCategoriesList;
    // 8
    provider.getstarCategory();
    starList = provider.throwstarList;
    provider.getstarCategoriesList();
    starCategoriesList = provider.throwstarCategoriesList;
    // 9
    provider.gethutCategory();
    hutList = provider.throwhutList;
    provider.gethutCategoriesList();
    hutCategoriesList = provider.throwhutCategoriesList;
// ******************************************
    return Scaffold(
      backgroundColor: lightgreenshede,
      endDrawer: MyDrawer(context, provider),
      appBar: MyAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.restaurant_menu_outlined,
                      size: 35,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Restaurants',
                      style: TextStyle(
                        color: primarygreen,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: primarygreen,
              ),
              Column(
                children: [
                  // burger(),
                  // recipe(),
                  // pizza(),
                  // drink(),

                  kfc(),
                  burgerking(),
                  wendy(),
                  papa(),
                  domino(),
                  yum(),
                  mac(),
                  star(),
                  hut(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
