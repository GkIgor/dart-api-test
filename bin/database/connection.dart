import 'package:postgres/postgres.dart';

Future<Connection> name(params) {
  final host = 'localhost';
  final portDb = 5432;

  final endpoint = Endpoint(
    host: host,
    port: portDb,
    database: 'postgres',
    username: 'postgres',
    password: 'postgres',
  );

  final conn = Connection.open(endpoint);

  print('Connection open!');
  return conn;
}
