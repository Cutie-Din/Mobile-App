import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/transaction.dart';

class StatExpense extends StatefulWidget {
  final int maNguoiDung;

  const StatExpense({super.key, required this.maNguoiDung});

  final Color leftBarColor = AppColors.error; // Keep left bar color

  @override
  State<StatefulWidget> createState() => _StatExpenseState();
}

class _StatExpenseState extends State<StatExpense> {
  final double width = 7;
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;
  int touchedGroupIndex = -1;
  bool showDetails = false; // Track whether to show transaction details

  @override
  void initState() {
    super.initState();
    loadExpenseData();
  }

  void loadExpenseData() {
    final transactionsBox = Hive.box<Transaction>('transactions');
    final chiTransactions = transactionsBox.values
        .where((transaction) =>
            transaction.ma_nguoi_dung == widget.maNguoiDung &&
            transaction.category.split('-').first.trim() == 'Chi')
        .toList();

    // Initialize all months with 0 expenses
    final expensesByMonth = <String, double>{
      '01/2024': 0,
      '02/2024': 0,
      '03/2024': 0,
      '04/2024': 0,
      '05/2024': 0,
      '06/2024': 0,
      '07/2024': 0,
      '08/2024': 0,
      '09/2024': 0,
      '10/2024': 0,
      '11/2024': 0,
      '12/2024': 0,
    };

    // Group expenses by month
    for (var transaction in chiTransactions) {
      final month = DateFormat('MM/yyyy').format(transaction.date);
      expensesByMonth.update(
        month,
        (value) => value + transaction.amount.toDouble(),
      );
    }

    // Generate bar groups for each month
    rawBarGroups = expensesByMonth.entries.map((entry) {
      int x = DateFormat('MM/yyyy').parse(entry.key).month;
      return makeGroupData(x, entry.value); // Only display expenses (left bar)
    }).toList();

    showingBarGroups = rawBarGroups;
  }

  // Method to calculate percentage distribution by category
  Map<String, double> calculateCategoryPercentages() {
    final transactionsBox = Hive.box<Transaction>('transactions');
    final chiTransactions = transactionsBox.values
        .where((transaction) =>
            transaction.ma_nguoi_dung == widget.maNguoiDung &&
            transaction.category.split('-').first.trim() == 'Chi')
        .toList();

    // Total expenses
    double totalExpenses = chiTransactions.fold(
      0,
      (sum, transaction) => sum + transaction.amount,
    );

    // Calculate percentage per category
    final Map<String, double> categoryPercentages = {};
    for (var transaction in chiTransactions) {
      final category = transaction.category;
      categoryPercentages.update(
        category,
        (value) => value + transaction.amount / totalExpenses,
        ifAbsent: () => transaction.amount / totalExpenses,
      );
    }

    return categoryPercentages;
  }

  @override
  Widget build(BuildContext context) {
    final categoryPercentages = calculateCategoryPercentages();

    return Scaffold(
      body: PageView(
        children: [
          buildBarChart(), // First state: Show bar chart
          buildTransactionDetails(
              categoryPercentages), // Second state: Show details
        ],
        controller: PageController(initialPage: showDetails ? 1 : 0),
      ),
    );
  }

  Widget buildBarChart() {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.lightBlue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: BarChart(
                  BarChartData(
                    maxY: 20000000, // Adjust based on your max expense
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipItem: (a, b, c, d) => null,
                      ),
                      touchCallback: (FlTouchEvent event, response) {
                        if (response == null || response.spot == null) {
                          setState(() {
                            touchedGroupIndex = -1;
                            showingBarGroups = List.of(rawBarGroups);
                          });
                          return;
                        }

                        touchedGroupIndex = response.spot!.touchedBarGroupIndex;
                        setState(() {
                          if (!event.isInterestedForInteractions) {
                            touchedGroupIndex = -1;
                            showingBarGroups = List.of(rawBarGroups);
                            return;
                          }
                          showingBarGroups = List.of(rawBarGroups);
                        });
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: bottomTitles,
                          reservedSize: 42,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          interval: 5000, // Adjust intervals based on your data
                          getTitlesWidget: leftTitles,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    barGroups: showingBarGroups,
                    gridData: FlGridData(show: false),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTransactionDetails(Map<String, double> categoryPercentages) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.lightBlue.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: categoryPercentages.entries.map((entry) {
            final percentage = (entry.value * 100).toStringAsFixed(2);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('${entry.key} - $percentage%'),
                    ),
                    LinearPercentIndicator(
                      lineHeight: 20.0,
                      percent: entry.value,
                      backgroundColor: Colors.grey[300]!,
                      progressColor: AppColors.error,
                      barRadius: const Radius.circular(8),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwItems,
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 5000000) {
      text = '5M';
    } else if (value == 10000000) {
      text = '10M';
    } else if (value == 15000000) {
      text = '15M';
    } else if (value == 20000000) {
      text = '20M';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>[
      '01',
      '02',
      '03',
      '04',
      '05',
      '06',
      '07',
      '08',
      '09',
      '10',
      '11',
      '12'
    ];

    if (value < 1 || value > 12) {
      return Container(); // In case the value is out of range
    }

    final Widget text = Text(
      titles[value.toInt() - 1], // Adjusting for 1-based month
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double leftBarY) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: leftBarY,
          color: widget.leftBarColor,
          width: width,
        ),
      ],
    );
  }
}
