import 'package:flutter/material.dart';
import 'package:news_app/models/post.dart';

class SinglePost extends StatefulWidget {
  final Post post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.post.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, positon) {
                if (positon == 0) {
                  return _drawPostsDetails();
                } else if (positon >= 1 && positon < 24) {
                  return _comments();
                } else {
                  return _commentTextEntry();
                }
              },
              childCount: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawPostsDetails() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          widget.post.content.trim(),
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.2,
            height: 1.25,
          ),
        ),
      ),
    );
  }

  Widget _comments() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/bg.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Christina'), Text('1 hour')],
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
              'Weasel the jeeper goodness inconsiderately spelled so ubiquitous amus'),
          SizedBox(
            height: 16,
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _commentTextEntry() {
    return Container(
      color: Color(0xFFf1f5f7),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'write comment here...',
                      fillColor: Color(0xFFf1f5f7),
                      filled: true,
                      contentPadding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                        bottom: 16,
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  height: 50,
                  onPressed: () {},
                  color: Color(0xFFf1f5f7),
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
