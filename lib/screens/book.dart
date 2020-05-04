import 'package:coiffeur_app/clipper/promotion.dart';
import 'package:coiffeur_app/constant/constant.dart';
import 'package:coiffeur_app/widgets/cardHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key key, this.onPush}) : super(key: key);
  final onPush;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            ShaderMask(
                child: Container(
                  height: ScreenUtil().setHeight(600),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20.0)),
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: FractionalOffset.topRight,
                        image: AssetImage("assets/images/home_header.jpg")
                    ),
                  ),
                ),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      secondColor.withOpacity(0.26),
                      primaryColor.withOpacity(0.26)
                    ],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
              height: ScreenUtil().setHeight(600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Bienvenue",
                    style: TextStyle(
                        fontSize: 17,
                        color: whiteColor,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(
                    "Stéphanie!",
                    style: TextStyle(
                        fontSize: 24,
                        color: whiteColor,
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Réserver",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(80),
              ),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: ScreenUtil().setWidth(60),
                spacing: ScreenUtil().setWidth(60),
                children: <Widget>[
                  CardHome(icon: "assets/icons/Hair-Dye.svg",
                    title: "Coiffures Femmes",),
                  CardHome(icon: "assets/icons/012---Eyebrow-Sculpting.svg",
                    title: "Bar à sourcils/cils",),
                  CardHome(icon: "assets/icons/025---Clean-Face.svg",
                    title: "Microneedling BBGlow",),
                  CardHome(icon: "assets/icons/023---Moisturising-Face.svg",
                    title: "Soins du visage",),
                  CardHome(icon: "assets/icons/033---Nail-Polish.svg",
                    title: "Bar à ongles",),
                  CardHome(icon: "assets/icons/014---Haircut.svg",
                    title: "Enfants/Ados",),
                  CardHome(
                    icon: "assets/icons/055---Shavers.svg", title: "Hommes",),
                  CardHome(icon: "assets/icons/046---Lip-Gloss.svg",
                    title: "Événements Mariages",),
                  CardHome(icon: "assets/icons/005---Leg-Hair.svg",
                    title: "Épilations",),
                  CardHome(icon: "assets/icons/049---Makeup-Booth.svg",
                    title: "Tarifs esthétique abonnés",),
                  CardHome(icon: "assets/icons/057---Skin-Care-Products.svg",
                    title: "Forfaits avantage",),
                  CardHome(icon: "assets/icons/028---UV-Protection.svg",
                    title: "Soin bronzant Naturel (sans UV)",),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(90),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Stack(
                  overflow: Overflow.clip,
                  children: <Widget>[
                    Container(
                      height: ScreenUtil().setHeight(400),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                              colors: [secondColor, primaryColor])
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipPath(
                            clipper: PromotionClipper(),
                            child: ShaderMask(
                                child: Container(
                                  height: ScreenUtil().setHeight(400),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(20.0)),
                                    image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        alignment: FractionalOffset.topRight,
                                        image: AssetImage(
                                            "assets/images/lipstick-791761_1920.jpg")
                                    ),
                                  ),
                                ),
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                    colors: [
                                      secondColor.withOpacity(0.26),
                                      primaryColor.withOpacity(0.26)
                                    ],
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.srcATop
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(400),
                      height: ScreenUtil().setHeight(400),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: ScreenUtil().setWidth(180),

                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "20%",
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(120)),
                              child: Container(
                                width: ScreenUtil().setWidth(220),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "De remise".toUpperCase(),
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(220)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Soins, " + "é".toUpperCase() + "pilations",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    "Bar à ongles",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
