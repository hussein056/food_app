import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../modles/cart_modle.dart';
import '../modles/categories_modle.dart';
import '../modles/fav_modle.dart';
import '../modles/food_categories_modle.dart';
import '../modles/food_modle.dart';

class MyProvider extends ChangeNotifier {
  List<CategoriesModle> burgerList = [];
  CategoriesModle? burgerModle;
  Future<void> getBurgerCategory() async {
    List<CategoriesModle> newBurgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('Burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newBurgerList.add(burgerModle!);
      burgerList = newBurgerList;
    });
    notifyListeners();
  }

  get throwBurgerList {
    return burgerList;
  }

  /////////////////// 2nd category ////////////////
  List<CategoriesModle> recipeList = [];
  CategoriesModle? recipeModle;
  Future<void> getRecipeCategory() async {
    List<CategoriesModle> newRecipeList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('Recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newRecipeList.add(recipeModle!);
      recipeList = newRecipeList;
    });
    notifyListeners();
  }

  get throwRecipeList {
    return recipeList;
  }

  /////////////// 3nd Category///////////////////////
  List<CategoriesModle> pizzaList = [];
  CategoriesModle? pizzaModle;
  Future<void> getPizzaCategory() async {
    List<CategoriesModle> newPizzaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('Pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newPizzaList.add(pizzaModle!);
      pizzaList = newPizzaList;
    });
    notifyListeners();
  }

  get throwPizzaList {
    return pizzaList;
  }

/////////////////4th category /////////////
  List<CategoriesModle> drinkList = [];
  CategoriesModle? drinkModle;
  Future<void> getDrinkCategory() async {
    List<CategoriesModle> newDrinkList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('Drink')
        .get();
    querySnapshot.docs.forEach((element) {
      drinkModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newDrinkList.add(drinkModle!);
      drinkList = newDrinkList;
    });
    notifyListeners();
  }

  get throwDrinkList {
    return drinkList;
  }

  /////////////////////  Single Food Item     //////////////////////////
  List<FoodModle> foodModleList = [];
  FoodModle? foodModle;
  Future<void> getFoodList() async {
    List<FoodModle> newSingleFoodList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Foods').get();
    querySnapshot.docs.forEach(
      (element) {
        foodModle = FoodModle(
          name: (element.data() as Map)['name'],
          image: (element.data() as Map)['image'],
          price: (element.data() as Map)['price'],
        );
        newSingleFoodList.add(foodModle!);
      },
    );

    foodModleList = newSingleFoodList;
    notifyListeners();
  }

  get throwFoodModleList {
    return foodModleList;
  }

//

  ///////////////burger categories list//////////
  ///

  //

  List<FoodCategoriesModle> burgerCategoriesList = [];
  FoodCategoriesModle? burgerCategoriesModle;
  Future<void> getBurgerCategoriesList() async {
    List<FoodCategoriesModle> newBurgerCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newBurgerCategoriesList.add(burgerCategoriesModle!);
      burgerCategoriesList = newBurgerCategoriesList;
    });
  }

  get throwBurgerCategoriesList {
    return burgerCategoriesList;
  }

  ///////////////Recipe categories list//////////
  List<FoodCategoriesModle> recipeCategoriesList = [];
  FoodCategoriesModle? recipeCategoriesModle;
  Future<void> getrecipeCategoriesList() async {
    List<FoodCategoriesModle> newrecipeCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newrecipeCategoriesList.add(recipeCategoriesModle!);
      recipeCategoriesList = newrecipeCategoriesList;
    });
  }

  get throwRecipeCategoriesList {
    return recipeCategoriesList;
  }

  ///////////////Pizza categories list//////////
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  late FoodCategoriesModle pizzaCategoriesModle;
  Future<void> getPizzaCategoriesList() async {
    List<FoodCategoriesModle> newPizzaCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('Pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newPizzaCategoriesList.add(pizzaCategoriesModle);
      pizzaCategoriesList = newPizzaCategoriesList;
    });
  }

  get throwPizzaCategoriesList {
    return pizzaCategoriesList;
  }

  ///////////////Drink categories list//////////
  List<FoodCategoriesModle> drinkCategoriesList = [];
  FoodCategoriesModle? drinkCategoriesModle;
  Future<void> getDrinkCategoriesList() async {
    List<FoodCategoriesModle> newDrinkCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('drink')
        .get();
    querySnapshot.docs.forEach((element) {
      drinkCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newDrinkCategoriesList.add(drinkCategoriesModle!);
      drinkCategoriesList = newDrinkCategoriesList;
    });
  }

  get throwDrinkCategoriesList {
    return drinkCategoriesList;
  }
// 
/////////////add to Favourite ////////////
List<FavModle> favList = [];
List<FavModle> newfavList = [];
FavModle? favModle;
void addTofav({
    required String image,
    required String name,
    required String restName,
    required int price,
    required int quantity,
    required String description,
    required bool isFavourite,
  }) {
    favModle = FavModle(
      restName: restName,
      image: image,
      name: name,
      price: price,
      quantity: quantity,
      description: description,
      isFavourite: isFavourite,
    );
    newfavList.add(favModle!);
    favList = newfavList;
  }

  get throwfavList {
    return favList;
  }


  int? favdeleteIndex;
  void favgetDeleteIndex(int index) {
    favdeleteIndex = index;
  }

  void favdelete() {
    favList.removeAt(favdeleteIndex!);
    notifyListeners();
  }
  // fav


