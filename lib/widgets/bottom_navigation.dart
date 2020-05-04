import 'package:coiffeur_app/constant/constant.dart';
import 'package:flutter/material.dart';

enum TabItem { book, shop, cart, contact, account }

Map<TabItem, String> tabName = {
  TabItem.book: 'Réserver',
  TabItem.shop: 'Boutique',
  TabItem.cart: 'Panier',
  TabItem.contact: 'Contact',
  TabItem.account: 'Account',
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: primaryColor,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      backgroundColor: whiteColor,
      items: [
        _buildItem(tabItem: TabItem.book, icon: Icons.date_range),
        _buildItem(tabItem: TabItem.shop, icon: Icons.store),
        _buildItem(tabItem: TabItem.cart, icon: Icons.work),
        _buildItem(tabItem: TabItem.contact, icon: Icons.location_on),
        _buildItem(tabItem: TabItem.account, icon: Icons.person),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem, IconData icon}) {
    String text = tabName[tabItem];
    return BottomNavigationBarItem(
      icon: Container(
        child: Icon(icon, color: Colors.black,)
      ),
      title: Text(
        text, 
        style: TextStyle(
          color: currentTab == tabItem ? primaryColor : textColor
        ),
      ),
      activeIcon: Container(
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[secondColor, primaryColor],
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ).createShader(Offset.zero & bounds.size),
          blendMode: BlendMode.srcATop,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

}
