// @Entity
class User {
  final int? _id;
  final String _name;
  final dynamic _date;
  final int _age;
  final String _city;
  final String _state;
  final String _street;
  final String _district;

  User({
    int? id,
    required String name,
    required dynamic date,
    required int age,
    required String city,
    required String state,
    required String street,
    required String district,
  })  : _id = id,
        _name = name,
        _date = date,
        _age = age,
        _city = city,
        _state = state,
        _street = street,
        _district = district;

  User.fromMap(Map<String, dynamic> user)
      : _id = user['id'],
        _name = user['nome'] ?? user['name'],
        _date = user['data_nascimento'] ?? user['date'],
        _age = user['idade'] ?? user['age'],
        _city = user['cidade'] ?? user['city'],
        _state = user['estado'] ?? user['state'],
        _street = user['rua'] ?? user['street'],
        _district = user['bairro'] ?? user['district'];

  int? get id => _id;
  String get name => _name;
  String get date => _date;
  int get age => _age;
  String get city => _city;
  String get state => _state;
  String get street => _street;
  String get district => _district;

  @override
  String toString() {
    return 'id: $id, name: $name, date: $date, age: $age, city: $city, state: $state, street: $street, district: $district';
  }

  String toStringForDb() {
    return ' \'$name\', \'$date\', \'$age\', \'$city\', \'$state\', \'$street\', \'$district\'';
  }
}