// 
/////////////add to cart ////////////
  List<CartModle> cartList = [];
  List<CartModle> newCartList = [];
  CartModle? cartModle;
  void addToCart({
    required String image,
    required String name,
    required String restName,
    required int price,
    required int quantity,
  }) {
    cartModle = CartModle(
      restName: restName,
      image: image,
      name: name,
      price: price,
      quantity: quantity,
    );
    newCartList.add(cartModle!);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }

  int totalprice() {
    int total = 0;
    cartList.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }

  int? deleteIndex;
  void getDeleteIndex(int index) {
    deleteIndex = index;
  }

  void delete() {
    cartList.removeAt(deleteIndex!);
    notifyListeners();
  }

  //
//
  List<CategoriesModle> kfcList = [];
  CategoriesModle? kfcModle;
  Future<void> getkfcCategory() async {
    List<CategoriesModle> newkfcList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('kfc')
        .get();
    querySnapshot.docs.forEach((element) {
      kfcModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newkfcList.add(kfcModle!);
      kfcList = newkfcList;
    });
    notifyListeners();
  }

  get throwkfcList {
    return kfcList;
  }

  List<FoodCategoriesModle> kfcCategoriesList = [];
  FoodCategoriesModle? kfcCategoriesModle;
  Future<void> getkfcCategoriesList() async {
    List<FoodCategoriesModle> newkfcCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('kfc')
        .get();
    querySnapshot.docs.forEach((element) {
      kfcCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newkfcCategoriesList.add(kfcCategoriesModle!);
      kfcCategoriesList = newkfcCategoriesList;
    });
  }

  get throwkfcCategoriesList {
    return kfcCategoriesList;
  }

  // kfc
  List<CategoriesModle> burgerkingList = [];
  CategoriesModle? burgerkingModle;
  Future<void> getburgerkingCategory() async {
    List<CategoriesModle> newburgerkingList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('burgerking')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerkingModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newburgerkingList.add(burgerkingModle!);
      burgerkingList = newburgerkingList;
    });
    notifyListeners();
  }

  get throwburgerkingList {
    return burgerkingList;
  }

  List<FoodCategoriesModle> burgerkingCategoriesList = [];
  FoodCategoriesModle? burgerkingCategoriesModle;
  Future<void> getburgerkingCategoriesList() async {
    List<FoodCategoriesModle> newburgerkingCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('burgerking')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerkingCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newburgerkingCategoriesList.add(burgerkingCategoriesModle!);
      burgerkingCategoriesList = newburgerkingCategoriesList;
    });
  }

  get throwburgerkingCategoriesList {
    return burgerkingCategoriesList;
  }

  // burgerking
  List<CategoriesModle> wendyList = [];
  CategoriesModle? wendyModle;
  Future<void> getwendyCategory() async {
    List<CategoriesModle> newwendyList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('wendy')
        .get();
    querySnapshot.docs.forEach((element) {
      wendyModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newwendyList.add(wendyModle!);
      wendyList = newwendyList;
    });
    notifyListeners();
  }

  get throwwendyList {
    return wendyList;
  }

  List<FoodCategoriesModle> wendyCategoriesList = [];
  FoodCategoriesModle? wendyCategoriesModle;
  Future<void> getwendyCategoriesList() async {
    List<FoodCategoriesModle> newwendyCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('wendy')
        .get();
    querySnapshot.docs.forEach((element) {
      wendyCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newwendyCategoriesList.add(wendyCategoriesModle!);
      wendyCategoriesList = newwendyCategoriesList;
    });
  }

  get throwwendyCategoriesList {
    return wendyCategoriesList;
  }

  // wendy
  List<CategoriesModle> papaList = [];
  CategoriesModle? papaModle;
  Future<void> getpapaCategory() async {
    List<CategoriesModle> newpapaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('papa')
        .get();
    querySnapshot.docs.forEach((element) {
      papaModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newpapaList.add(papaModle!);
      papaList = newpapaList;
    });
    notifyListeners();
  }

  get throwpapaList {
    return papaList;
  }

  List<FoodCategoriesModle> papaCategoriesList = [];
  FoodCategoriesModle? papaCategoriesModle;
  Future<void> getpapaCategoriesList() async {
    List<FoodCategoriesModle> newpapaCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('papa')
        .get();
    querySnapshot.docs.forEach((element) {
      papaCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newpapaCategoriesList.add(papaCategoriesModle!);
      papaCategoriesList = newpapaCategoriesList;
    });
  }

  get throwpapaCategoriesList {
    return papaCategoriesList;
  }

  // papa
  List<CategoriesModle> dominoList = [];
  CategoriesModle? dominoModle;
  Future<void> getdominoCategory() async {
    List<CategoriesModle> newdominoList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('domino')
        .get();
    querySnapshot.docs.forEach((element) {
      dominoModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newdominoList.add(dominoModle!);
      dominoList = newdominoList;
    });
    notifyListeners();
  }

  get throwdominoList {
    return dominoList;
  }

  List<FoodCategoriesModle> dominoCategoriesList = [];
  FoodCategoriesModle? dominoCategoriesModle;
  Future<void> getdominoCategoriesList() async {
    List<FoodCategoriesModle> newdominoCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('domino')
        .get();
    querySnapshot.docs.forEach((element) {
      dominoCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newdominoCategoriesList.add(dominoCategoriesModle!);
      dominoCategoriesList = newdominoCategoriesList;
    });
  }

  get throwdominoCategoriesList {
    return dominoCategoriesList;
  }

  // domino
  List<CategoriesModle> yumList = [];
  CategoriesModle? yumModle;
  Future<void> getyumCategory() async {
    List<CategoriesModle> newyumList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('yum')
        .get();
    querySnapshot.docs.forEach((element) {
      yumModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newyumList.add(yumModle!);
      yumList = newyumList;
    });
    notifyListeners();
  }

  get throwyumList {
    return yumList;
  }

  List<FoodCategoriesModle> yumCategoriesList = [];
  FoodCategoriesModle? yumCategoriesModle;
  Future<void> getyumCategoriesList() async {
    List<FoodCategoriesModle> newyumCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('yum')
        .get();
    querySnapshot.docs.forEach((element) {
      yumCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newyumCategoriesList.add(yumCategoriesModle!);
      yumCategoriesList = newyumCategoriesList;
    });
  }

  get throwyumCategoriesList {
    return yumCategoriesList;
  }

  // yum
  List<CategoriesModle> macList = [];
  CategoriesModle? macModle;
  Future<void> getmacCategory() async {
    List<CategoriesModle> newmacList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('mac')
        .get();
    querySnapshot.docs.forEach((element) {
      macModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newmacList.add(macModle!);
      macList = newmacList;
    });
    notifyListeners();
  }

  get throwmacList {
    return macList;
  }

  List<FoodCategoriesModle> macCategoriesList = [];
  FoodCategoriesModle? macCategoriesModle;
  Future<void> getmacCategoriesList() async {
    List<FoodCategoriesModle> newmacCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('mac')
        .get();
    querySnapshot.docs.forEach((element) {
      macCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newmacCategoriesList.add(macCategoriesModle!);
      macCategoriesList = newmacCategoriesList;
    });
  }

  get throwmacCategoriesList {
    return macCategoriesList;
  }

  // mac
  List<CategoriesModle> starList = [];
  CategoriesModle? starModle;
  Future<void> getstarCategory() async {
    List<CategoriesModle> newstarList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('star')
        .get();
    querySnapshot.docs.forEach((element) {
      starModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newstarList.add(starModle!);
      starList = newstarList;
    });
    notifyListeners();
  }

  get throwstarList {
    return starList;
  }

  List<FoodCategoriesModle> starCategoriesList = [];
  FoodCategoriesModle? starCategoriesModle;
  Future<void> getstarCategoriesList() async {
    List<FoodCategoriesModle> newstarCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('star')
        .get();
    querySnapshot.docs.forEach((element) {
      starCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newstarCategoriesList.add(starCategoriesModle!);
      starCategoriesList = newstarCategoriesList;
    });
  }

  get throwstarCategoriesList {
    return starCategoriesList;
  }

  // star
  List<CategoriesModle> hutList = [];
  CategoriesModle? hutModle;
  Future<void> gethutCategory() async {
    List<CategoriesModle> newhutList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('XhXjlgjk2ffXtCnAD1Ms')
        .collection('hut')
        .get();
    querySnapshot.docs.forEach((element) {
      hutModle = CategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
      );
      newhutList.add(hutModle!);
      hutList = newhutList;
    });
    notifyListeners();
  }

  get throwhutList {
    return hutList;
  }

  List<FoodCategoriesModle> hutCategoriesList = [];
  FoodCategoriesModle? hutCategoriesModle;
  Future<void> gethutCategoriesList() async {
    List<FoodCategoriesModle> newhutCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('hut')
        .get();
    querySnapshot.docs.forEach((element) {
      hutCategoriesModle = FoodCategoriesModle(
        image: (element.data() as Map)['image'],
        name: (element.data() as Map)['name'],
        price: (element.data() as Map)['price'],
        isFavourite: (element.data() as Map)['isFavourite'],
        restName: (element.data() as Map)['restName'],
        description: (element.data() as Map)['description'],
      );
      newhutCategoriesList.add(hutCategoriesModle!);
      hutCategoriesList = newhutCategoriesList;
    });
  }

  get throwhutCategoriesList {
    return hutCategoriesList;
  }
  // hut

  //

  bool isFavourite = false;
  void changeFavToTrue() {
    isFavourite = true;
  }
  void changeFavToFalse() {
    isFavourite = false;
  }
}
