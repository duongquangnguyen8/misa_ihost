import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misa_ihost/core/constans/app_colors.dart';
import 'package:misa_ihost/pages/home_page/home_controller.dart';
import 'package:misa_ihost/pages/home_page/tab/tab_chat/tab_chat.dart';
import 'package:misa_ihost/pages/home_page/tab/tab_list/tab_list.dart';
import 'package:misa_ihost/pages/home_page/tab/tab_listing/tab_listing_page.dart';
import 'package:misa_ihost/pages/home_page/tab/tab_more/tab_more.dart';
import 'package:misa_ihost/pages/home_page/tab/tab_statistical/tab_statistical.dart';
import '../../core/constans/app_assets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  final _pages = [
    const TabListingPage(),
    const TabListPage(),
    const TabStatisticalPage(),
    const TabChatPage(),
    const TabMorePage(),
  ];

  final List<Map<String, String>> _bottomItems = [
    {'icon': AssetImages.icon_list, 'label': 'Bảng tin'},
    {'icon': AssetImages.icon_person, 'label': 'Danh bạ'},
    {'icon': AssetImages.icon_bar_chart, 'label': 'Báo cáo'},
    {'icon': AssetImages.icon_chat, 'label': 'Chat'},
    {'icon': AssetImages.icon_menu, 'label': 'Thêm'},
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: _pages[controller.currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: controller.currentIndex.value,
        onTap: controller.selectedIndex,
        items: _bottomItems.map((item) {
          int index = _bottomItems.indexOf(item);
          return BottomNavigationBarItem(
            icon: Image.asset(
              item['icon']!,
              width: 24,
              color: controller.currentIndex.value == index
                  ? AppColors.primaryColor
                  : Colors.black,
            ),
            label: item['label'],
          );
        }).toList(),
      ),
    ));
  }
}