import 'package:hive/hive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  final int amount;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final String note;

  @HiveField(3)
  final String category;

  @HiveField(4)
  final int iconCode;

  Transaction({
    required this.amount,
    required this.date,
    required this.note,
    required this.category,
    required this.iconCode,
  });
}
