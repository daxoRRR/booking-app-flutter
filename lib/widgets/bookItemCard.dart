import 'package:coiffeur_app/constant/constant.dart';
import 'package:coiffeur_app/screens/bookMeeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItemCard extends StatefulWidget {
  final String bookItemName;
  final String bookItemTime;
  final String bookItemPrice;
  final String bookItemImage;

  const BookItemCard({Key key, this.bookItemName, this.bookItemTime, this.bookItemPrice, this.bookItemImage}) : super(key: key);
  
  @override
  _BookItemCardState createState() => _BookItemCardState();
}

class _BookItemCardState extends State<BookItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(30)),
      child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(1000),
          height: ScreenUtil().setHeight(320),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: whiteColor,
              boxShadow: [
                BoxShadow(offset: Offset(0, 4), blurRadius: 7, color: shadowColor)
              ]),
            child: InkWell(
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BookMeeting()
                )
              )            
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(620),
                    width: ScreenUtil().setWidth(220),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        alignment: FractionalOffset.topRight,
                        image: AssetImage( 
                          widget.bookItemImage
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(450),
                    padding: EdgeInsets.all(ScreenUtil().setHeight(25)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                        widget.bookItemName,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      Text(widget.bookItemTime),
                    ]
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(240),
                    padding: EdgeInsets.all(ScreenUtil().setHeight(25)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          widget.bookItemPrice,
                          style: TextStyle(
                            fontSize: 25,
                            color: secondColor,
                            fontWeight: FontWeight.w800
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
          )
        )
      ],
    )
    );     
  }
}