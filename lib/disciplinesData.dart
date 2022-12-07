import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmo_mobile/constants/ItemsHelper.dart';
import 'package:mmo_mobile/models/Item.dart';
import 'package:mmo_mobile/profile.dart';

class DisciplinesDataPage extends StatelessWidget {
  final disciplina;
  const DisciplinesDataPage({super.key, required this.disciplina});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(disciplina['nome'].toString())),
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      child: Text("Tarefa"),
                      onPressed: () => openBrowser(disciplina['doc1']),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      child: Text("Conteúdo Programático"),
                      onPressed: () => openBrowser(disciplina['doc2']),
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
