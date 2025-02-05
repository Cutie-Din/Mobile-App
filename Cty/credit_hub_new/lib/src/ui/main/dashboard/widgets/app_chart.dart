import 'package:credit_hub_new/src/utils/app_export.dart';

List<Color> gradientColors = [
  const Color(0x33FF4A4A),
  AppColors.button,
];

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontFamily: 'Public Sans',
    fontWeight: FontWeight.w400,
    fontSize: 8,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('1', style: style);
      break;
    case 1:
      text = const Text('2', style: style);
      break;
    case 2:
      text = const Text('3', style: style);
      break;
    case 3:
      text = const Text('4', style: style);
      break;
    case 4:
      text = const Text('5', style: style);
      break;
    case 5:
      text = const Text('6', style: style);
      break;
    case 6:
      text = const Text('7', style: style);
      break;
    case 7:
      text = const Text('8', style: style);
      break;
    case 8:
      text = const Text('9', style: style);
      break;
    case 9:
      text = const Text('10', style: style);
      break;
    case 10:
      text = const Text('11', style: style);
      break;
    case 11:
      text = const Text('12', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontFamily: 'Public Sans',
    fontWeight: FontWeight.w400,
    fontSize: 6,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '0';
      break;
    case 2:
      text = '1';
      break;
    case 3:
      text = '2';
      break;
    case 4:
      text = '3';
      break;
    case 5:
      text = '4';
      break;
    case 6:
      text = '5';
      break;
    case 7:
      text = '6';
      break;
    case 8:
      text = '7';
      break;
    case 9:
      text = '8';
      break;
    case 10:
      text = '9';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}

LineChartData mainData() {
  return LineChartData(
    lineTouchData: const LineTouchData(enabled: false),
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      drawHorizontalLine: true,
      horizontalInterval: 0.5,
      verticalInterval: 1.0,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.grey.withOpacity(0.2),
          strokeWidth: 0.3, // Độ dày đường lưới
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.grey.withOpacity(0.2),
          strokeWidth: 0.3,
        );
      },
    ),
    titlesData: const FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 20, // Giảm khoảng cách
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 12,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(
        left: BorderSide.none,
        bottom: BorderSide.none,
        right: BorderSide.none,
        top: BorderSide.none,
      ),
    ),
    minX: 0,
    maxX: 11,
    minY: 1,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
        ],
        isCurved: true,
        color: AppColors.primary,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
          getDotPainter: (FlSpot spot, double xPercentage, LineChartBarData bar, int index) {
            return FlDotCirclePainter(
              radius: 3,
              color: AppColors.primary,
            );
          },
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          applyCutOffY: true,
          cutOffY: 0,
        ),
      ),
    ],
  );
}

LineChartData avgData() {
  return LineChartData(
    lineTouchData: const LineTouchData(enabled: false),
    titlesData: const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: bottomTitleWidgets,
          interval: 1,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 20,
          interval: 1,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(
        left: BorderSide(color: Color(0xff37434d), width: 2),
        bottom: BorderSide(color: Color(0xff37434d), width: 2),
        right: BorderSide.none,
        top: BorderSide.none,
      ),
    ),
    minX: 0,
    maxX: 11,
    minY: 1,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3.44),
          FlSpot(2.6, 3.44),
          FlSpot(4.9, 3.44),
          FlSpot(6.8, 3.44),
          FlSpot(8, 3.44),
          FlSpot(9.5, 3.44),
          FlSpot(11, 3.44),
        ],
        isCurved: true,
        color: AppColors.primary,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
          getDotPainter: (FlSpot spot, double xPercentage, LineChartBarData bar, int index) {
            return FlDotCirclePainter(
              radius: 3,
              color: AppColors.primary,
            );
          },
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          applyCutOffY: true,
          cutOffY: 0,
        ),
      ),
    ],
  );
}
