import 'package:flutter/cupertino.dart';

class MenuItemModel {
  String name;
  String description;
  String image;
  List<String> materias = List.empty();

  MenuItemModel(this.name, this.description, this.image, this.materias);
}
