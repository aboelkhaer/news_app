import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/my_drawer.dart';

class InstagramFeeds extends StatefulWidget {
  @override
  _InstagramFeedsState createState() => _InstagramFeedsState();
}

class _InstagramFeedsState extends State<InstagramFeeds> {
  TextStyle _hashTagStyle = TextStyle(color: Colors.orange);
  List<int> ids = [0, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Feeds'),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _drawHeader(position),
                _drawTitle(),
                _drawHashtags(),
                _dawBody(),
                _drawFooter(),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }

  Widget _drawHeader(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                setState(() {
                  if (ids.contains(position)) {
                    ids.remove(position);
                  } else {
                    ids.add(position);
                  }
                });
              },
              color:
                  (ids.contains(position)) ? Colors.red : Colors.grey.shade400,
            ),
            Transform.translate(
              offset: Offset(-11, 0),
              child: Text(
                '25',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
        left: 16,
        right: 16,
      ),
      child: Text(
        'hfdgk jkhdfgh jdshfgkjh sdjfhgkh jdsfhgj',
        style: TextStyle(
          color: Color(0xFF37474f),
        ),
      ),
    );
  }

  Widget _drawHashtags() {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 5,
        bottom: 10,
      ),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: InkWell(
              onTap: () {},
              child: Text(
                '#advance',
                style: _hashTagStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: InkWell(
              onTap: () {},
              child: Text(
                '#goals',
                style: _hashTagStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: InkWell(
              onTap: () {},
              child: Text(
                '#inkwell',
                style: _hashTagStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Image(
        image: ExactAssetImage(
          'assets/images/bg1.jpg',
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: FlatButton(
            onPressed: () {},
            child: Text(
              '10 COMMENTS',
              style: _hashTagStyle,
            ),
          ),
        ),
        Row(
          children: [
            FlatButton(
              onPressed: () {},
              child: Text(
                'SHARE',
                style: _hashTagStyle,
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'OPEN',
                style: _hashTagStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
