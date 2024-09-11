import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/fund.dart';
import '../models/transaction.dart';

class FundController extends GetxController {
  var selectedFundAmount = RxnInt(); // Nullable using RxnInt
  var totalBalance = 0.obs; // Observable for total balance
  var totalThuAmount = 0.obs; // Observable for total "Thu"
  var totalChiAmount = 0.obs; // Observable for total "Chi"
  late int maNguoiDung;
  late String category;

  @override
  void onInit() {
    super.onInit();
    loadSelectedFundAmount();
    calculateTotalBalance(); // Calculate total balance on init
    calculateTotalThuAmount(); // Calculate total "Thu" on init
    calculateTotalChiAmount(); // Calculate total "Chi" on init
  }

  // Method to calculate the total balance of all funds
  void calculateTotalBalance() async {
    var box = await Hive.openBox<Fund>('funds');
    totalBalance.value = box.values
        .where((fund) => fund.ma_nguoi_dung == maNguoiDung)
        .fold(0, (sum, fund) => sum + fund.amount);
  }

  void selectFund(Fund fund) {
    selectedFundAmount.value = fund.amount;
    saveSelectedFundAmount();
  }

  void saveSelectedFundAmount() async {
    var box = await Hive.openBox('selected_fund');
    box.put('fundAmount_$maNguoiDung', selectedFundAmount.value);
  }

  void loadSelectedFundAmount() async {
    var box = await Hive.openBox('selected_fund');
    selectedFundAmount.value =
        box.get('fundAmount_$maNguoiDung', defaultValue: 0);
  }

  // Method to calculate the total "Thu" (Income)
  void calculateTotalThuAmount() async {
    var box = await Hive.openBox<Transaction>('transactions');
    totalThuAmount.value = box.values
        .where((transaction) =>
            transaction.ma_nguoi_dung == maNguoiDung &&
            transaction.category.startsWith("Thu")) // Corrected to "Thu"
        .fold(0, (sum, transaction) => sum + transaction.amount);
  }

  // Method to calculate the total "Chi" (Expense)
  void calculateTotalChiAmount() async {
    var box = await Hive.openBox<Transaction>('transactions');
    totalChiAmount.value = box.values
        .where((transaction) =>
            transaction.ma_nguoi_dung == maNguoiDung &&
            transaction.category.startsWith("Chi")) // Corrected to "Chi"
        .fold(0, (sum, transaction) => sum + transaction.amount);
  }

  // Existing methods (e.g., calculateTotalBalance, updateFundAmount)

  // Method to update the fund amount based on transaction type
  void updateFundAmount(Transaction transaction, Fund selectedFund) async {
    if (selectedFundAmount.value != null) {
      var box = await Hive.openBox<Fund>('funds');
      var fundToUpdate = box.values.firstWhere(
        (fund) =>
            fund.ma_nguoi_dung == maNguoiDung &&
            fund.category == selectedFund.category,
      );

      if (transaction.category.startsWith("Thu")) {
        // Add amount for income
        fundToUpdate.amount += transaction.amount;
      } else if (transaction.category.startsWith("Chi")) {
        // Subtract amount for expense
        fundToUpdate.amount -= transaction.amount;
      }

      await fundToUpdate.save(); // Save updated fund
      calculateTotalBalance(); // Recalculate total balance after update
      calculateTotalThuAmount(); // Recalculate total Thu
      calculateTotalChiAmount(); // Recalculate total Chi
      saveSelectedFundAmount(); // Save selected fund amount
    }
  }
}
