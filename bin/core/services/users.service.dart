import 'dart:io';
import '../database/connection.dart';
import '../entity/users/users.entity.dart';

//@Injectable
class UsersService {
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        date: DateTime.parse(json['date']),
        age: json['age'],
        city: json['city'],
        state: json['state'],
        street: json['street'],
        district: json['district'],
      );

  static Map<String, dynamic> toJson(User user) => {
        'id': user.id,
        'name': user.name,
        'date': user.date.toIso8601String(),
        'age': user.age,
        'city': user.city,
        'state': user.state,
        'street': user.street,
        'district': user.district,
      };

  static Future<Map<String, dynamic>> findAll(
    String table,
  ) async {
    return Database.pool.withConnection(
      (conn) async {
        final query = await conn.execute('SELECT * FROM $table');
        print(query);
        return UsersService.toJson(query.first.first as User);
      },
    );
  }

  static Future<dynamic> findUser(int id, HttpRequest req) async {}

  static Future<dynamic> createUser(User user, HttpRequest req) async {}
}
