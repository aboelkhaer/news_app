import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:async';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostsApi postsApi = PostsApi();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _drawHeader(),
          _drawTopStories(),
          _drawRecentUpdates(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
    TextStyle _headerDescription = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 48,
                right: 48,
              ),
              child: Text(
                'Ho Terriers & Royals Gatecrashed Final',
                style: _headerTitle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 34,
                right: 34,
              ),
              child: Text(
                'lorem ipsum sit amet, consectetur adipiscing elit, sed do eiusmod.',
                style: _headerDescription,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
            ),
            child: _drawSectionTitle('Top Stories'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 7,
              child: FutureBuilder(
                future: postsApi.fetchWhatsNew(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData ||
                      (snapshot.connectionState == ConnectionState.waiting))
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  Post post1 = snapshot.data[10];
                  Post post2 = snapshot.data[15];
                  Post post3 = snapshot.data[20];
                  return Column(
                    children: [
                      _drawSingleRow(post1),
                      _drawDivider(),
                      _drawSingleRow(post2),
                      _drawDivider(),
                      _drawSingleRow(post3),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdates() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 5,
            ),
            child: _drawSectionTitle('Recent Updates'),
          ),
          _drawRecentCard(
            'Sport',
            Colors.deepOrange,
          ),
          _drawRecentCard(
            'Sport',
            Colors.teal,
          ),
          SizedBox(
            height: 35,
          )
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Divider(
      thickness: 1,
    );
  }

  Widget _drawSingleRow(Post post) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          SizedBox(
            height: 110,
            width: 120,
            child: Image(
              image: ExactAssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  post.title,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Michael Adam',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: Colors.grey,
                        ),
                        Text(
                          _parseHumanDateTime(post.dateWritten),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _parseHumanDateTime(String dateTime) {
    Duration timeAgo = DateTime.now().difference(DateTime.parse(dateTime));
    DateTime theDifference = DateTime.now().subtract(timeAgo);
    return timeago.format(theDifference);
  }

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade700,
        fontSize: 16,
      ),
    );
  }

  Widget _drawRecentCard(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/bg1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 6,
                right: 16,
                left: 16,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: 2,
                  bottom: 2,
                  left: 24,
                  right: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: color,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, left: 16, right: 10, bottom: 10),
              child: Text(
                'Vettel is Ferrari Number One - Hamilton',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 6,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.grey,
                  ),
                  Text(
                    '15 min',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Image.network(
//               post.image,
//               fit: BoxFit.cover,
//             ),
