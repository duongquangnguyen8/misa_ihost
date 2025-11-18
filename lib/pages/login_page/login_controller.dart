import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:misa_ihost/config/app/app_config.dart';
import 'package:misa_ihost/helper/validation_helper.dart';
import 'package:misa_ihost/helper/widget_helper.dart';
import 'package:misa_ihost/repository/auth_repo/auth_repo.dart';
import 'package:misa_ihost/repository/auth_repo/request/login_request.dart';
import 'package:misa_ihost/repository/auth_repo/response/login_response.dart';
import 'package:misa_ihost/route/route_paths.dart';

class LoginController extends GetxController {
  final AuthRepo authRepo;
  LoginController({required this.authRepo});
  var username = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var isShowPassword = false.obs;

  //handle toggle show/hide password
  void toggleShowPassword() {
    isShowPassword.value = !isShowPassword.value;
  }

  // handle login
  Future<void> handleLogin(BuildContext context) async {
    // Trim inputs
    final userName = username.value.trim();
    final pass = password.value.trim();

    if (userName.isEmpty) {
      WidgetHelper.showToastError(title: 'Vui lòng nhập tên đăng nhập');
      return;
    }

    if (pass.isEmpty) {
      WidgetHelper.showToastError(title: 'Vui lòng nhập mật khẩu');
      return;
    }

    final isEmail = userName.contains('@');
    if (isEmail) {
      if (!ValidationHelper.isValidEmail(userName)) {
        WidgetHelper.showToastError(title: 'Địa chỉ email không hợp lệ');
        return;
      }
    } else {
      if (userName.length < 6) {
        WidgetHelper.showToastError(
          title: 'Tên đăng nhập phải có ít nhất 6 ký tự',
        );
        return;
      }
      if (userName.contains(' ')) {
        WidgetHelper.showToastError(
          title: 'Tên đăng nhập không được chứa khoảng trắng',
        );
        return;
      }
    }

    if (pass.length < 6) {
      WidgetHelper.showToastError(title: 'Mật khẩu phải có ít nhất 6 ký tự');
      return;
    }

    username.value = userName;
    password.value = pass;
    isLoading.value = true;

    //lấy deviceId
    final deviceId = await AppConfig.getDeviceId();

    final response = await authRepo.login(
      request: LoginRequest(
        deviceId: deviceId,
        password: password.value,
        userName: username.value,
      ),
    );

    isLoading.value = false;

    if (response.runtimeType == LoginResponse) {
      //sang home
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(RoutePaths.home, (route) => true);
    } else if (response.runtimeType == LoginResponseFirst) {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(RoutePaths.confirmOtp, (route) => true);
    } else {
      print('Chưa vào');
    }
  }
}
