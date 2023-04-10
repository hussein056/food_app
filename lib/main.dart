import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oreed/onBoarding/constant.dart';
import 'package:oreed/screen/home_page.dart';
import 'package:oreed/screen/sign_up.dart';
import 'package:oreed/screen/widget/cache_helper.dart';
import 'package:provider/provider.dart';
import 'package:oreed/screen/welcome_page.dart';
import '/screen/login_page.dart';
import '/provider/my_provider.dart';
import 'screen/home_page_screens/cart_page.dart';
import '/screen/detail_page.dart';
import '/screen/home_page.dart';
import 'onBoarding/on_boarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CachHelper.init();
  Widget widget;
  onBoarding =  await CachHelper.getData(key: 'onBoarding');
  if (onBoarding != null) {
    widget = HomePage();

  } else {
    widget = OnboardScreen();
  }
  // uId = await CachHelper.getData(key: 'uId');
  // await CachHelper.saveData(key: 'uId', value: "Hi");
  // uId = await CachHelper.getData(key: 'uId');

  // saveData
  // if (uId != null) {
  //   widget = HomePage();

  // } else {
  //   widget = OnboardScreen();
  // }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget statrWidget;
  MyApp(
    this.statrWidget,
  );
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Oreed',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff2b2b2b),
          appBarTheme: AppBarTheme(
            color: Color(0xff2b2b2b),
          ),
        ),
        home: statrWidget,
        // home: StreamBuilder(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (index, sncpshot) {
        //       if (sncpshot.hasData) {
        //         return HomePage();
        //       }
        //       return LoginPage();
        //     }),
      ),
    );
  }
}
