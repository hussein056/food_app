import 'package:flutter/material.dart';
import 'package:oreed/onBoarding/constant.dart';
import 'package:oreed/screen/widget/my_text_field.dart';
import '/provider/my_provider.dart';
import '/screen/home_page.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatelessWidget {
  TextEditingController cardNum = TextEditingController();
  TextEditingController expDate = TextEditingController();
  TextEditingController cvv = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    int total = provider.totalprice();

    return Scaffold(
        backgroundColor: lightgreenshede,
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 65,
          decoration: BoxDecoration(
              color: greenshede0, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Center(
                      child: Text(
                        "متابعه عملية الشراء",
                        style: TextStyle(
                            color: primarygreen,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Center(
            child: Text(
              'أضف وسيلة دفع',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: primarygreen,
                fontSize: 25,
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
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 180,
              margin: EdgeInsets.only(top: 5, right: 20, left: 20, bottom: 5),
              decoration: BoxDecoration(
                color: lightgreenshede,
                image: DecorationImage(
                  image: AssetImage('images/Capture.PNG'),
                  fit: BoxFit.contain,
                ),
                border: Border.all(
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        " أدخل معلومات بطاقتك الائتمانيه ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: primarygreen,
                            fontSize: 20),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "لخصم مبلغ $total دينار",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: primarygreen,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, right: 20, left: 20, bottom: 5),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: cardNum,
                obscureText: false,
                onTap: () {},
                enabled: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  // hintText: 'Card number',
                  hintStyle: TextStyle(
                    color: primarygreen,
                  ),
                  labelText: 'Card number',
                  labelStyle: TextStyle(
                    color: primarygreen,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: lightgreenshede1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, right: 20, left: 20, bottom: 5),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: expDate,
                obscureText: false,
                onTap: () {},
                enabled: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  // hintText: 'Card number',
                  hintStyle: TextStyle(
                    color: primarygreen,
                  ),
                  labelText: 'Expiration Date',
                  labelStyle: TextStyle(
                    color: primarygreen,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: lightgreenshede1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, right: 20, left: 20, bottom: 5),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: cvv,
                obscureText: false,
                onTap: () {},
                enabled: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  // hintText: 'Card number',
                  hintStyle: TextStyle(
                    color: primarygreen,
                  ),
                  labelText: 'CVV',
                  labelStyle: TextStyle(
                    color: primarygreen,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: lightgreenshede1,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
