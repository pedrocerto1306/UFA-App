import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmo_mobile/profile.dart';

class Entities extends StatelessWidget {
  static final Stream<QuerySnapshot> entidades =
      FirebaseFirestore.instance.collection('entidades').snapshots();
  const Entities({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: entidades,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Text('Algo deu errado :(');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Carregando...');
          }

          final entityData = snapshot.requireData;
          return ListView.builder(
              itemCount: entityData.size,
              itemBuilder: (context, index) {
                var entityItem = entityData.docs[index];
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
                        entityItem['nome'],
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.left,
                      ),
                      subtitle: Text(
                        entityItem['link'],
                        textAlign: TextAlign.left,
                      ),
                      onTap: () => openBrowser(entityItem['link']),
                    ))
                  ],
                );
              });
        });
  }
}
