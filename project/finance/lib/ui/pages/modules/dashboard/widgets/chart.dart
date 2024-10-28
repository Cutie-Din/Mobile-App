import 'package:finance/import.dart';
import 'package:fl_chart/fl_chart.dart'; // Ensure to import fl_chart

class ChartDashBoard extends StatefulWidget {
  const ChartDashBoard({super.key});

  @override
  State<ChartDashBoard> createState() => _ChartDashBoardState();
}

class _ChartDashBoardState extends State<ChartDashBoard> {
  // Sample data for the chart (one data point for each month)
  final List<FlSpot> data = [
    FlSpot(0, 5), // Tháng 1
    FlSpot(1, 8), // Tháng 2
    FlSpot(2, 3), // Tháng 3
    FlSpot(3, 10), // Tháng 4
    FlSpot(4, 7), // Tháng 5
    FlSpot(5, 12), // Tháng 6
    FlSpot(6, 9), // Tháng 7
    FlSpot(7, 15), // Tháng 8
    FlSpot(8, 11), // Tháng 9
    FlSpot(9, 14), // Tháng 10
    FlSpot(10, 13), // Tháng 11
    FlSpot(11, 20), // Tháng 12
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20), // Optional padding
      child: Column(
        children: [
          Center(
            child: const Text(
              'Doanh số gần đây', // Chart title
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20), // Space between title and chart
          SizedBox(
            height: 300, // Height of the chart
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toString(), // Display Y values
                          style: const TextStyle(fontSize: 12),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        // Display month labels
                        switch (value.toInt()) {
                          case 0:
                            return const Text('Tháng 1');
                          case 1:
                            return const Text('Tháng 2');
                          case 2:
                            return const Text('Tháng 3');
                          case 3:
                            return const Text('Tháng 4');
                          case 4:
                            return const Text('Tháng 5');
                          case 5:
                            return const Text('Tháng 6');
                          case 6:
                            return const Text('Tháng 7');
                          case 7:
                            return const Text('Tháng 8');
                          case 8:
                            return const Text('Tháng 9');
                          case 9:
                            return const Text('Tháng 10');
                          case 10:
                            return const Text('Tháng 11');
                          case 11:
                            return const Text('Tháng 12');
                          default:
                            return const Text('');
                        }
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d), width: 1),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: data, // Chart data points
                    isCurved: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
