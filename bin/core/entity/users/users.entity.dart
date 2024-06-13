// @Entity
class User {
  final int _id;
  final String _name;
  final DateTime _date;
  final int _age;
  final String _city;
  final String _state;
  final String _street;
  final String _district;

  User({
    required int id,
    required String name,
    required DateTime date,
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
        _name = user['name'],
        _date = user['date'],
        _age = user['age'],
        _city = user['city'],
        _state = user['state'],
        _street = user['street'],
        _district = user['district'];

  int get id => _id;
  String get name => _name;
  DateTime get date => _date;
  int get age => _age;
  String get city => _city;
  String get state => _state;
  String get street => _street;
  String get district => _district;
}
