import 'package:isar/isar.dart';

part 'github.g.dart';

@Collection()
class GithubConfigIsar {
  int id = Isar.autoIncrement;

  late String token;
}
