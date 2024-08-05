import 'package:hive/hive.dart';

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

  @HiveField(5)
  final String ma_nguoi_dung; // New field

  Transaction({
    required this.amount,
    required this.date,
    required this.note,
    required this.category,
    required this.iconCode,
    required this.ma_nguoi_dung,
  });
}
