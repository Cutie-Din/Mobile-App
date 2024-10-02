import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 1)
class Transaction extends HiveObject {
  @HiveField(0)
  final int ma_nguoi_dung;

  @HiveField(1)
  final String category;

  @HiveField(2)
  final int amount;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String note;

  @HiveField(5)
  final int iconCode; // New field

  Transaction({
    required this.ma_nguoi_dung,
    required this.amount,
    required this.date,
    required this.note,
    required this.category,
    required this.iconCode,
  });
}
