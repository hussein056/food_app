import 'package:flutter/material.dart';
import 'package:oreed/onBoarding/constant.dart';
import 'package:oreed/screen/widget/my_text_field.dart';
import '/provider/my_provider.dart';
import '/screen/home_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);

    return Scaffold(
        backgroundColor: lightgreenshede,
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 40, left: 50, right: 50),
          // padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          decoration: BoxDecoration(
              color: greenshede0, borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(greenshede0)),
            onPressed: () async {
              String email = Uri.encodeComponent("mail@fluttercampus.com");
              String subject = Uri.encodeComponent("Hello Flutter");
              String body = Uri.encodeComponent("Hi! I'm Flutter Developer");
              print(subject); //output: Hello%20Flutter
              Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
              // if (await launchUrl(mail)) {
              //   //email app opened
              // } else {
              //   //email app is not opened
              // }

              final Uri params = Uri(
                scheme: 'mailto',
                path: 'ehuss056@gmail.com',
                query:
                    'subject=تطبيق طلباتى&body=من فضلك اجعل رسالتك بناءه', //add subject and body here
              );

              var url = params.toString();
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email_outlined,
                  color: primarygreen,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: Text(
                    "تواصل معنا",
                    style: TextStyle(
                        color: primarygreen,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: MyAppBar(),
        endDrawer: MyDrawer(context, provider),
        body: SingleChildScrollView(
          child: Column(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  """
                تطبيق طلباتى يتيح لك طلب الطعام 
                    من مجموعة متنوعة من المطاعم
                        والكافيهات والمحلات الغذائية 
                ويتم توصيله لك بشكل سريع ومميز 
                ويمكنك ايضا تصفح قوائم المطاعم 
                            المحلية والسلاسل الشهيرة
             والاستفادة من الصفقات والخصومات 
                                       وبرنامج المكافآت
                
                
                
                
                """,
                  maxLines: 100,
                  overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.justify,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      height: 2,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
                      color: primarygreen,
                      fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ));
  }
}
