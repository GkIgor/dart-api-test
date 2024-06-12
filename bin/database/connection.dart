import 'package:postgres/postgres.dart';

import '../core/entity/users/users.entity.dart';

class Database {
  late final Connection _conn;
  late final Endpoint _endpoint;

  Database({
    required String host,
    required int port,
    required String database,
    required String username,
    required String password,
  }) {
    try {
      _endpoint = Endpoint(
        host: host,
        port: port,
        database: database,
        username: username,
        password: password,
      );
    } catch (e) {
      throw Exception('Database is empty');
    }
  }

  void startConnection() async {
    _conn = await Connection.open(_endpoint);
  }

  void stopConnection() async {
    _conn.close();
  }

  Future<Result> findAllTable(String table) async {
    return await _conn.execute('SELECT * FROM $table');
  }

  Future<Result> findUserById(int id) async {
    return await _conn.execute('SELECT * from users WHERE id=$id');
  }

  Future<Result> createUser(User user) {
    final parameters = {
      'nome': user.name,
      'data_nascimento': user.date,
      'idade': user.age,
      'cidade': user.city,
      'estado': user.state,
      'rua': user.street,
      'bairro': user.district
    };

    return _conn.execute(
      'INSERT INTO users (nome, data_nascimento, idade, cidade, estado, rua, bairro) VALUES (@1, @2, @3, @4, @5, @6, @7) RETURNING *',
      parameters: parameters,
    );
  }

  Future<Result> deleteUser(int id) async {
    return _conn.execute('DELETE FROM users WHERE id=$id');
  }
}
