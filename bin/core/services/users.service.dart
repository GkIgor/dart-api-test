import '../database/connection.dart';
import '../entity/users/users.entity.dart';

//@Injectable
class UsersService {
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'] ?? json['nome'],
        date: json['date'] ?? json['data_nascimento'],
        age: json['age'] ?? json['idade'],
        city: json['city'] ?? json['cidade'],
        state: json['state'] ?? json['estado'],
        street: json['street'] ?? json['rua'],
        district: json['district'] ?? json['bairro'],
      );

  static Map<String, dynamic> toJson(User user) => {
        'id': user.id,
        'name': user.name,
        'date': user.date,
        'age': user.age,
        'city': user.city,
        'state': user.state,
        'street': user.street,
        'district': user.district,
      };

  static Future<Map<String, dynamic>> findAll(String table) async {
    return Database.pool.withConnection(
      (conn) async {
        final query = await conn.execute('SELECT * FROM $table');
        print(query.first.toColumnMap());
        User user = User.fromMap(query.first.toColumnMap());
        return toJson(user);
      },
    );
  }

  static Future<User> getUserById(int id) async {
    return Database.pool.withConnection(
      (conn) async {
        final query =
            await conn.execute('SELECT * FROM users WHERE user.id = $id');

        return fromJson(query.first.toColumnMap());
      },
    );
  }

  static Future<Map<String, dynamic>> createUser(User user) async {
    return Database.pool.withConnection(
      (conn) async {
        final String data = user.toStringForDb();
        final query = await conn.execute(
          'INSERT INTO users (nome, data_nascimento, idade, cidade, estado, rua, bairro) VALUES ( $data ) RETURNING *; ',
        );
        print('\n\n\n ${query.first.toColumnMap()}\n\n\n');
        return query.first.toColumnMap();
      },
    );
  }
}
