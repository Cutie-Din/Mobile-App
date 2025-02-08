import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:credit_hub_new/src/utils/app_export.dart';

class ViRefreshString implements RefreshString {
  var a = 'vi';

  @override
  String? canLoadingText = 'Thả để tải thêm';

  @override
  String? canRefreshText = 'Thả để làm mới';

  @override
  String? canTwoLevelText = 'Thả để đến tầng hai';

  @override
  String? idleLoadingText = 'Kéo lên để tải thêm';

  @override
  String? idleRefreshText = 'Kéo xuống để làm mới';

  @override
  String? loadFailedText = 'Tải thất bại';

  @override
  String? loadingText = 'Đang tải...';

  @override
  String? noMoreText = '';

  @override
  String? refreshCompleteText = 'Làm mới hoàn thành';

  @override
  String? refreshFailedText = 'Làm mới thất bại';

  @override
  String? refreshingText = 'Đang làm mới';
}

class CustomRefreshLocalizations extends RefreshLocalizations {
  CustomRefreshLocalizations(Locale locale) : super(locale);

  @override
  RefreshString get currentLocalization => ViRefreshString();
}

class PullToRefreshVnDelegate extends LocalizationsDelegate<RefreshLocalizations> {
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<RefreshLocalizations> load(Locale locale) {
    return SynchronousFuture<RefreshLocalizations>(CustomRefreshLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<RefreshLocalizations> old) => true;
}
