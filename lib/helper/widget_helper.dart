import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:misa_ihost/core/constans/app_colors.dart';

class WidgetHelper {
  static void showToastError({
    String? title,
    Color? bgColor,
    Color? textColor,
    double? sizeText,
  }) {
    Fluttertoast.showToast(
      msg: title ?? "Error",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor ?? Colors.black.withValues(alpha: 0.2),
      textColor: textColor ?? Colors.white,
      fontSize: sizeText ?? 16.0,
    );
  }

  static void showToastSuccess({
    String? title,
    Color? bgColor,
    Color? textColor,
    double? sizeText,
  }) {
    Fluttertoast.showToast(
      msg: title ?? "Success",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor ?? Colors.green,
      textColor: textColor ?? Colors.white,
      fontSize: sizeText ?? 16.0,
    );
  }

  //header
  static Widget buildIconHeader({
    String? imageUrl,
    Color? color,
    IconData? icon,
  }) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Column(
        children: [
          imageUrl != null
              ? Image.asset(imageUrl, width: 24)
              : Icon(
                  icon ?? Icons.star,
                  color: color ?? AppColors.primaryColor.withValues(alpha: 0.7),
                  size: 24,
                ),
        ],
      ),
    );
  }
}
