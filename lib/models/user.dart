import 'package:mmo_mobile/models/post.dart';

class User {
  final String nome;
  final String curso;
  final String imageUrl;
  final String bio;
  int seguidores;
  final List<String> skills;
  List<Post> posts;

  User(this.nome, this.curso, this.imageUrl, this.bio, this.seguidores,
      this.skills, this.posts);

  addSkills(String skill) {
    skills.insert(0, skill);
  }
}
