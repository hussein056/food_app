import 'package:flutter/material.dart';
import 'package:oreed/onBoarding/constant.dart';
import 'package:oreed/screen/home_page_screens/payment_page.dart';
import 'package:oreed/screen/welcome_page.dart';
import 'package:oreed/screen/widget/cache_helper.dart';
import '/provider/my_provider.dart';
import '/screen/home_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget cartItem({
    required String image,
    required String name,
    required String restName,
    required int price,
    required VoidCallback onTap,
    required int quantity,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: lightgreenshede1,
        child: Row(
          children: [
            Container(
              width: 170,
              height: 170,
              child: CircleAvatar(
                backgroundImage: NetworkImage(image),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: primarygreen,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$restName",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primarygreen),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          " $price دينار",
                          style: TextStyle(
                              color: primarygreen,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "$quantity",
                            style: TextStyle(fontSize: 20, color: primarygreen),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: primarygreen),
                  onPressed: onTap,
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    int total = provider.totalprice();
    return Scaffold(
      backgroundColor: lightgreenshede,
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          uId = await CachHelper.getData(key: 'uId');
          if (uId == null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            );
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaymentPage()));
          }
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 65,
          decoration: BoxDecoration(
              color: greenshede0, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "شراء الان",
                  style: TextStyle(
                      color: primarygreen,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Text(
                        "المجموع الكلى:",
                        style: TextStyle(
                            color: primarygreen,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "\  $total دينار",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: primarygreen,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            'سلة المشتريات',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: primarygreen,
              fontSize: 30,
            ),
          ),
        ),
        elevation: 1.0,
        backgroundColor: lightgreenshede,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primarygreen,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     builder: (context) => HomePage(),
            //   ),
            // );
          },
        ),
      ),
      body: Container(
        color: lightgreenshede,
        child: ListView.builder(
          itemCount: provider.cartList.length,
          itemBuilder: (ctx, index) {
            // provider.getDeleteIndex(index);
            return cartItem(
              onTap: () {
                provider.getDeleteIndex(index);
                provider.delete();
              },
              image: provider.cartList[index].image,
              name: provider.cartList[index].name,
              price: provider.cartList[index].price,
              quantity: provider.cartList[index].quantity,
              restName: provider.cartList[index].restName,
            );
          },
        ),
      ),
    );
  }
}
