import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:finance/import.dart';

// class BottomMenu extends StatefulWidget {
//   const BottomMenu({super.key});

//   @override
//   State<BottomMenu> createState() => _BottomMenuState();
// }

// class _BottomMenuState extends State<BottomMenu> {
//   int _page = 0;
//   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

//   // Tracking notification and account new content
//   bool _hasNewNotifications = true; // Initially true, indicating new notifications
//   bool _hasNewMessages = true; // Initially true, indicating new messages

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<NavigationBloc, NavigationState>(
//         builder: (context, state) {
//           if (state is DashboardScreenState) {
//             return DashboardScreen(); // Replace with your actual dashboard screen
//           } else if (state is HistoryScreenState) {
//             return HistoryScreen(); // Replace with your actual history screen
//           } else if (state is AddScreenState) {
//             return AddScreen();
//           } else if (state is NotificationScreenState) {
//             return NotificationScreen(); // Replace with your actual notification screen
//           } else if (state is AccountScreenState) {
//             return AccountScreen(); // Replace with your actual account screen
//           }
//           return Container(); // Default fallback
//         },
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         key: _bottomNavigationKey,
//         index: _page,
//         items: <Widget>[
//           Icon(
//             _page == 0 ? CupertinoIcons.house_fill : CupertinoIcons.house,
//             size: 30,
//             color: AppColors.main,
//           ),
//           Icon(
//             _page == 1 ? CupertinoIcons.square_favorites_fill : CupertinoIcons.square_favorites,
//             size: 30,
//             color: AppColors.main,
//           ),
//           Icon(
//             _page == 2 ? CupertinoIcons.add : CupertinoIcons.add,
//             size: 30,
//             color: AppColors.main,
//           ),
//           // Bell icon with red dot if there are new notifications
//           Stack(
//             children: [
//               Icon(
//                 _page == 3 ? CupertinoIcons.bell_fill : CupertinoIcons.bell,
//                 size: 30,
//                 color: AppColors.main,
//               ),
//               if (_hasNewNotifications)
//                 Positioned(
//                   right: 0,
//                   top: 0,
//                   child: Container(
//                     width: 8,
//                     height: 8,
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           // Person icon with red dot if there are new messages
//           Stack(
//             children: [
//               Icon(
//                 _page == 4 ? CupertinoIcons.person_fill : CupertinoIcons.person,
//                 size: 30,
//                 color: AppColors.main,
//               ),
//               if (_hasNewMessages)
//                 Positioned(
//                   right: 0,
//                   top: 0,
//                   child: Container(
//                     width: 8,
//                     height: 8,
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ],
//         color: AppColors.bg,
//         buttonBackgroundColor: AppColors.bg,
//         backgroundColor: AppColors.main,
//         animationCurve: Curves.easeInOut,
//         animationDuration: const Duration(milliseconds: 400),
//         onTap: (index) {
//           setState(() {
//             _page = index;
//             // Hide notification dot if bell or person icon is tapped
//             if (index == 3) {
//               _hasNewNotifications = false; // Remove red dot from bell
//             } else if (index == 4) {
//               _hasNewMessages = false; // Remove red dot from person
//             }
//           });
//           // Handle navigation based on index
//           if (index == 0) {
//             context.read<NavigationBloc>().add(NavigateToDashboard());
//           } else if (index == 1) {
//             context.read<NavigationBloc>().add(NavigateToHistory());
//           } else if (index == 2) {
//             context.read<NavigationBloc>().add(NavigateToAdd());
//           } else if (index == 3) {
//             context.read<NavigationBloc>().add(NavigateToNotification());
//           } else if (index == 4) {
//             context.read<NavigationBloc>().add(NavigateToAccount());
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:finance/import.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _bottomNavIndex = 0; // Current selected index

  // Define the icons for the bottom navigation bar
  final List<Map<String, dynamic>> iconList = [
    {'icon': Icons.home, 'label': 'Trang chủ'}, // Icon for Dashboard
    {'icon': Icons.history, 'label': 'Lịch sử'}, // Icon for History
    {'icon': Icons.notifications, 'label': 'Thông báo'}, // Icon for Notifications
    {'icon': Icons.person, 'label': 'Tài khoản'}, // Icon for Account
  ];

  // List of screens corresponding to each icon
  final List<Widget> _screens = [
    const DashboardScreen(), // Replace with your actual screen widgets
    const HistoryScreen(),
    const NotificationScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_bottomNavIndex], // Display the current screen based on the selected index
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the AddScreen when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddScreen()), // Replace with your AddScreen widget
          );
        },
        backgroundColor: AppColors.main, // Set the background color
        child: const Icon(
          Icons.add,
          color: AppColors.bg,
          size: AppFonts.fontSize24, // Increase icon size to match the larger button
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners to match the button's shape
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final iconData = iconList[index]['icon'];
          final label = iconList[index]['label'];

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: AppFonts.fontSize24,
                color: isActive ? AppColors.main : Colors.grey, // Handle active/inactive color
              ),
              const SizedBox(height: 4), // Space between icon and text
              Text(
                label,
                style: TextStyle(
                  color:
                      isActive ? AppColors.main : Colors.grey, // Handle active/inactive text color
                  fontSize: AppFonts.fontSize12,
                  fontFamily: "Inter",
                  fontWeight: AppFonts.semiBold,
                ),
              ),
            ],
          );
        },
        activeIndex: _bottomNavIndex, // Set the active index
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 25,
        rightCornerRadius: 25,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index; // Update current index on tap
          });
        },
        backgroundColor: Colors.white, // Background color of the bottom navigation bar
      ),
    );
  }
}
