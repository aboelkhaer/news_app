import 'package:flutter/cupertino.dart';

class PageModel {
  String _title;
  IconData _icon;
  String _description;

  PageModel(this._title, this._icon, this._description);

  String get description => _description;

  IconData get icon => _icon;

  String get title => _title;
}
