import 'package:coiffeur_app/screens/book.dart';
import 'package:coiffeur_app/screens/book_item.dart';
import 'package:coiffeur_app/screens/shop.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

class TabNavigatorRoutes {
  static const String book = '/';
  static const String shop = '/shop';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  // void _push(BuildContext context) {
  //   var routeBuilders = _routeBuilders(context);

  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => routeBuilders[TabNavigatorRoutes.bookItem](context)
  //     )
  //   );
  // }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.book: (context) => BookPage(),
      TabNavigatorRoutes.shop: (context) => ShopPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);
    print(routeBuilders);

    return Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.book,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }
}