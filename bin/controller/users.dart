import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../core/entity/users/users.entity.dart';
import '../core/services/users.service.dart';

Future<Response> getUsers(Request request) async {
  final jsonUsers = await UsersService.findAll('users');
  return Response.ok(
    jsonEncode(jsonUsers),
    headers: {
      'Content-Type': 'application/json',
    },
  );
}

Future<Response> addUser(Request request) async {
  final buffer = StringBuffer();
  try {
    await for (final chunk in request.read()) {
      buffer.write(utf8.decode(chunk));
    }

    final data = jsonDecode(buffer.toString());

    if (data is! Map<String, dynamic>) {
      return Response.badRequest(body: '$data is no valid json');
    }

    final User user = User.fromMap(data);
    return Response.ok(
      jsonEncode(await UsersService.createUser(user)),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  } catch (e, s) {
    print('\n\n$s');
    final String response =
        '\n${jsonDecode(buffer.toString())}\n is invalid for create new user\n\n ${e.toString()}';
    return Response.badRequest(body: response);
  }
}

Future<Response> getUsersById(Request request) async {
  try {
    final String? id = request.params['id'];

    if (id == null || int.tryParse(id) == null) {
      return Response.badRequest(body: 'id is required or not is valid number');
    }

    final user = await UsersService.getUserById(int.parse(id));
    return Response.ok(
      jsonEncode(user),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  } catch (e, s) {
    print('\n\n$e');
    print('\n\n$s');
    final String? id = request.params['id'];
    Map<String, String> responseMessageError = {
      'message': '$id no a valid id',
    };
    return Response.badRequest(
      body: jsonEncode(responseMessageError),
    );
  }
}
