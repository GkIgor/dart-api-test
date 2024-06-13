import 'dart:io';

class Environment {
  static int port =
      int.tryParse(Platform.environment['PORT'] ?? '8080') ?? 8080;

  static int databasePort =
      int.tryParse(Platform.environment['DATABASE_PORT'] ?? '5432') ?? 5432;

  static String databaseHost =
      Platform.environment['DATABASE_HOST'] ?? "localhost";

  static String databaseName =
      Platform.environment['DATABASE_NAME'] ?? "postgres";

  static String databaseUsername =
      Platform.environment['DATABASE_USERNAME'] ?? "postgres";

  static String databasePassword =
      Platform.environment['DATABASE_PASSWORD'] ?? "postgres";

  static int connectTimeout =
      int.tryParse(Platform.environment['CONNECT_TIMEOUT'] ?? '15') ?? 15;

  static int queryTimeout =
      int.tryParse(Platform.environment['QUERY_TIMEOUT'] ?? '30') ?? 30;

  static int maxConnectionCount =
      int.tryParse(Platform.environment['MAX_CONNECTION_COUNT'] ?? '12') ?? 12;
}
