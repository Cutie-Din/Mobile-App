// List of Constants used in APIs
class ApiConstants {
  static const String baseUrl = 'http://qltcapi.tasvietnam.vn/api';
  static _Auth auth = _Auth();
}

class _Auth {
  final String register = '/user/Register';
  final String login = '/user/login';
}
