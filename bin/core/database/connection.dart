import 'package:postgres/postgres.dart';

import '../../environment/environment.prod.dart';

class Database {
  static final Pool pool = Pool.withEndpoints(
    [
      _endpoint,
    ],
    settings: _settings,
  );
}

PoolSettings _settings = PoolSettings(
  sslMode: SslMode.disable,
  applicationName: 'dart api for test',
  connectTimeout: _connectTimeout,
  queryTimeout: _queryTimeout,
  maxConnectionCount: _maxConnectionCount,
);

Duration _connectTimeout = Duration(seconds: Environment.connectTimeout);
Duration _queryTimeout = Duration(seconds: Environment.queryTimeout);

int _maxConnectionCount = Environment.maxConnectionCount;

Endpoint _endpoint = Endpoint(
  host: Environment.databaseHost,
  port: Environment.databasePort,
  database: Environment.databaseName,
  username: Environment.databaseUsername,
  password: Environment.databasePassword,
);


// class Database {
//   late Connection _conn;
//   late Endpoint _endpoint;

//   Database({
//     required String host,
//     required int port,
//     required String database,
//     required String username,
//     required String password,
//   }) {
//     try {
//       _endpoint = Endpoint(
//         host: host,
//         port: port,
//         database: database,
//         username: username,
//         password: password,
//       );
//     } catch (e) {
//       throw Exception('Database is empty');
//     }
//   }

//   void _startConnectionIfNoOpen() async {
//     if (_conn.isOpen) return;
//     await startConnection();
//   }

//   Future<void> startConnection() async {
//     _conn = await Connection.open(_endpoint);
//   }

//   void stopConnection() async {
//     _conn.close();
//   }

//   Future<Result> findAllTable(String table) async {
//     _startConnectionIfNoOpen();
//     return await _conn.execute('SELECT * FROM $table');
//   }

//   Future<Result> findUserById(int id) async {
//     _startConnectionIfNoOpen();
//     return await _conn.execute('SELECT * from users WHERE id=$id');
//   }

//   Future<Result> createUser(User user) {
//     _startConnectionIfNoOpen();
//     final parameters = {
//       'nome': user.name,
//       'data_nascimento': user.date,
//       'idade': user.age,
//       'cidade': user.city,
//       'estado': user.state,
//       'rua': user.street,
//       'bairro': user.district
//     };

//     return _conn.execute(
//       'INSERT INTO users (nome, data_nascimento, idade, cidade, estado, rua, bairro) VALUES (@1, @2, @3, @4, @5, @6, @7) RETURNING *',
//       parameters: parameters,
//     );
//   }

//   Future<Result> deleteUser(int id) async {
//     _startConnectionIfNoOpen();
//     return _conn.execute('DELETE FROM users WHERE id=$id');
//   }
// }
