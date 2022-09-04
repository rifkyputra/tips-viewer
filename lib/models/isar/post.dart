import 'package:isar/isar.dart';

part 'post.g.dart';

@Collection()
class PostIsar {
  int id = Isar.autoIncrement;

  @Index(unique: true)
  late final String sha;
  late final String title;
  late final String link;
  String? type;
}

extension SerializePost on PostIsar {
  static PostIsar fromApi(
    Map map, {
    String? type,
  }) {
    return PostIsar()
      ..sha = map['sha']
      ..title = map['name']
          .toString()
          .replaceAll(RegExp(r'(-(?![\s-])|(\.md)|(\.jpg)|(\.jpeg))'), ' ')
      ..link = map['_links']['self']
      ..type = type;
  }
}
