import 'package:flutter/material.dart';
import 'package:misa_ihost/core/constans/app_colors.dart';
import 'package:misa_ihost/helper/widget_helper.dart';

class TabStatisticalPage extends StatelessWidget {
  const TabStatisticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withValues(alpha: 0.25),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SafeArea(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng quan',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  WidgetHelper.buildIconHeader(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildTabHeader(
                          icon: Icons.bar_chart,
                          title: 'Tài chính/NS',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildTabHeader(
                          icon: Icons.pie_chart,
                          title: 'Tài sản',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildTabHeader(
                          icon: Icons.people,
                          title: 'Nhân sự',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabHeader({IconData? icon, String? title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.primaryColor),
      ),
      child: Column(
        children: [
          Icon(
            icon ?? Icons.bar_chart,
            color: AppColors.primaryColor,
            size: 30,
          ),
          const SizedBox(height: 2),
          Text(
            title ?? '',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
