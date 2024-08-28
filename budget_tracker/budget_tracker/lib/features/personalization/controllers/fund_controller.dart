import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/fund.dart';
import '../models/transaction.dart';

class FundController extends GetxController {
  var selectedFundAmount = RxnInt(); // Nullable using RxnInt
  late int maNguoiDung;

  @override
  void onInit() {
    super.onInit();
    loadSelectedFundAmount();
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

  // New method to update fund amount based on transaction type
  void updateFundAmount(Transaction transaction) {
    if (selectedFundAmount.value != null) {
      if (transaction.category.startsWith("Thu")) {
        // If the transaction is an income, add the amount
        selectedFundAmount.value =
            selectedFundAmount.value! + transaction.amount;
      } else if (transaction.category.startsWith("Chi")) {
        // If the transaction is an expense, subtract the amount
        selectedFundAmount.value =
            selectedFundAmount.value! - transaction.amount;
      }
      saveSelectedFundAmount(); // Save the updated amount
    }
  }
}
