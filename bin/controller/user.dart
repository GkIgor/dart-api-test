import 'package:shelf/shelf.dart';

Response getUser(Request req) {
  print(req.context.values);
  return Response.ok('Hello, World!\n');
}
