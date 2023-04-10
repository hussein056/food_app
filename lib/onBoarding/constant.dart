import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:oreed/onBoarding/on_boarding.dart';
import 'package:oreed/screen/home_page_screens/about.dart';
import 'package:provider/provider.dart';
import '../provider/my_provider.dart';
import '../screen/home_page.dart';
import '../screen/home_page_screens/cart_page.dart';
import '../screen/home_page_screens/favourite.dart';
import '../screen/home_page_screens/options.dart';
import '../screen/home_page_screens/payment_page.dart';
import '../screen/widget/cache_helper.dart';

var uId = '';
var onBoarding = '';
Color lightgreenshede = Color(0xFFF0FAF6);
Color lightgreenshede1 = Color(0xFFB2D9CC);
Color greenshede0 = Color(0xFF66A690);
Color greenshede1 = Color(0xFF93C9B5);
Color primarygreen = Color(0xFF1E3A34);
Color grayshade = Color(0xFF93B3AA);
Color colorAcent = Color(0xFF78C2A7);
Color cyanColor = Color(0xFF6D7E6E);

const kAnimationDuration = Duration(milliseconds: 200);

Widget drawerItem({
  required String name,
  required IconData icon,
  required onTap,
}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          size: 30,
          color: primarygreen,
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 25, color: primarygreen),
        ),
      ),
    ),
  );
}

PreferredSizeWidget? MyAppBar() {
  return AppBar(
    actions: [
      Builder(
        builder: (BuildContext context) {
          return Row(
            children: [
              SizedBox(
                width: 7,
              ),
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xFF1E3A34),
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
              SizedBox(
                width: 7,
              ),
            ],
          );
        },
      ),
    ],
    elevation: 1,
    centerTitle: true,
    title: Text(
      "طلباتى",
      style: TextStyle(color: primarygreen, fontSize: 30),
    ),
    backgroundColor: lightgreenshede,
  );
}

Widget MyDrawer(
  BuildContext context,
  MyProvider provider,
) {
  return SizedBox(
    width: MediaQuery.of(context).size.width *
        0.70, // 75% of screen will be occupied
    child: Drawer(
      child: Container(
        color: lightgreenshede,
        child: SafeArea(
          child: Column(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              drawerItem(
                  icon: Icons.home,
                  name: "الرئيسيه",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }),
              drawerItem(
                  name: "المطاعم",
                  icon: Icons.restaurant_menu,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => OptionsPage()),
                    );
                  }),

              //     Categories
              //   },
              // ),
              drawerItem(
                  icon: Icons.favorite,
                  name: "المفضله",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => FavouritePage()),
                    );
                  }),
              // CartModle
              drawerItem(
                  icon: Icons.add_shopping_cart,
                  name: "سلة الشراء",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
//
                  }),

              drawerItem(
                  icon: Icons.payments_outlined,
                  name: "الدفع",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentPage()),
                    );
                  }),
              Divider(
                thickness: 2,
                color: primarygreen,
              ),

              drawerItem(
                  icon: Icons.exit_to_app,
                  name: "تسجيل الخروج",
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('تسجيل الخروج'),
                            content:
                                Text('هل ترغب فعلا فى تسجيل الخروج والمغادره؟'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () async {
                                    provider.favList = [];
                                    provider.cartList = [];
                                    await CachHelper.removeData(key: 'uId');
                                    await CachHelper.removeData(
                                        key: 'onBoarding');
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OnboardScreen()),
                                    );
                                    //action code for "Yes" button
                                  },
                                  child: Text(
                                    'نعم',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red[400],
                                    ),
                                  )),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); //close Dialog
                                },
                                child: Text(
                                  'لا',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: primarygreen,
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                  }),
              drawerItem(
                  icon: Icons.info_outline,
                  name: "عنا",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => About()),
                    );
                  }),
            ],
          ),
        ),
      ),
    ),
  );
}
