import 'package:flutter/material.dart';
import '../onBoarding/constant.dart';
import '/provider/my_provider.dart';
import 'home_page_screens/cart_page.dart';
import '/screen/home_page.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final int price;
  final String name;
  final bool isFavourite;
  final String restName;
  final String description;
  DetailPage({
    required this.image,
    required this.name,
    required this.price,
    required this.isFavourite,
    required this.restName,
    required this.description,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: lightgreenshede,
      appBar: AppBar(
        backgroundColor: lightgreenshede,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: primarygreen,
          ),
          onPressed: () {
            provider.changeFavToFalse();
            Navigator.of(context).pop();
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Container(
        color: lightgreenshede1,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: CircleAvatar(
                  radius: 110,
                  backgroundImage: NetworkImage(widget.image),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: lightgreenshede,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(
                        widget.name,
                        style: TextStyle(fontSize: 40, color: primarygreen),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        widget.restName,
                        style: TextStyle(fontSize: 20, color: primarygreen),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: lightgreenshede1,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '$quantity',
                                style: TextStyle(
                                    color: primarygreen,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: lightgreenshede1,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              "\  ${widget.price * quantity} دينار",
                              style:
                                  TextStyle(color: primarygreen, fontSize: 30),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: primarygreen,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            TextButton.icon(
                              icon: const Icon(
                                Icons.favorite,
                                color: Color(0xFF1E3A34),
                              ),
                              label: const Text(
                                'اضافه الى المفضله',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF1E3A34),
                                    fontWeight: FontWeight.bold),
                              ),
                              style: TextButton.styleFrom(
                                // primary: Colors.white,
                                backgroundColor: lightgreenshede1,
                                side: const BorderSide(
                                    color: Color(0xFF1E3A34), width: 1),
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                shadowColor: Colors.pink,
                                elevation: 5,
                              ),
                              onPressed: () {
                                if (provider.isFavourite) {
                                  Fluttertoast.showToast(
                                      msg: "تمت اضافته من قبل",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: lightgreenshede1,
                                      textColor: Color(0xFF1E3A34),
                                      fontSize: 16.0);
                                } else {
                                  provider.addTofav(
                                    image: widget.image,
                                    name: widget.name,
                                    price: widget.price,
                                    quantity: quantity,
                                    restName: widget.restName,
                                    description: widget.description,
                                    isFavourite: widget.isFavourite,
                                  );
                                  provider.changeFavToTrue();

                                  Fluttertoast.showToast(
                                      msg: "تمت اضافته الى المفضله",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: lightgreenshede1,
                                      textColor: Color(0xFF1E3A34),
                                      fontSize: 16.0);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      widget.description,
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 15,
                          letterSpacing: 0.0,
                          color: primarygreen),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                width: 170.0,
                                height: 60.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      provider.addToCart(
                                        image: widget.image,
                                        name: widget.name,
                                        price: widget.price,
                                        quantity: quantity,
                                        restName: widget.restName,
                                      );
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => CartPage(),
                                        ),
                                      );
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart,
                                        color: primarygreen,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            fontSize: 20, color: primarygreen),
                                      )
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: lightgreenshede1,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
