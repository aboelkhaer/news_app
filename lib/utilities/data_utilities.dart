import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget error(var error) {
  return Center(
    child: Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      width: double.infinity,
      child: Text(
        error.toString(),
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
  );
}

Widget connectionError() {
  return Center(
    child: Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      width: double.infinity,
      child: Text(
        'Connection error',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
  );
}

Widget noData() {
  return Center(
    child: Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16,
      ),
      width: double.infinity,
      child: Text(
        'No data avaliable!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
  );
}

Widget loading() {
  return Container(
    padding: EdgeInsets.only(
      top: 16,
      bottom: 16,
    ),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

String parseHumanDateTime(String dateTime) {
  Duration timeAgo = DateTime.now().difference(DateTime.parse(dateTime));
  DateTime theDifference = DateTime.now().subtract(timeAgo);
  return timeago.format(theDifference);
}
