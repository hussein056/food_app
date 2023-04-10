import 'package:flutter/material.dart';
import 'package:oreed/screen/detail_page.dart';
import '../../onBoarding/constant.dart';
import '/provider/my_provider.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}
// 
//
Widget favItem({
  required BuildContext context,
  required String image,
  required String name,
  required String restName,
  required int price,
  required VoidCallback onTap,
  required int quantity,
  required bool isFavourite,
  required String description,
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
                        TextButton.icon(
                            icon: const Icon(
                              Icons.more,
                              color: Color(0xFF1E3A34),
                            ),
                            label: const Text(
                              'المزيد',
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          image: image,
                                          name: name,
                                          price: price,
                                          restName: restName,
                                          isFavourite: isFavourite,
                                          description: description,
                                        )),
                              );
                            }),
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

//

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
      endDrawer: MyDrawer(context, provider),
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) {
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
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
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
          "المفضله",
          style: TextStyle(color: primarygreen, fontSize: 30),
        ),
        backgroundColor: lightgreenshede,
      ),
      body: Container(
        color: lightgreenshede,
        child: ListView.builder(
          itemCount: provider.favList.length,
          itemBuilder: (ctx, index) {
            return favItem(
              context: context,
              onTap: () {
                provider.favgetDeleteIndex(index);
                provider.favdelete();
              },
              image: provider.favList[index].image,
              name: provider.favList[index].name,
              price: provider.favList[index].price,
              quantity: provider.favList[index].quantity,
              restName: provider.favList[index].restName,
              description: provider.favList[index].description,
              isFavourite: provider.favList[index].isFavourite,
            );
          },
        ),
      ),
    );
  }
}
