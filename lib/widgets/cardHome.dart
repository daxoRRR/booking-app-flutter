import 'package:coiffeur_app/constant/constant.dart';
import 'package:coiffeur_app/screens/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardHome extends StatefulWidget {
  final String icon;
  final String title;
  final ValueChanged onPush;

  CardHome({@required this.icon, @required this.title, this.onPush});

  @override
  _CardHomeState createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(290),
      height: ScreenUtil().setHeight(420),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
          boxShadow: [
            BoxShadow(offset: Offset(0, 4), blurRadius: 10, color: shadowColor)
          ]),
      child: FlatButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BookItem(bookName: widget.title,)
            )
          )
        },
        color: whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setWidth(22),
            ),
            SvgPicture.asset(
              widget.icon,
              color: primaryColor,
              height: ScreenUtil().setWidth(140),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(22),
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
