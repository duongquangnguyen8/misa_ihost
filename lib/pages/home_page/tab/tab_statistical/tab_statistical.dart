import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misa_ihost/core/constans/app_assets.dart';
import 'package:misa_ihost/core/constans/app_colors.dart';
import 'package:misa_ihost/helper/widget_helper.dart';
import 'package:misa_ihost/pages/home_page/tab/tab_statistical/tab_statistical_controller.dart';
import 'package:fl_chart/fl_chart.dart';

class TabStatisticalPage extends StatelessWidget {
  const TabStatisticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Register controller once for this page
    Get.put(TabStatisticalController());
    final controller = Get.find<TabStatisticalController>();
    final width = MediaQuery.of(context).size.width;
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
                          index: 0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildTabHeader(
                          icon: Icons.pie_chart,
                          title: 'Tài sản',
                          index: 1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildTabHeader(
                          icon: Icons.people,
                          title: 'Nhân sự',
                          index: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildCardChart(
                            context,
                            controller,
                            width,
                            title: 'Cơ cấu CBNV theo loại cán bộ',
                            child: Column(
                              children: [
                                Obx(() {
                                  final touched = controller.touchedIndex.value;
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 260,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Tổng CBNV',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                '150',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        PieChart(
                                          PieChartData(
                                            centerSpaceRadius: 60,
                                            sectionsSpace: 0,
                                            // centerSpaceColor: Colors.amber,
                                            pieTouchData: PieTouchData(
                                              enabled: true,
                                              longPressDuration: const Duration(
                                                milliseconds: 300,
                                              ),
                                              touchCallback:
                                                  (
                                                    FlTouchEvent event,
                                                    pieTouchResponse,
                                                  ) {
                                                    // We only toggle selection on tap up
                                                    if (event is FlTapUpEvent) {
                                                      if (pieTouchResponse ==
                                                              null ||
                                                          pieTouchResponse
                                                                  .touchedSection ==
                                                              null) {
                                                        // tapped outside -> deselect
                                                        controller
                                                            .setTouchedIndex(
                                                              -1,
                                                            );
                                                        return;
                                                      }

                                                      final idx = pieTouchResponse
                                                          .touchedSection!
                                                          .touchedSectionIndex;
                                                      // toggle: if already selected -> deselect, else select
                                                      if (controller
                                                              .touchedIndex
                                                              .value ==
                                                          idx) {
                                                        controller
                                                            .setTouchedIndex(
                                                              -1,
                                                            );
                                                      } else {
                                                        controller
                                                            .setTouchedIndex(
                                                              idx,
                                                            );
                                                      }
                                                    }
                                                    // ignore other events (hover/move/press)
                                                  },
                                            ),
                                            sections: [
                                              PieChartSectionData(
                                                color: Colors.blue,
                                                value: 40,
                                                title: '',
                                                radius: touched == 0
                                                    ? width * 0.2
                                                    : width * 0.17,
                                                titleStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              PieChartSectionData(
                                                color: Colors.orange,
                                                value: 30,
                                                title: '',
                                                radius: touched == 1
                                                    ? width * 0.2
                                                    : width * 0.17,
                                                titleStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              PieChartSectionData(
                                                color: Colors.green,
                                                value: 20,
                                                title: '',
                                                radius: touched == 2
                                                    ? width * 0.2
                                                    : width * 0.17,
                                                titleStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              PieChartSectionData(
                                                color: Colors.red,
                                                value: 10,
                                                title: '',
                                                radius: touched == 3
                                                    ? width * 0.2
                                                    : width * 0.17,
                                                titleStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                                const SizedBox(height: 10),
                                _buildDescriptionItem(
                                  color: Colors.red,
                                  title: 'Cán bộ',
                                  percentage: '10%',
                                  value: '10',
                                  context: context,
                                ),
                                const SizedBox(height: 10),
                                _buildDescriptionItem(
                                  color: Colors.blue,
                                  title: 'Nhân viên',
                                  percentage: '40%',
                                  value: '40',
                                  context: context,
                                ),
                                const SizedBox(height: 10),
                                _buildDescriptionItem(
                                  color: Colors.orange,
                                  title: 'Lao động hợp đồng',
                                  percentage: '25%',
                                  value: '25',
                                  context: context,
                                ),
                                const SizedBox(height: 10),
                                _buildDescriptionItem(
                                  color: Colors.green,
                                  title: 'Thực tập sinh',
                                  percentage: '15%',
                                  value: '15',
                                  context: context,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          _buildCardChart(
                            context,
                            controller,
                            width,
                            isBarChart: true,
                            title: 'CƠ CẤU CBNV THEO ĐỘ TUỔI',
                            child: SizedBox(
                              height: 310,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  AspectRatio(
                                    aspectRatio: 1.15,
                                    child: BarChart(
                                      BarChartData(
                                        maxY: 400,
                                        borderData: FlBorderData(
                                          show: true,
                                          border: Border(
                                            left: BorderSide(
                                              color: Colors.grey.withValues(
                                                alpha: 0.5,
                                              ),
                                              width: 1,
                                            ),
                                            bottom: BorderSide(
                                              color: Colors.grey.withValues(
                                                alpha: 0.5,
                                              ),
                                              width: 1,
                                            ),
                                            right: BorderSide.none,
                                            top: BorderSide.none,
                                          ),
                                        ),
                                        titlesData: FlTitlesData(
                                          show: true,
                                          rightTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: false,
                                            ),
                                          ),
                                          topTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: false,
                                            ),
                                          ),
                                          leftTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              reservedSize: 40,
                                            ),
                                          ),
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              reservedSize: 40,
                                            ),
                                          ),
                                        ),

                                        gridData: FlGridData(
                                          drawVerticalLine: false,
                                          drawHorizontalLine: true,
                                          getDrawingHorizontalLine: (value) {
                                            return FlLine(
                                              color: Colors.grey.withValues(
                                                alpha: 0.3,
                                              ),
                                              strokeWidth: 1,
                                              dashArray: null, // solid line
                                            );
                                          },
                                          checkToShowHorizontalLine: (value) {
                                            return true; // show all horizontal lines
                                          },
                                        ),
                                        barGroups: [
                                          BarChartGroupData(
                                            x: 1,
                                            barRods: [
                                              BarChartRodData(
                                                toY: 330,
                                                color: Colors.blue,
                                                width: 50,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          BarChartGroupData(
                                            x: 2,
                                            barRods: [
                                              BarChartRodData(
                                                toY: 250,
                                                color: Colors.orange,
                                                width: 50,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                        barTouchData: BarTouchData(
                                          enabled: true,
                                          handleBuiltInTouches: false,
                                          touchCallback: (event, response) {
                                            if (response != null &&
                                                response.spot != null &&
                                                event is FlTapUpEvent) {
                                              // setState(() {
                                              //   final x = response
                                              //       .spot!
                                              //       .touchedBarGroup
                                              //       .x;
                                              //   final isShowing =
                                              //       showingTooltip == x;
                                              //   if (isShowing) {
                                              //     showingTooltip = -1;
                                              //   } else {
                                              //     showingTooltip = x;
                                              //   }
                                              // });
                                            }
                                          },
                                          mouseCursorResolver:
                                              (event, response) {
                                                return response == null ||
                                                        response.spot == null
                                                    ? MouseCursor.defer
                                                    : SystemMouseCursors.click;
                                              },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardChart(
    BuildContext context,
    TabStatisticalController controller,
    double width, {
    required String title,
    required Widget child,
    bool? isBarChart = false,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset(
                AssetImages.icon_reload,
                width: 20,
                height: 20,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Kỳ: Năm nay',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
          child,
          Visibility(visible: !isBarChart!, child: const SizedBox(height: 20)),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Số liệu tính đến 10:25 AM',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionItem({
    required Color color,
    required String title,
    required String percentage,
    required String value,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Row(
              children: [
                CircleAvatar(radius: 6, backgroundColor: color),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  percentage,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabHeader({IconData? icon, String? title, required int index}) {
    // Find the existing controller instance
    final controller = Get.find<TabStatisticalController>();
    return Obx(() {
      final checkSelectedIndex = controller.selectedTabIndex.value == index;
      return InkWell(
        onTap: () {
          controller.changeTabIndex(index);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: checkSelectedIndex ? AppColors.primaryColor : Colors.grey,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon ?? Icons.bar_chart,
                color: checkSelectedIndex
                    ? AppColors.primaryColor
                    : Colors.grey,
                size: 30,
              ),
              const SizedBox(height: 2),
              Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 14,
                  color: checkSelectedIndex
                      ? AppColors.primaryColor
                      : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
