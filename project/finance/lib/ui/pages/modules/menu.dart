import 'package:finance/import.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({
    super.key,
  });

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() => [
        DashboardScreen(),
        HistoryScreen(),
        Container(),
        NotificationScreen(),
        AccountScreen(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: "Trang chủ",
          activeColorPrimary: AppColors.active,
          inactiveColorPrimary: AppColors.inactive,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.history),
          title: "Lịch sử",
          activeColorPrimary: AppColors.active,
          inactiveColorPrimary: AppColors.inactive,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.add,
            color: AppColors.bg,
          ),
          activeColorPrimary: AppColors.active,
          inactiveColorPrimary: AppColors.inactive,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.notifications),
          title: "Thông báo",
          activeColorPrimary: AppColors.active,
          inactiveColorPrimary: AppColors.inactive,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: "Tài khoản",
          activeColorPrimary: AppColors.active,
          inactiveColorPrimary: AppColors.inactive,
        ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          onItemSelected: (index) {
            if (index == 2) {
              // Khi bấm nút "Add" (index 2), điều hướng tới trang mới
              Navigator.pushNamed(context, '/third'); // Sử dụng Navigator để đẩy màn hình
            }
          },
          stateManagement: true,
          hideNavigationBarWhenKeyboardAppears: true,
          padding: const EdgeInsets.only(top: 10),
          backgroundColor: Colors.white,
          navBarHeight: kBottomNavigationBarHeight,
          navBarStyle: NavBarStyle.style15,
        ),
      );
}
