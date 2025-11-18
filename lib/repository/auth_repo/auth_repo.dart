import 'package:misa_ihost/repository/auth_repo/request/login_request.dart';

abstract class AuthRepo {
  //login
  Future<dynamic> login({required LoginRequest request});
}
