import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'environment/environment.prod.dart';
import 'router/router.config.dart';

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;

  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(router.call);

  final port = Environment.port;
  final server = await serve(handler, ip, port);

  print('Server listening on port ${server.port}');
}
