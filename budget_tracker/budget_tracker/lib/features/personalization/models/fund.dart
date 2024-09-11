import 'package:hive/hive.dart';

part 'fund.g.dart';

@HiveType(typeId: 0)
class Fund extends HiveObject {
  @HiveField(0)
  final int ma_nguoi_dung;

  @HiveField(1)
  final String category;

  @HiveField(2)
  int amount;

  @HiveField(3)
  final int iconCode;

  Fund({
    required this.ma_nguoi_dung,
    required this.amount,
    required this.category,
    required this.iconCode,
  });
}
