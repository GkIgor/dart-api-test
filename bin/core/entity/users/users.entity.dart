// @Entity
class User {
  late final int _id;
  late final String _name;
  late final DateTime _date;
  late final int _age;
  late final String _city;
  late final String _state;
  late final String _street;
  late final String _district;

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
        _age = age,
        _city = city,
        _date = date,
        _district = district,
        _state = state,
        _street = street;

  int get id => _id;
  String get name => _name;
  DateTime get date => _date;
  int get age => _age;
  String get city => _city;
  String get state => _state;
  String get street => _street;
  String get district => _district;
}
