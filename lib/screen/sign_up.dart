import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oreed/screen/home_page.dart';
import 'package:oreed/screen/home_page_screens/payment_page.dart';
import 'package:oreed/screen/login_page.dart';
import 'package:oreed/screen/widget/cache_helper.dart';
import '../onBoarding/constant.dart';
import '/screen/widget/my_text_field.dart';
import 'package:oreed/screen/widget/my_text_field.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  late UserCredential userCredential;
  RegExp regExp = RegExp(SignUp.pattern.toString());
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData() async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user!.uid)
          .set({
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
        "email": email.text.trim(),
        "userid": userCredential.user!.uid,
        "password": password.text.trim(),
      }).whenComplete(() async {
        loading = false;
        await CachHelper.saveData(key: 'uId', value: "Hello");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PaymentPage()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("كلمة السر المستخدمه ضعيفه"),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("هذا البريد مستخدم من قبل"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
    // await CachHelper.saveData(key: 'uId', value: 1);
  }

  void validation() {
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "أدخل الاسم الاول",
          ),
        ),
      );
      return;
    }
    if (lastName.text.trim().isEmpty || lastName.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "أدخل اسم العائله",
          ),
        ),
      );
      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "أدخل البريد الالكترونى",
          ),
        ),
      );
      return;
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "أدخل بريد الكترونى صالح",
          ),
        ),
      );
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "أدخل كلمة السر",
          ),
        ),
      );
      return;
    } else {
      setState(() {
        loading = true;
      });
      sendData();
    }
  }

  Widget button(
      {required String buttonName,
      required Color color,
      required Color textColor,
      required VoidCallback ontap}) {
    return Container(
      width: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color, //button's fill color
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
          side: BorderSide(
              color: Colors.yellow,
              width: 2.0,
              style: BorderStyle.solid), //set border for the button
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  35.0)), // set the buttons shape. Make its birders rounded etc
          enabledMouseCursor:
              MouseCursor.defer, //used to construct ButtonStyle.mouseCursor
          disabledMouseCursor: MouseCursor
              .uncontrolled, //used to construct ButtonStyle.mouseCursor
          visualDensity: VisualDensity(
              horizontal: 0.0, vertical: 0.0), //set the button's visual density
          tapTargetSize: MaterialTapTargetSize
              .padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
          animationDuration:
              Duration(milliseconds: 100), //the buttons animations duration
          enableFeedback: true, //to set the feedback to true or false
          alignment: Alignment.bottomCenter, //set the button's child Alignment
        ),
        onPressed: () => {
          ontap
        }, //set both onPressed and onLongPressed to null to see the disabled properties
        onLongPress: () =>
            {}, //set both onPressed and onLongPressed to null to see the disabled properties
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 20, color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: SafeArea(
        child: Container(
          // decoration: new BoxDecoration(
          //   image: new DecorationImage(
          //     image: new AssetImage("images/backgrounde.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          color: lightgreenshede,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'السابق',
                      style: TextStyle(
                        color: primarygreen,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: primarygreen,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                Text(
                  "انشاء حساب",
                  style: TextStyle(
                    color: primarygreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Container(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyTextField(
                        controller: firstName,
                        obscureText: false,
                        hintText: 'الاسم الاول',
                      ),
                      MyTextField(
                        controller: lastName,
                        obscureText: false,
                        hintText: 'اسم العائله',
                      ),
                      MyTextField(
                        controller: email,
                        obscureText: false,
                        hintText: 'البريد الالكترونى',
                      ),
                      MyTextField(
                        controller: password,
                        obscureText: true,
                        hintText: 'كلمة السر',
                      )
                    ],
                  ),
                ),
                loading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      )
                    : Column(children: [
                        Column(
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
                                      validation();
                                    });
                                  },
                                  child: Text(
                                    "انشاء حساب",
                                    style: TextStyle(
                                        fontSize: 20, color: primarygreen),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Text(
                                "سجل الدخول الان",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                setState(() {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                });
                              },
                            ),
                            Text(
                              "هل لديك حساب؟",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 1,
                            ),
                          ],
                        )
                      ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
