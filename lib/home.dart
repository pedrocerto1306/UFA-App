import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmo_mobile/constants/ItemsHelper.dart';
import 'package:mmo_mobile/models/Item.dart';

import 'course.dart';

class ItemList extends StatelessWidget {
  static final Stream<QuerySnapshot> cursos =
      FirebaseFirestore.instance.collection('cursos').snapshots();
  const ItemList({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: cursos,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Text('Algo deu errado :(');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Carregando...');
          }

          final courseData = snapshot.requireData;
          return ListView.builder(
              itemCount: courseData.size,
              itemBuilder: (context, position) {
                var menuItem = courseData.docs[position];
                return Column(
                  children: [
                    InkWell(
                        child: ListTile(
                            leading: CircleAvatar(
                              radius: 28,
                              backgroundImage:
                                  const AssetImage('images/Ufabc_logo.png'),
                            ),
                            title: Text(
                              menuItem['nome'],
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                            subtitle: Text(
                              menuItem['descricao'],
                              textAlign: TextAlign.left,
                            ),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CoursePage(course: menuItem))))),
                  ],
                );
              });
        });
  }
}
