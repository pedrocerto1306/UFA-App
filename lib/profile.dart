import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mmo_mobile/disciplines.dart';
import 'package:mmo_mobile/models/user.dart';
import 'package:mmo_mobile/user-posts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'models/post.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final double margin = 10;
  final int numSeg = 0;
  final List<String> skills = [
    'Processamento de Informação',
    'Programação Estruturada',
    'Algoritmos e Estruturas de Dados',
    'Programação Orientada à Objetos',
    'Álgebra Linear',
    'Fenômenos Eletromagnéticos',
    'Compiladores'
  ];
  bool isFollowing = false;
  String lblFollow = 'Seguir';
  double followBtnWidth = 75.0;

  User usuario = User(
      'Pietra Moscovich',
      'BC&T',
      'https://scontent.fcgh3-1.fna.fbcdn.net/v/t1.6435-9/175567668_4171687459530587_7737148708078795681_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_ohc=gli7gBIBNnoAX9Z3PQ7&_nc_ht=scontent.fcgh3-1.fna&oh=00_AT9D8CQdhdlHBPIl7RcXYUMn043ec4ws2N9L7yS9GgKBOA&oe=63793404',
      ' :)\nDiscente de Ciência & Tecnologia. Podem me chamar no wpp para tirar dúvidas de disciplinas que já cursei!',
      15, [
    'Processamento de Informação',
    'Programação Estruturada',
    'Algoritmos e Estruturas de Dados',
    'Programação Orientada à Objetos',
    'Álgebra Linear',
    'Fenômenos Eletromagnéticos',
    'Compiladores',
    'Programação Matemática'
  ], [
    Post(
        'Inversão de Matrizes',
        'lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
        '04/12/2022',
        0,
        false),
    Post(
        'Método Simplex Dual',
        '- Encontre o Dual a partir do problema primal\n- Escolha o termo de Xb mais negativo para sair da base\n- Se existem coeficientes <= 0 na linha, escolha a menor razão entre os coeficientes e os "custos reduzidos", determinando assim a variável que sai da base\n- Caso contrário o problema é ilimitado. Pare\n- Realize a operação de pivoteamento e canonize a coluna do pivô que entra na base, como previsto no algoritmo Simplex\n- Se Xb >= 0 então a solução ótima foi encontrada, caso contrário retorne ao procedimento de troca de variáveis na base',
        '15/05/2017',
        0,
        false),
    Post(
        'Estrutura de Dados',
        'absque sudore et labore nulum opus perfectum est lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
        '15/05/2017',
        0,
        false)
  ]);

  aumentaSeguidores() {
    setState(() {
      if (!isFollowing) {
        usuario.seguidores++;
        isFollowing = true;
        followBtnWidth = 95.0;
        lblFollow = 'Seguindo';
      } else {
        usuario.seguidores--;
        isFollowing = false;
        followBtnWidth = 74.0;
        lblFollow = 'Seguir';
      }
    });
  }

  acessaDisciplinas() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DisciplinesPage(
                  usuario: usuario,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              SizedBox(
                height: margin,
              ),
              CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('images/user-icon.jpg')),
              SizedBox(
                height: margin,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  usuario.nome,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  width: margin,
                ),
                SizedBox(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[900],
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          usuario.curso,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: margin,
              ),
              Text(
                usuario.bio,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.grey[850]),
              ),
              SizedBox(
                height: margin,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // BtnApp(
                  //   text: 'Editar',
                  // ),
                  // BtnApp(
                  //   text: 'Criar',
                  // ),
                  // BtnApp(
                  //   text: 'Compartilhar',
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text('${usuario.seguidores.toString()} seguidores'),
                  ),
                  BtnApp(
                    btnWidth: this.followBtnWidth,
                    text: this.lblFollow,
                    btnStyle: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                        textStyle: const TextStyle(fontSize: 15)),
                    onPressed: (() {
                      aumentaSeguidores();
                      print(this.usuario.seguidores);
                    }),
                  ),
                ],
              ),
              SizedBox(
                height: margin * 2,
              ),
              Column(
                children: [
                  BtnApp(
                    btnWidth: 250,
                    text: 'Disciplinas Feitas',
                    btnStyle: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                        textStyle: const TextStyle(fontSize: 25)),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisciplinesPage(
                                  usuario: usuario,
                                ))),
                  ),
                  SizedBox(
                    height: margin,
                  ),
                  BtnApp(
                    btnWidth: 250,
                    text: 'Posts',
                    btnStyle: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                        textStyle: const TextStyle(fontSize: 25)),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostsPage(
                                  usuario: usuario,
                                ))),
                  )
                ],
              ),
              // Column(
              //   children: [
              //     Text(
              //       "Tópicos que conhece",
              //       style: const TextStyle(
              //           fontWeight: FontWeight.w600, fontSize: 20),
              //     ),
              //     SizedBox(
              //       height: margin,
              //     ),
              //     ListView.separated(
              //       shrinkWrap: true,
              //       separatorBuilder: (BuildContext context, index) => Divider(
              //         height: margin / 2,
              //       ),
              //       itemCount: usuario.skills.length,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           decoration: BoxDecoration(
              //               color: Colors.green[100],
              //               borderRadius:
              //                   BorderRadius.all(Radius.circular(15))),
              //           child: Padding(
              //             padding: const EdgeInsets.all(0.8),
              //             child: ListTile(
              //               title: Text(usuario.skills[index]),
              //               subtitle: Text("Intermediário"),
              //             ),
              //           ),
              //         );
              //       },
              //     )
              //   ],
              // ),
              SizedBox(
                height: margin * 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Contatos",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () => openBrowser(
                            'https://www.facebook.com/pedro.certo/'),
                        tooltip: 'facebook',
                      ),
                      IconButton(
                        icon: Icon(Icons.whatsapp_rounded),
                        onPressed: () =>
                            openBrowser('Https://wa.me/5511949602714'),
                        tooltip: 'whatsapp',
                      )
                    ],
                  )
                ],
              )
            ],
          );
        }));
  }
}

class BtnApp extends StatelessWidget {
  const BtnApp(
      {Key? key,
      required this.text,
      required this.btnStyle,
      required this.btnWidth,
      required this.onPressed})
      : super(key: key);

  final String text;
  final ButtonStyle btnStyle;
  final double btnWidth;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: btnWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(children: [
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Color(0xFF0DA10D),
              Color(0xFF19D222),
              Color(0xFF57F542)
            ])),
          )),
          TextButton(style: btnStyle, onPressed: onPressed, child: Text(text)),
        ]),
      ),
    );
  }
}

Future<void> openBrowser(String url) async {
  if (!await launchUrlString(url)) {
    throw "Could not launch $url";
  }
}

void btnAppOnPressed(int comand, String? instructions) {
  switch (comand) {
    case 0:
      // _ProfileViewState.aumentaSeguidores();
      break;
    case 1:
      //Navigate(instructions) -> disciplinas feitas
      break;
    case 2:
      //Navigate -> posts
      break;
    default:
  }
}
