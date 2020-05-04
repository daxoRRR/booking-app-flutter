import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromotionClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(ScreenUtil().setWidth(200), 0);
    path.quadraticBezierTo(ScreenUtil().setWidth(220), ScreenUtil().setHeight(130), size.width/3, ScreenUtil().setHeight(210));
    path.quadraticBezierTo(size.width/ 3, size.height / 1.8, size.width/2.3, size.height / 1.3);
    path.quadraticBezierTo(size.width/ 2.1, size.height / 1.2, size.width / 1.8, size.height);
    path.quadraticBezierTo(size.width / 2, size.height, size.width / 2 , size.height);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}