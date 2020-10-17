import 'package:flutter/material.dart';
import 'package:news_app/screens/home_tabs.dart/favorite.dart';
import 'package:news_app/screens/home_tabs.dart/popular.dart';
import 'package:news_app/shared_ui/my_drawer.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Headline News"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {},
          ),
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
          Favorites(),
          Popular(),
          Favorites(),
        ],
        controller: _tabController,
      ),
    );
  }
}
