import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../core/services/users.service.dart';

Future<Response> getUsers(Request request) async {
  final jsonUsers = await UsersService.findAll('users');
  print('\n\n\n $jsonUsers \n\n\n');
  return Response.ok(
    jsonEncode(jsonUsers),
    headers: {
      'Content-Type': 'application/json',
    },
  );
}

Future<Response> addUser(Request request) async {
  return Response.ok(
    jsonEncode(''),
    headers: {
      'Content-Type': 'application/json',
    },
  );
}
