import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/my_drawer.dart';

class TwitterFeeds extends StatefulWidget {
  @override
  _TwitterFeedsState createState() => _TwitterFeedsState();
}

class _TwitterFeedsState extends State<TwitterFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feeds'),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, position) {
          return Card(
            elevation: 7,
            child: Column(
              children: [
                _cardHeader(),
                _cardBody(),
                _dividerDraw(),
                _cardFooter(),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/bg1.jpg'),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Charistina Meyers',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF37474f),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '@ch_meyers',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Fri, 12 May 2017 . 14.25',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 10,
      ),
      child: Text(
        'sdfkg fdhkghk fhghfh hfdhlgd afhhdfh ahfvg fhdjhf adfhv gkfjglkfdj dfjgljdf djfgj',
        style: TextStyle(
          height: 1.5,
          fontSize: 16,
          color: Color(0xFF37474f),
        ),
      ),
    );
  }

  Widget _dividerDraw() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
      ),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.repeat,
                  size: 28,
                ),
                onPressed: () {},
                color: Colors.orange,
              ),
              Text(
                '25',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              FlatButton(
                onPressed: () {},
                child: Text(
                  'SHARE',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'OPEN',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
