import 'package:shelf_router/shelf_router.dart';

import '../controller/hello.dart';
import '../controller/users.dart';

// Configure routes.
final router = Router()
  ..get('/', rootHandler)
  ..get('/echo/<message>', echoHandler)
  ..get('/users', getUsers)
  ..get('/users/<id>', getUsers);
