import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmo_mobile/disciplinesData.dart';

import 'models/user.dart';

class DisciplinesPage extends StatelessWidget {
  final User usuario;
  const DisciplinesPage({super.key, required this.usuario});

  static final Stream<QuerySnapshot> disciplinas =
      FirebaseFirestore.instance.collection('disciplinas').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(usuario.nome + " - " + usuario.curso)),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StreamBuilder<Object>(
              stream: disciplinas,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Text('Algo deu errado :(');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Carregando...');
                }

                final discData = snapshot.requireData;
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: discData.size,
                  itemBuilder: ((context, index) {
                    var discItem = discData.docs[index];
                    return Container(
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: TextButton(
                          child: Text(discItem['nome']),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DisciplinesDataPage(
                                      disciplina: discItem))),
                        ));
                  }),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    height: 5,
                  ),
                );
              })
        ],
      )),
    );
  }
}
