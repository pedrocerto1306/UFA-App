import 'package:mmo_mobile/models/Item.dart';

List<String> materiasGenericas = [
  'Projeto Pedagógico',
  'Bases Conceituais de Energia',
  'Funções de Uma Variável',
  'Fenomenos Eletromagnéticos'
];

class ItemHelper {
  static var ItemList = [
    MenuItemModel('BC&T', 'Bacharelado em Ciência & Tecnologia',
        'images/Ufabc_logo.png', materiasGenericas),
    MenuItemModel('BC&H', 'Bacharelado em Ciência e Humanidades',
        'images/Ufabc_logo.png', materiasGenericas),
    MenuItemModel('BM', 'Bacharelado em Matemática', 'images/Ufabc_logo.png',
        materiasGenericas),
    MenuItemModel('BF', 'Bacharelado em Física', 'images/Ufabc_logo.png',
        materiasGenericas),
    MenuItemModel('BB', 'Bacharelado em Biologia', 'images/Ufabc_logo.png',
        materiasGenericas),
    MenuItemModel('BCC', 'Bacharelado em Ciência da Computação',
        'images/Ufabc_logo.png', materiasGenericas),
    MenuItemModel('BF', 'Bacharelado em Filosofia', 'images/Ufabc_logo.png',
        materiasGenericas),
    MenuItemModel('BE', 'Bacharelado em Ecônomia', 'images/Ufabc_logo.png',
        materiasGenericas),
    MenuItemModel('Eng. Energia', 'Engenharia de Energia',
        'images/Ufabc_logo.png', materiasGenericas),
    MenuItemModel('Eng. Materiais', 'Engenharia de Materiais',
        'images/Ufabc_logo.png', materiasGenericas),
    MenuItemModel(
        'Eng. IAR',
        'Engenharia de Instrumentação, Automação e Robótica',
        'images/Ufabc_logo.png',
        materiasGenericas),
    MenuItemModel('Eng. Amb & Urb', 'Engenharia Ambiental e Urbana',
        'images/Ufabc_logo.png', materiasGenericas),
    MenuItemModel('Eng. Biomédica', 'Engenharia Biomédica',
        'images/Ufabc_logo.png', materiasGenericas),
    MenuItemModel('Eng. Aero', 'Engenharia Aeroespacial',
        'images/Ufabc_logo.png', materiasGenericas),
    MenuItemModel('Eng. Info', 'Engenharia Informação', 'images/Ufabc_logo.png',
        materiasGenericas),
  ];

  static MenuItemModel GetItemList(int position) {
    return ItemList[position];
  }

  static int ItemCount = ItemList.length;
}
