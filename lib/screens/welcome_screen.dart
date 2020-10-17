import 'package:flutter/material.dart';
import 'package:news_app/page_model.dart';
import 'package:news_app/screens/home_screen_explore.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<PageModel> pages;

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  void _addPages() {
    pages = List<PageModel>();
    pages.add(PageModel('Welcome!', Icons.ac_unit,
        '1- Making friends is easy as waving your hand back and forth in easy step'));
    pages.add(PageModel('Alarm', Icons.access_alarm,
        '2- Making friends is easy as waving your hand back and forth in easy step'));
    pages.add(PageModel('Print', Icons.print,
        '3- Making friends is easy as waving your hand back and forth in easy step'));
    pages.add(PageModel('Map', Icons.map,
        '4- Making friends is easy as waving your hand back and forth in easy step'));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage('assets/images/bg2.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        child: Icon(
                          pages[index].icon,
                          size: 120,
                          color: Colors.white,
                        ),
                        offset: Offset(0, -100),
                      ),
                      Text(
                        pages[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 48,
                          right: 48,
                          top: 18,
                        ),
                        child: Text(
                          pages[index].description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              _pageViewNotifier.value = index;
            },
          ),
          Center(
            child: Transform.translate(
                offset: const Offset(0, 150),
                child: _displayPageIndicator(pages.length)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
                left: 16,
                right: 16,
              ),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.red.shade900,
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          updateSeen();
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _displayPageIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      indicatorPadding: EdgeInsets.all(4),
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

  void updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}
