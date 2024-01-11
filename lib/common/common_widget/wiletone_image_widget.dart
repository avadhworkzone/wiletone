import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';

class WileToneImageWidget extends StatelessWidget {
  const WileToneImageWidget(
      {Key? key,
      required this.image,
      this.fit,
      this.height,
      this.width,
      this.color,
      this.scale,
      required this.imageType})
      : super(key: key);

  final String? image;
  final double? height;
  final double? width;
  final double? scale;
  final Color? color;
  final BoxFit? fit;
  final ImageType? imageType;

  @override
  Widget build(BuildContext context) {
    return imageType == ImageType.png
        ? Image.asset(
            image!,
            fit: fit,
            height: height,
            width: width,
            color: color,
            scale: scale,
          )
        : SvgPicture.asset(
            image!,
            height: height,
            width: width,
            color: color,
            fit: BoxFit.contain,
          );
  }
}

class BarChartSample1 extends StatefulWidget {
  BarChartSample1({super.key});

  List<Color> get availableColors => const <Color>[
        Colors.purple,
        Colors.yellow,
        Colors.blue,
        Colors.orange,
        Colors.pink,
        Colors.red,
        // AppColors.contentColorYellow,
        // AppColors.contentColorBlue,
        // AppColors.contentColorOrange,
        // AppColors.contentColorPink,
        // AppColors.contentColorRed,
      ];

  final Color barBackgroundColor = Colors.grey.shade300;
  final Color barColor = ColorUtils.greenColor;
  final Color touchedBarColor = ColorUtils.greenColor;

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex = -1;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(
                  height: 38,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BarChart(
                      mainBarData(),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),

          /// Play - Pause Button
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 12,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor.withOpacity(0.60))
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  Widget topTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.black, fontSize: 12);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '9k';
        break;
      case 1:
        text = '10k';
        break;
      case 2:
        text = '1.8k';
        break;
      case 3:
        text = '3.6k';
        break;
      case 4:
        text = '4.1k';
        break;
      case 5:
        text = '3k';
        break;
      case 6:
        text = '6.4k';
        break;
      default:
        return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  /// Height color of pillar
  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 10, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 8, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 9, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 12, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 7, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 8, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  /// Main Data Bar chart
  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;

            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;
              case 4:
                weekDay = 'Friday';
                break;
              case 5:
                weekDay = 'Saturday';
                break;
              case 6:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }

            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: TextStyle(
                    color: widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            getTitlesWidget: topTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            interval: 1,
            getTitlesWidget: leftTitles,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  /// leftTitles
  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;

    if (value == 0) {
      text = '0';
    } else if (value == 4) {
      text = '2K';
    } else if (value == 8) {
      text = '4K';
    } else if (value == 12) {
      text = '6K';
    } else if (value == 16) {
      text = '8K';
    } else if (value == 20) {
      text = '10K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  /// Bottom Week Day text
  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Sat', style: style);
        break;
      case 1:
        text = const Text('Sun', style: style);
        break;
      case 2:
        text = const Text('Mon', style: style);
        break;
      case 3:
        text = const Text('Tue', style: style);
        break;
      case 4:
        text = const Text('Wed', style: style);
        break;
      case 5:
        text = const Text('Thu', style: style);
        break;
      case 6:
        text = const Text('Fri', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  /// Random Data
  BarChartData randomData() {
    return BarChartData(
        // barTouchData: BarTouchData(
        //   enabled: false,
        // ),
        // titlesData: FlTitlesData(
        //   show: true,
        //   bottomTitles: AxisTitles(
        //     sideTitles: SideTitles(
        //       showTitles: true,
        //       getTitlesWidget: getTitles,
        //       reservedSize: 38,
        //     ),
        //   ),
        //   leftTitles: const AxisTitles(
        //     sideTitles: SideTitles(
        //       showTitles: false,
        //     ),
        //   ),
        //   topTitles: const AxisTitles(
        //     sideTitles: SideTitles(
        //       showTitles: false,
        //     ),
        //   ),
        //   rightTitles: const AxisTitles(
        //     sideTitles: SideTitles(
        //       showTitles: false,
        //     ),
        //   ),
        // ),
        // borderData: FlBorderData(
        //   show: false,
        // ),
        // barGroups: List.generate(7, (i) {
        //   switch (i) {
        //     case 0:
        //       return makeGroupData(
        //         0,
        //         Random().nextInt(15).toDouble() + 6,
        //         barColor: widget.availableColors[
        //             Random().nextInt(widget.availableColors.length)],
        //       );
        //     case 1:
        //       return makeGroupData(
        //         1,
        //         Random().nextInt(15).toDouble() + 6,
        //         barColor: widget.availableColors[
        //             Random().nextInt(widget.availableColors.length)],
        //       );
        //     case 2:
        //       return makeGroupData(
        //         2,
        //         Random().nextInt(15).toDouble() + 6,
        //         barColor: widget.availableColors[
        //             Random().nextInt(widget.availableColors.length)],
        //       );
        //     case 3:
        //       return makeGroupData(
        //         3,
        //         Random().nextInt(15).toDouble() + 6,
        //         barColor: widget.availableColors[
        //             Random().nextInt(widget.availableColors.length)],
        //       );
        //     case 4:
        //       return makeGroupData(
        //         4,
        //         Random().nextInt(15).toDouble() + 6,
        //         barColor: widget.availableColors[
        //             Random().nextInt(widget.availableColors.length)],
        //       );
        //     case 5:
        //       return makeGroupData(
        //         5,
        //         Random().nextInt(15).toDouble() + 6,
        //         barColor: widget.availableColors[
        //             Random().nextInt(widget.availableColors.length)],
        //       );
        //     case 6:
        //       return makeGroupData(
        //         6,
        //         Random().nextInt(15).toDouble() + 6,
        //         barColor: widget.availableColors[
        //             Random().nextInt(widget.availableColors.length)],
        //       );
        //     default:
        //       return throw Error();
        //   }
        // }),
        // gridData: const FlGridData(show: false),
        );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}
