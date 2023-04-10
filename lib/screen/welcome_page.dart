import 'package:flutter/material.dart';
import 'package:oreed/screen/login_page.dart';
import 'package:oreed/screen/sign_up.dart';
import 'package:provider/provider.dart';

import '../onBoarding/constant.dart';

class WelcomePage extends StatelessWidget {
  Widget button(
      {required String name, required Color color, required Color textColor}) {
    return Container(
      height: 45,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // color
          primary: Colors.blue, //button's fill color
          onPrimary: Colors
              .red, //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states
          onSurface: Colors
              .orange, //specify the button's disabled text, icon, and fill color
          shadowColor: Colors.black, //specify the button's elevation color
          elevation: 4.0, //buttons Material shadow
          textStyle: TextStyle(
              fontFamily: 'roboto'), //specify the button's text TextStyle
          padding: const EdgeInsets.only(
              top: 4.0,
              bottom: 4.0,
              right: 8.0,
              left: 8.0), //specify the button's Padding
          minimumSize: Size(
              20, 40), //specify the button's first: width and second: height
          // side: BorderSide(
          //     color: Colors.green,
          //     width: 2.0,
          //     style: BorderStyle.solid), //set border for the button
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  30.0)), // set the buttons shape. Make its birders rounded etc
          animationDuration:
              Duration(milliseconds: 100), //the buttons animations duration
          enableFeedback: true, //to set the feedback to true or false
          alignment: Alignment.bottomCenter, //set the button's child Alignment
        ),
        onPressed: () =>
            {}, //set both onPressed and onLongPressed to null to see the disabled properties
        onLongPress: () =>
            {}, //set both onPressed and onLongPressed to null to see the disabled properties
        child: Text(
          name,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightgreenshede,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: primarygreen,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Image.asset('images/logo.jpg'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "مرحبا بك فى طلباتى",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "اطلب الاكل الان من مطعمنا",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          " واستمتع باسرع وارخص خدمة توصيل",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // Positioned(
                    //   bottom: MediaQuery.of(context).size.height * 0.2,
                    //   left: MediaQuery.of(context).size.width * 0.33,
                    //   child:
                    // ),
                    Column(
                      children: [
                        SizedBox(
                          width: 170.0,
                          height: 60.0,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              "تسجيل الدخول",
                              style:
                                  TextStyle(fontSize: 20, color: primarygreen),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: lightgreenshede1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 170.0,
                          height: 60.0,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                            child: Text(
                              "انشاء حساب",
                              style:
                                  TextStyle(fontSize: 20, color: primarygreen),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: lightgreenshede1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                            ),
                          ),
                        ),
                      ],
                    )
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
