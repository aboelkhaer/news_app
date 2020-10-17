import 'dart:math';

import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Color> colorsList = [
    Colors.red,
    Colors.teal,
    Colors.deepOrange,
    Colors.indigo,
    Colors.brown,
    Colors.purple,
  ];

  Random random = Random();
  Color _getRandomColor() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          elevation: 3,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _authorRow(),
                SizedBox(
                  height: 16,
                ),
                _newsItemRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: ExactAssetImage(
                      'assets/images/bg.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Michael Adams',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      '15 min . ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Life Style',
                      style: TextStyle(
                        color: _getRandomColor(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.bookmark_border,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children: [
        Container(
          height: 110,
          width: 120,
          margin: EdgeInsets.only(
            right: 16,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'The Wold Global Warming Annual Summit',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'lorem ipsum sit amet, consectetur adipiscing elit, sed do eiusmod.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
