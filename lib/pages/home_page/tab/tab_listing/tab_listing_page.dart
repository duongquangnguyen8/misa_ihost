import 'package:flutter/material.dart';
import 'package:misa_ihost/core/constans/app_colors.dart';
import 'package:misa_ihost/helper/widget_helper.dart';

import '../../../../core/constans/app_assets.dart';

class TabListingPage extends StatelessWidget {
  const TabListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withValues(alpha: 0.25),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Bảng tin',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.keyboard_arrow_down, size: 24),
                      ],
                    ),
                    Row(
                      children: [
                        WidgetHelper.buildIconHeader(color: Colors.red),
                        const SizedBox(width: 8),
                        WidgetHelper.buildIconHeader(icon: Icons.search),
                        const SizedBox(width: 8),
                        WidgetHelper.buildIconHeader(
                          icon: Icons.notifications_active,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Color(0xffE3DFE4FF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 0.5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconOption(
                    color: Colors.deepPurpleAccent,
                    title: 'Quy trình',
                  ),
                  _buildIconOption(
                    color: Colors.lightGreen,
                    title: 'Công việc',
                  ),
                  _buildIconOption(color: Colors.yellow, title: 'Cần ký'),
                  _buildIconOption(color: Colors.red, title: 'Tùy chỉnh'),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(color: Colors.white, child: _buildListings()),
          ],
        ),
      ),
    );
  }

  //danh sách bài viết
  Widget _buildListings() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 10,
      separatorBuilder: (context, index) =>
          Container(height: 10, color: Colors.grey.withValues(alpha: 0.3)),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurple.withValues(alpha: 0.3),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'QD',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nguyễn Quang Dương',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // SizedBox(height: 2,),
                            Text(
                              '3 ngày trước',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_horiz),
                ],
              ),
              const SizedBox(height: 10),
              Text('Chào mừng bạn đến với Misa'),
              const SizedBox(height: 13),
              Row(
                children: [
                  Icon(Icons.file_copy_outlined, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Tệp đính kèm (1)',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: 155,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Icon(Icons.file_copy_rounded, color: Colors.green),
                    SizedBox(width: 5),
                    Text(
                      'Screens...iHos.png',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.blue, size: 22),
                      const SizedBox(width: 2),
                      Text('10', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Text(
                    '5 người xem',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ],
              ),
              Divider(thickness: 1, color: Colors.grey, height: 20),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border),
                        const SizedBox(width: 5),
                        Text(
                          'Thích',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.comment),
                        const SizedBox(width: 5),
                        Text(
                          'Bình luận',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIconOption({
    String? imageUrl,
    Color? color,
    IconData? icon,
    String? title,
  }) {
    //
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Column(
            children: [
              imageUrl != null
                  ? Image.asset(imageUrl, width: 30)
                  : Icon(
                      icon ?? Icons.star,
                      color:
                          color ??
                          AppColors.primaryColor.withValues(alpha: 0.7),
                      size: 30,
                    ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title ?? '',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
