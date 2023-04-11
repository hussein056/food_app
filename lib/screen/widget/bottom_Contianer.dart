import 'package:flutter/material.dart';

import '../../onBoarding/constant.dart';

class BottomContainer extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final VoidCallback onTap;
  BottomContainer(
      {required this.onTap,
      required this.image,
      required this.price,
      required this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 270,
        width: 220,
        decoration: BoxDecoration(
            color: lightgreenshede1, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(image),
            ),
            ListTile(
              leading: Text(
                name,
                style: TextStyle(fontSize: 18, color: primarygreen),
              ),
              trailing: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  "$price دينار ",
                  style: TextStyle(
                    fontSize: 18,
                    color: primarygreen,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
