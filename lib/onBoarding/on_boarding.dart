import 'package:flutter/material.dart';
import 'package:oreed/onBoarding/allinonboardscreen.dart';
import 'package:oreed/onBoarding/constant.dart';
import 'package:oreed/screen/home_page.dart';
import 'package:oreed/screen/widget/cache_helper.dart';

import '../screen/welcome_page.dart';

class OnboardScreen extends StatefulWidget {
  OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;

  List<AllinOnboardModel> allinonboardlist = [
    AllinOnboardModel(
        "images/designf.jpg",
        " الان مع تطبيق طلباتى يمكنك طلب اشهى واشهر المأكلولات من مختلف المطاعم التى تمتاز بالجوده والخبره و المذاق الراقى.",
        "ايادى محترفه  تعد اشهي الأطباق"),
    AllinOnboardModel(
        "images/designs.jpg",
        "يمكنك ان تستمتع بأسرع طرق التوصيل مع ضمان جودة الطعام فقط وبأرخص الاسعار فقط من خلال تطبيق طلباتى.",
        "خدمة التوصيل للمنازل"),
    AllinOnboardModel(
        "images/designt.jpg",
        "بادر الان بالانضمام الى اسرة طلباتى حيث يمكنك الحصول على اشهى المأكولات فى اسرع وقت ممكن فى اى مكان داخل العراق.",
        "استمتع بأشهى المأكولات مع الاصدقاء"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "طلباتى",
          style: TextStyle(color: primarygreen, fontSize: 30),
        ),
        backgroundColor: lightgreenshede,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
              reverse: true,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: allinonboardlist.length,
              itemBuilder: (context, index) {
                return PageBuilderWidget(
                    title: allinonboardlist[index].titlestr,
                    description: allinonboardlist[index].description,
                    imgurl: allinonboardlist[index].imgStr);
              }),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                allinonboardlist.length,
                (index) => buildDot(index: index),
              ),
            ),
          ),
          currentIndex < allinonboardlist.length - 1
              ? Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "التالى",
                          style: TextStyle(fontSize: 18, color: primarygreen),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: lightgreenshede1,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0))),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "السابق",
                          style: TextStyle(fontSize: 18, color: primarygreen),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: lightgreenshede1,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0))),
                        ),
                      )
                    ],
                  ),
                )
              : Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.2,
                  left: MediaQuery.of(context).size.width * 0.33,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() async {
                        await CachHelper.saveData(key: 'onBoarding', value: "Hi");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()),
                        );
                      });
                    },
                    child: Text(
                      "هيا بنا",
                      style: TextStyle(fontSize: 30, color: primarygreen),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: lightgreenshede1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    int? newIndex;
    if (index == 0) {
      index = 2;
    } else if (index == 2) {
      index = 0;
    }

    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? primarygreen : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;
  PageBuilderWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Image.asset(imgurl),
          ),
          const SizedBox(
            height: 20,
          ),
          //Tite Text
          Text(title,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: primarygreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 20,
          ),
          //discription
          Text(description,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: primarygreen,
                fontSize: 16,
              ))
        ],
      ),
    );
  }
}
