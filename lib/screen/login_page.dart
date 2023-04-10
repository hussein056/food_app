import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oreed/screen/home_page.dart';
import 'package:oreed/screen/home_page_screens/payment_page.dart';
import 'package:oreed/screen/sign_up.dart';
import 'package:oreed/screen/widget/cache_helper.dart';
import '../onBoarding/constant.dart';
import '/screen/widget/my_text_field.dart';

class LoginPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loadding = false;
  RegExp regExp = RegExp(LoginPage.pattern.toString());
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  UserCredential? userCredential;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future loginAuth() async {
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) async {
        loadding = false;
        await CachHelper.saveData(key: 'uId', value: "Hello");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PaymentPage()));
      }).catchError((e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('لا يوجد مستخدم موجود لهذا البريد'),
            ),
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('كلمة السر المدخله غير صحيحه'),
            ),
          );
          setState(() {
            loadding = false;
          });
        }
        setState(() {
          loadding = false;
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('لا يوجد مستخدم موجود لهذا البريد'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('كلمة السر المدخله غير صحيحه'),
          ),
        );
        setState(() {
          loadding = false;
        });
      }
      setState(() {
        loadding = false;
      });
    }

    await CachHelper.saveData(key: 'uId', value: 'hello');
  }

  void validation() {
    if (email.text.trim().isEmpty ||
        email.text.trim() == null && password.text.trim().isEmpty ||
        password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("ادخل البريد الالكترونى وكلمة السر للمتابعه"),
        ),
      );
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("ادخل البريد الالكترونى"),
        ),
      );
      return;
    } else if (!regExp.hasMatch(email.text)) {
      // globalKey.currentState!.showSnackBar(
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "من فضلك ادخل بريد صالح",
          ),
        ),
      );
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("من فضلك ادخل كلمة السر"),
        ),
      );
      return;
    } else {
      setState(() {
        loadding = true;
      });
      loginAuth();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      color: primarygreen,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MyTextField(
                      controller: email,
                      obscureText: false,
                      hintText: 'البريد الالكترونى',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                      controller: password,
                      obscureText: true,
                      hintText: 'كلمة السر',
                    ),
                  ],
                ),
                loadding
                    ? CircularProgressIndicator()
                    : Column(
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
                                  "تسجيل الدخول",
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
                        "أنشئ حساب الأن.",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        });
                      },
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Text(
                      "مستخدم جديد؟",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
