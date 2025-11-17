import 'package:flutter/material.dart';
import 'package:misa_ihost/core/constans/app_assets.dart';
import 'package:misa_ihost/core/constans/app_colors.dart';
import 'package:misa_ihost/widgets/app_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 10),
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
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
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
                      suffixIcon: const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  AppButton(
                    title: 'Đăng nhập',
                    onPressed: () {
                      // Handle login action
                    },
                    radius: 5,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Quên mật khẩu?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
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
        padding: EdgeInsetsGeometry.only(bottom: size.height * 0.05),
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
