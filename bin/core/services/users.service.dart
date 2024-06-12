//@Injectable

import 'package:postgres/postgres.dart';

import '../../database/connection.dart';
import '../entity/users/users.entity.dart';

class Users {
  late final Database _database;
  Users() {
    _database = Database(
      host: 'localhost',
      port: 5432,
      database: 'postgres',
      username: 'postgres',
      password: 'postgres',
    );
  }

  Future<ResultSchema> findAll(String table) async {
    final query = await _database.findAllTable(table);
    return query.schema;
  }

  Future<ResultSchema> findUser(int id) async {
    final query = await _database.findUserById(id);
    return query.schema;
  }

  Future<ResultSchema> createUser(User user) async {
    final query = await _database.createUser(user);
    return query.schema;
  }
}
