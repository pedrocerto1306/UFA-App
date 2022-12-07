import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmo_mobile/constants/ItemsHelper.dart';
import 'package:mmo_mobile/models/Item.dart';
import 'package:mmo_mobile/profile.dart';

class CoursePage extends StatelessWidget {
  final course;
  const CoursePage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course['descricao'].toString())),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage('images/Ufabc_logo.png'),
              height: 100,
              width: 100,
            ),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: ((context, index) => Divider(
                    height: 5,
                  )),
              itemCount: 1, //Quantidade de campos no objeto curso
              itemBuilder: ((context, index) {
                return Container(
                  color: Colors.grey[350],
                  child: TextButton(
                    child: Text("Projeto Pedagógico"),
                    onPressed: () => openBrowser(course['ppdg']),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
