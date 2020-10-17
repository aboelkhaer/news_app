import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: _drawSingleRow(),
        );
      },
      itemCount: 10,
    );
  }

  Widget _drawSingleRow() {
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
                  'The Wold Global Warming AnnualSummit',
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
                          '15 min',
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
}
