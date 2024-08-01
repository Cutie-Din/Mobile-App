import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class Iconscreen extends StatefulWidget {
  final IconData? initialIcon;
  final String? initialTitle;

  const Iconscreen({super.key, this.initialIcon, this.initialTitle});

  @override
  State<Iconscreen> createState() => _IconscreenState();
}

class _IconscreenState extends State<Iconscreen> {
  PageController _pageController = PageController();
  String selectedText = AppTexts.deposit;
  IconData? selectedIcon; // Track the selected icon
  String? selectedTitle; // Track the selected title

  @override
  void initState() {
    super.initState();
    // Set initial selection based on passed parameters
    selectedIcon = widget.initialIcon;
    selectedTitle = widget.initialTitle;
  }

  void _onPageChanged(int index) {
    setState(() {
      switch (index) {
        case 0:
          selectedText = AppTexts.deposit;
          break;
        case 1:
          selectedText = AppTexts.income;
          break;
      }
    });
  }

  void _onTextTap(String text, int index) {
    setState(() {
      selectedText = text;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _selectIcon(IconData icon, String title) {
    setState(() {
      selectedIcon = icon;
      selectedTitle = title;
    });
    Navigator.pop(context, {'icon': icon, 'title': title});
  }

  Widget _buildIconTile(IconData icon, String title) {
    return GestureDetector(
      onTap: () => _selectIcon(icon, title),
      child: ListTile(
        leading: FaIcon(icon),
        title: Text(title),
        trailing: selectedIcon == icon
            ? Icon(Icons.check, color: AppColors.primary)
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppBar(
          leading: IconButton(
            icon: FaIcon(FontAwesomeIcons.x),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Chọn nhóm",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          backgroundColor: AppColors.grey,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _onTextTap(AppTexts.deposit, 0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: selectedText == AppTexts.deposit
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedText == AppTexts.deposit
                              ? Colors.transparent
                              : AppColors.primary,
                          width: 3,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        AppTexts.deposit,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: selectedText == AppTexts.deposit
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _onTextTap(AppTexts.income, 1),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: selectedText == AppTexts.income
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedText == AppTexts.income
                              ? Colors.transparent
                              : AppColors.primary,
                          width: 3,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        AppTexts.income,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: selectedText == AppTexts.income
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppColors.primary,
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: ListView(
                              children: [
                                _buildIconTile(
                                    FontAwesomeIcons.burger, "Ăn uống"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.car, "Di chuyển"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.futbol, "Thể thao"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.cat, "Vật nuôi"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.gamepad, "Vui - chơi"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.notesMedical, "Sức khoẻ"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.receipt, "Hoá đơn"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.seedling, "Đầu tư"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.carBurst, "Bảo hiểm"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.bars, "Dịch vụ"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(FontAwesomeIcons.boxesStacked,
                                    "Chi phí khác"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.school, "Giáo dục"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.handHoldingHeart,
                                    "Quà tặng & quyên góp"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.users, "Trả nợ"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.restroom, "Cho vay"),
                              ],
                            ),
                          ),
                        );

                      case 1:
                        return Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppColors.primary,
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: ListView(
                              children: [
                                _buildIconTile(
                                    FontAwesomeIcons.moneyBill, "Lương"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.percent, "Thu lãi"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.dropbox, "Thu nhập khác"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.wallet, "Tiền chuyển đến"),
                                Divider(
                                  height: AppSizes.spaceBtwInputFields,
                                  color: AppColors.primary,
                                ),
                                _buildIconTile(
                                    FontAwesomeIcons.handshake, "Vay nợ"),
                              ],
                            ),
                          ),
                        );
                      default:
                        return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
