import 'package:coiffeur_app/constant/constant.dart';
import 'package:coiffeur_app/widgets/bookItemCard.dart';
import 'package:flutter/material.dart';

enum bookItemObject {
  bookItemName, bookItemPrice, bookItemTime, bookItemImage
}

List<Map<String, String>> bookItemList = [
  {
    "bookItemName": "Sourcils Entretien (3 semaines)",
    "bookItemPrice": "5€",
    "bookItemTime": "10min",
    "bookItemImage": "assets/images/beautiful-2315_640.jpg"
  },
  {
    "bookItemName": "Epilation sourcils (création)",
    "bookItemPrice": "10€",
    "bookItemTime": "15min",
    "bookItemImage": "assets/images/beautiful-2314_640.jpg"
  },
  {
    "bookItemName": "Forfait 1/2 jambes + maillot échancré + aisselles",
    "bookItemPrice": "32€",
    "bookItemTime": "50min",
    "bookItemImage": "assets/images/image.png"
  },
  {
    "bookItemName": "Forfait jambes entières + maillot échancré + aisselles",
    "bookItemPrice": "42€",
    "bookItemTime": "1h20min",
    "bookItemImage": "assets/images/image.png"
  },
  {
    "bookItemName": "Visage",
    "bookItemPrice": "10€",
    "bookItemTime": "15min",
    "bookItemImage": "assets/images/lipstick-791761_1920.jpg"
  },
  {
    "bookItemName": "Lèvres ou nez",
    "bookItemPrice": "5€",
    "bookItemTime": "10min",
    "bookItemImage": "assets/images/model-2303361_640.jpg"
  }
];

class BookItem extends StatelessWidget {
  final bookName;
  const BookItem({Key key, this.bookName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                    this.bookName,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    ),
                  )
                  ],
                ),
                ...bookItemList.map((item) => 
                  BookItemCard(
                    bookItemName: item["bookItemName"],
                    bookItemPrice: item["bookItemPrice"],
                    bookItemImage: item["bookItemImage"],
                    bookItemTime: item["bookItemTime"],
                  )
                ).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
