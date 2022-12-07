import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'models/user.dart';

class PostsPage extends StatefulWidget {
  final User usuario;
  const PostsPage({super.key, required this.usuario});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  int indexPost = 0;
  Icon unliked = Icon(
    Icons.favorite_outline,
    color: Colors.black,
  );

  Icon liked = Icon(
    Icons.favorite,
    color: Colors.red,
  );

  clickLike() {
    setState(() {
      if (!this.widget.usuario.posts[indexPost].isLiked) {
        this.widget.usuario.posts[indexPost].likes++;
        this.widget.usuario.posts[indexPost].isLiked = true;
      } else {
        this.widget.usuario.posts[indexPost].likes--;
        this.widget.usuario.posts[indexPost].isLiked = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Posts de " + this.widget.usuario.nome)),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('images/user-icon.jpg')),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  this.widget.usuario.nome,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  width: 10,
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
                          this.widget.usuario.curso,
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
                height: 10,
              ),
              Text(
                this.widget.usuario.bio,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.grey[850]),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: this.widget.usuario.posts.length,
                separatorBuilder: (context, index) => Divider(height: 10),
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(85, 148, 148, 148),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            this.widget.usuario.posts[index].titulo,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            height: 5,
                          ),
                          Text(
                            this.widget.usuario.posts[index].conteudo,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          ),
                          Divider(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    indexPost = index;
                                    clickLike();
                                  },
                                  icon: this.widget.usuario.posts[index].isLiked
                                      ? liked
                                      : unliked),
                              Text(
                                  "${this.widget.usuario.posts[index].likes.toString()} likes"),
                              Text(this.widget.usuario.nome,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w200,
                                  )),
                              Text(this.widget.usuario.curso,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w200,
                                  )),
                              Text(this.widget.usuario.posts[index].data,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w200,
                                  ))
                            ],
                          )
                        ],
                      ));
                },
              )
            ],
          ),
        ));
  }
}
