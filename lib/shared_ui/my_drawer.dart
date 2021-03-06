import 'package:flutter/material.dart';
import 'package:news_app/models/nave_menu.dart';
import 'package:news_app/screens/facebook_feeds.dart';
import 'package:news_app/screens/heedline_news.dart';
import 'package:news_app/screens/home_screen_explore.dart';
import 'package:news_app/screens/instagram_feeds.dart';
import 'package:news_app/screens/pages/login.dart';
import 'package:news_app/screens/twitter_feeds.dart';
import 'package:news_app/utilities/app_utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isLoggedIn = false;
  String token;
  SharedPreferences sharedPreferences;

  _checkToken() async {
    sharedPreferences = await SharedPreferences.getInstance();

    token = sharedPreferences.get('token');
    setState(() {
      if (token == null) {
        isLoggedIn = false;
      } else {
        isLoggedIn = true;
      }
    });
  }

  List<NavMenuItem> navigationMenu = [
    NavMenuItem('Explore', () => HomeScreen()),
    NavMenuItem('Headline News', () => HeadLineNews()),
    NavMenuItem('Twitter Feeds', () => TwitterFeeds()),
    NavMenuItem('Instagram Feeds', () => InstagramFeeds()),
    NavMenuItem('Facebook Feeds', () => FacebookFeeds()),
    NavMenuItem('Login', () => Login()),
    // NavMenuItem('Register', () => FacebookFeeds()),
  ];

  _logout() {
    if (sharedPreferences != null) {
      sharedPreferences.remove('token');
    }
    return HomeScreen();
  }

  @override
  void initState() {
    super.initState();
    if (isLoggedIn == true) {
      navigationMenu.add(NavMenuItem('Logout', _logout));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.mounted) {
      _checkToken();
    }
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 75,
          left: 20,
        ),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              title: Text(
                navigationMenu[position].title,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          navigationMenu[position].destination()),
                );
              },
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
