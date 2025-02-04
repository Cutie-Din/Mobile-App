import 'package:credit_hub_new/src/utils/app_export.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  PageController controller = PageController(initialPage: 0);
  var selected = 0;
  bool showNotificationBadge = true;
  bool showAccountBadge = true;
  bool showContainer = false;

  Widget buildBottomBarItem({
    required String assetPath,
    required bool showBadge,
    required bool isSelected,
  }) {
    final Color iconColor = isSelected ? AppColors.primary : AppColors.grey9;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          assetPath,
          width: 18, // Kích thước của icon SVG
          height: 18,
          color: iconColor, // Apply selected/unselected color
        ),
        if (showBadge)
          Positioned(
            top: -2,
            right: -1.5,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: const Color(0xFFFF4A4A),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1), // Add white border
              ),
              constraints: const BoxConstraints(minWidth: 6, minHeight: 6),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const DashboardScreen(),
          const HistoryScreen(),
          Container(),
          const NotificationScreen(),
          const AccountScreen(),
        ],
      ),
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 10),
        child: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: StylishBottomBar(
                option: AnimatedBarOptions(
                  iconStyle: IconStyle.Default,
                ),
                items: [
                  BottomBarItem(
                    icon: buildBottomBarItem(
                      assetPath: AppImages.menu_dashboard,
                      showBadge: false,
                      isSelected: selected == 0,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Trang chủ',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    selectedColor: AppColors.primary,
                    unSelectedColor: AppColors.grey9,
                  ),
                  BottomBarItem(
                    icon: buildBottomBarItem(
                      assetPath: AppImages.menu_history,
                      showBadge: false,
                      isSelected: selected == 1,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Lịch sử',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    selectedColor: AppColors.primary,
                    unSelectedColor: AppColors.grey9,
                  ),
                  BottomBarItem(
                    icon: buildBottomBarItem(
                      assetPath: AppImages.menu_nothing,
                      showBadge: showContainer,
                      isSelected: selected == 2,
                    ),
                    title: const Text(' '),
                    unSelectedColor: Colors.white,
                  ),
                  BottomBarItem(
                    icon: buildBottomBarItem(
                      assetPath: AppImages.menu_notification,
                      showBadge: showNotificationBadge,
                      isSelected: selected == 3,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Thông báo',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    selectedColor: AppColors.primary,
                    unSelectedColor: AppColors.grey9,
                  ),
                  BottomBarItem(
                    icon: buildBottomBarItem(
                      assetPath: AppImages.menu_account,
                      showBadge: showAccountBadge,
                      isSelected: selected == 4,
                    ),
                    title: const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Tài khoản',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    selectedColor: AppColors.primary,
                    unSelectedColor: AppColors.grey9,
                  ),
                ],
                currentIndex: selected,
                onTap: (index) {
                  setState(() {
                    if (index == 2) {
                      // Get.toNamed(RouteHelper.getAddRoute());
                      return;
                    }
                    selected = index;
                    controller.jumpToPage(index);

                    if (index == 3) showNotificationBadge = false;
                    if (index == 4) showAccountBadge = false;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
