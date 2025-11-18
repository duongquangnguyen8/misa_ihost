import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misa_ihost/core/constans/app_assets.dart';
import 'package:misa_ihost/core/constans/app_colors.dart';
import 'package:misa_ihost/dependency_injection/service_locator.dart';
import 'package:misa_ihost/pages/home_page/home_page.dart';
import 'package:misa_ihost/pages/login_page/login_controller.dart';
import 'package:misa_ihost/repository/auth_repo/auth_repo.dart';
import 'package:misa_ihost/route/app_navigator.dart';
import 'package:misa_ihost/route/route_paths.dart';
import 'package:misa_ihost/widgets/app_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(LoginController(authRepo: sl<AuthRepo>()));
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.15),
                  Image.asset(
                    AssetImages.icon_logo_login,
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'MISA iHOS',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Số điện thoại/Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onChanged: (value) {
                      controller.username.value = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !controller.isShowPassword.value,
                      decoration: InputDecoration(
                        hintText: 'Mật khẩu',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        suffixIcon: Obx(
                          () => GestureDetector(
                            onTap: () => controller.toggleShowPassword(),
                            child: Icon(
                              controller.isShowPassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ),
                      onChanged: (value) => controller.password.value = value,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Obx(
                    () => AppButton(
                      onPressed: () async {
                        controller.handleLogin(context);
                      },
                      radius: 5,
                      color: AppColors.primaryColor,
                      child: Center(
                        child: controller.isLoading.value
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Đăng nhập',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      AppNavigator.navigate(
                        context,
                        RoutePaths.home,
                        isReplace: true,
                      );
                    },
                    child: Text(
                      'Quên mật khẩu?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Add your login form here
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.05),
        child: SizedBox(
          height: 50,
          child: Center(
            child: SafeArea(
              child: Image.asset(
                AssetImages.img_logo_misa,
                width: 120,
                height: 120,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
