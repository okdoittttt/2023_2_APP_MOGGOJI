import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:moggoji/resources/color_extensions.dart';
import '../resources/colors.dart';
import 'indicator.dart';

class ShowChartOx extends StatefulWidget {
  final int answerOCount;
  final int answerXCount;

  ShowChartOx({
    Key? key,
    required this.answerOCount,
    required this.answerXCount
  })
  : super(key: key);

  @override
  State<ShowChartOx> createState() => _ShowChartOxState();
}

class _ShowChartOxState extends State<ShowChartOx> {
  int touchedIndex = -1;

  double oNum = 0;
  double xNum = 0;

  @override
  Widget build(BuildContext context) {
    double sum = widget.answerOCount.toDouble() + widget.answerXCount.toDouble();
    oNum = (widget.answerOCount.toDouble() / sum * 100).roundToDouble();
    xNum = (widget.answerXCount.toDouble() / sum * 100).roundToDouble();

    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: AppColors.contentColorCyan.darken(50),
                text: 'O',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: AppColors.contentColorOrange,
                text: 'X',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorCyan.darken(50),
            value: oNum,
            title: '$oNum%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorOrange,
            value: xNum,
            title: '$xNum%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}