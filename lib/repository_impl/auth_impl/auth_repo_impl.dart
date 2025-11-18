import 'package:dio/dio.dart';
import 'package:misa_ihost/config/dio/dio_client.dart';
import 'package:misa_ihost/core/constans/api_paths.dart';
import 'package:misa_ihost/core/exceptions/api_exception.dart';
import 'package:misa_ihost/repository/auth_repo/auth_repo.dart';
import 'package:misa_ihost/repository/auth_repo/request/login_request.dart';
import 'package:misa_ihost/repository/auth_repo/response/login_response.dart';

class AuthRepoImpl implements AuthRepo {
  final DioClient dioClient;
  AuthRepoImpl({required this.dioClient});

  @override
  Future<dynamic> login({required LoginRequest request}) async {
    try {
      final response = await dioClient.post(
        ApiPaths.login,
        data: request.toJson(),
      );

      // response.data là inner Data payload từ server
      final loginResponse = LoginResponse.fromJson(response);
      print('Login successful: Token = ${loginResponse.token}');
      return loginResponse;
    } on DioException catch (dioError) {
      if (dioError.error is ApiException) {
        final apiEx = dioError.error as ApiException;
        if (apiEx.code == 122) {
          //đăng nhập lần đầu chưa có deviceId trong hệ thống
          final loginResponseFirst = LoginResponseFirst.fromJson(
            dioError.response?.data['Data'],
          );
          return loginResponseFirst;
        }
      }
    } catch (error) {
      print('❌ Unexpected Error: $error');
      rethrow;
    }
  }
}
