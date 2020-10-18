import 'package:flutter/material.dart';
import 'package:news_app/screens/home_tabs.dart/favorite.dart';
import 'package:news_app/screens/home_tabs.dart/popular.dart';
import 'package:news_app/screens/home_tabs.dart/whats_new.dart';
import 'package:news_app/screens/pages/about.dart';
import 'package:news_app/screens/pages/contact.dart';
import 'package:news_app/screens/pages/help.dart';
import 'package:news_app/screens/pages/settings.dart';
import 'package:news_app/shared_ui/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopOutMenu {
  Help,
  About,
  Contact,
  Setting,
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          _popUpMenu(context),
        ],
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: 'What\'s news',
            ),
            Tab(
              text: 'Popular',
            ),
            Tab(
              text: 'Favorites',
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        children: [
          WhatsNew(),
          Popular(),
          Favorites(),
        ],
        controller: _tabController,
      ),
    );
  }

  Widget _popUpMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.About,
            child: Text('About'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.Contact,
            child: Text('Contact'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.Help,
            child: Text('Help'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.Setting,
            child: Text('Settings'),
          ),
        ];
      },
      onSelected: (PopOutMenu menu) {
        switch (menu) {
          case PopOutMenu.Help:
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HelpUs();
                },
              ),
            );
            break;
          case PopOutMenu.About:
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AboutUs();
                },
              ),
            );
            break;
          case PopOutMenu.Contact:
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ContactUs();
                },
              ),
            );
            break;
          case PopOutMenu.Setting:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Settings();
                },
              ),
            );
            break;
        }
      },
      icon: Icon(Icons.more_vert),
    );
  }
}
