import 'package:coiffeur_app/constant/constant.dart';
import 'package:coiffeur_app/screens/book.dart';
import 'package:coiffeur_app/widgets/bottom_navigation.dart';
import 'package:coiffeur_app/widgets/tabNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Réserver', Icons.calendar_today, Colors.teal),
  Destination('Boutique', Icons.shopping_cart, Colors.cyan),
  Destination('Panier', Icons.school, Colors.orange),
  Destination('Contact', Icons.flight, Colors.blue),
  Destination('Compte', Icons.flight, Colors.blue)
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem currentTab = TabItem.book;

  void _selectTab(TabItem tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        context,
        width: 1125,
        height: 2436,
        allowFontScaling: true
    );
    return Scaffold(
      body: TabNavigator(
        tabItem: currentTab,
      ),
      bottomNavigationBar: BottomNavigation(
        currentTab: currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }
}

